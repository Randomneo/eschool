import logging

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

from ..models.user import User
from ..security import check_password
from ..schemes.user import UserSchema

log = logging.getLogger(__name__)


@view_config(route_name=u'login', renderer=u'../templates/login.mako')
@forbidden_view_config(renderer=u'../templates/login.mako')
def login(request):
    log.debug(request.authenticated_userid)
    if request.authenticated_userid:
        log.debug(request.route_path('user_settings'))
        return HTTPFound(request.route_path('user_settings'))

    form = Form(request,
                schema=UserSchema())

    login_url = request.resource_url(request.context, u'login')
    referrer = request.url
    if referrer == login_url:
        referrer = '/'  # never use the login form itself as came_from
    came_from = request.params.get(u'came_from', referrer)
    message = ''
    if form.validate():
        try:
            item = User()
            form.bind(item)
            user = request.dbsession.query(
                User).filter(User.username == item.username).first()
            if user is None:
                user = request.dbsession.query(
                    User).filter(User.email == item.username).first()

            if user is None or user.username is None:
                raise IndexError(u"Wrong username or password")
            if not user.activated:
                request.session.flash("warning; Activate your account")
                return HTTPFound(request.route_path('home'))

            db_password = user.password

            if check_password(db_password, item.password):
                headers = remember(request, user.username)
                return HTTPFound(location=came_from,
                                 headers=headers)
        except IndexError as e:
            message = "error {}".format(e)

    return {
        u'message': message,
        u'url': u'/'.join((request.application_url, 'login')),
        u'came_from': came_from,
        u'renderer': FormRenderer(form),
    }


@view_config(route_name=u'logout')
def logout(request):
    headers = forget(request)
    return HTTPFound(location=request.resource_url(request.context),
                     headers=headers)
