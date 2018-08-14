import logging
import uuid

from pyramid_simpleform import Form
from pyramid_simpleform.renderers import FormRenderer
from pyramid.view import (
    view_config,
    forbidden_view_config,
)
from pyramid.security import (
    remember,
    forget,
)
from pyramid.httpexceptions import HTTPFound
from pyramid_mailer.message import Message
from sqlalchemy.exc import SQLAlchemyError

from ..models.user import User
from ..security import check_password, hash_password
from ..schemes.user import (
    CreateUserSchema,
    RestoreUserSchema,
    RestoreUserPasswordSchema,
)
from ..enums.groups import Groups

log = logging.getLogger(__name__)


@view_config(route_name='create_account',
             renderer='../templates/create_account.mako')
def create_account_view(request):
    form = Form(request,
                schema=CreateUserSchema())

    if form.validate():
        token = uuid.uuid4().hex
        url = request.route_url('confirm_account', token=token)
        mail_message = "You confirm link for registration on eschool\n{}\nif you accidently get this mail you can ignore it".format(url)
        user = User()
        form.bind(user)
        user.token = token
        user.password = hash_password(user.password)

        if not request.dbsession.query(User).filter(
                User.email == user.email).first():
            request.dbsession.add(user)
        else:
            request.session.flash("danger; User excist")
            return {
                'form': FormRenderer(form),
                }

        mailer = request.mailer

        message = Message(
            subject="Eschool, create account",
            sender="eschool@randomneo.me",
            recipients=[user.email],
            body=mail_message
        )

        mailer.send(message)
        try:
            request.dbsession.flush()
        except SQLAlchemyError as e:
            log.exception(e)
            return HTTPFound('/')

        request.session.flash("success; User created. Activate your mail")
        return HTTPFound(request.route_path('home'))

    return {
        'form': FormRenderer(form),
    }


@view_config(route_name='confirm_account')
def confirm_account_view(request):
    user = request.dbsession.query(User).filter(User.token == request.matchdict['token']).first()
    user.group = Groups.student
    user.activated = True
    user.token = None
    request.session.flash('success; Account activated')

    return HTTPFound(request.route_path('home'))


@view_config(route_name='restore_account',
             renderer='../templates/restore_account.mako')
def restore_account_view(request):
    form = Form(request,
                schema=RestoreUserSchema)

    if form.validate():
        token = uuid.uuid4().hex
        url = request.route_url('restore_password', token=token)
        mail_message = "Restore password with link\n{}\nif you accidently get this mail you can ignore it".format(url)

        user = User()
        form.bind(user)
        user = request.dbsession.query(User).filter(User.email == user.email).first()
        log.debug(user)
        if user is None:
            request.session.flash('warning; Cand find user with that username or email')
            return {
                'form': FormRenderer(form),
            }
        if user.group == Groups.admin:
            request.session.flash('warning; admin cant restore password you need to use sever scripts to delete admin and create new one')
            return HTTPFound(request.route_path('home'))

        user.token = token

        mailer = request.mailer

        message = Message(
            subject="Eschool, create account",
            sender="eschool@randomneo.me",
            recipients=[user.email],
            body=mail_message
        )

        mailer.send(message)

        request.session.flash("success; Message with restore link sent")
        return HTTPFound(request.route_path('home'))

    return {
        'form': FormRenderer(form),
    }


@view_config(route_name='restore_password',
             renderer='../templates/restore_password.mako')
def restore_password_view(request):
    token = request.matchdict['token']
    form = Form(request,
                schema=RestoreUserPasswordSchema)
    user = request.dbsession.query(User).filter(User.token == token).first()
    if user is None:
        request.session.flash('danger; Token error try again or connect to developer')
        return HTTPFound(request.route_path('home'))


    if form.validate():
        item = User()
        form.bind(item)

        user.password = hash_password(item.password)
        user.token = None
        user.activated = True
        log.debug(user.password)
        request.dbsession.flush()
        request.session.flash('success; Password changed')
        return HTTPFound(request.route_path('home'))

    return {
        'form': FormRenderer(form),
    }
