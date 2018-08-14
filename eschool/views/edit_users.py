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


@view_config(route_name='edit_users',
             renderer='../templates/edit_users.mako',
             permission='edit_users')
def edit_users_view(request):

    return {}
