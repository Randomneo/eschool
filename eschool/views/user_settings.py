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


@view_config(route_name='user_settings',
             renderer='../templates/user/user_settings.mako')
def user_settings_view(request):
    username = request.authenticated_userid
    user = request.dbsession.query(User).filter(User.username == username).first()

    return {
        'user': user,
    }
