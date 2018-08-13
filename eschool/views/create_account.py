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
from ..schemes.user import CreateUserSchema
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

        try:
            if not request.dbsession.query(User).filter(
                    User.username == user.username).first()\
                    and not request.dbsession.query(User).filter(
                        User.email == user.email).first():
                request.dbsession.add(user)
                request.dbsession.flush()
            else:
                request.session.flash("danger; User excist")
                return {
                    'form': FormRenderer(form),
                }
        except SQLAlchemyError as e:
            log.exception(e)
            return HTTPFound('/')

        mailer = request.mailer

        message = Message(
            subject="Eschool, create account",
            sender="eschool@randomneo.me",
            recipients=[user.email],
            body=mail_message
        )

        mailer.send(message)

        request.session.flash("success; User created. Activate your mail")
        return HTTPFound(request.route_path('home'))

    return {
        'form': FormRenderer(form),
    }


@view_config(route_name='confirm_account')
def confirm_account_view(request):
    user = request.dbsession.query(User).filter(User.token == request.matchdict['token']).first()
    user.group = Groups.moderator
    user.activated = True
    request.session.flash('success; Account activated')

    return HTTPFound(request.route_path('home'))

@view_config(route_name='restore_account',
             renderer='../templates/')
def restore_account_view():
    return {}
