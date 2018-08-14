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
from pyramid.httpexceptions import (
    HTTPFound,
    HTTPOk,
)
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
    users = request.dbsession.query(User)\
                             .filter(User.group != Groups.admin)\
                             .order_by(User.username.asc())

    return {
        'users': users,
    }


@view_config(route_name='delete_user',
             permission='edit_users')
def delete_user_view(request):
    id = request.matchdict['id']

    try:
        request.dbsession.query(User).filter(User.id == id).delete()
        request.dbsession.flush()
    except SQLAlchemyError:
        request.session.flash('danger; Cant delete user')
        raise HTTPFound(request.route_path('edit_users'))

    request.session.flash('success; User deleted')
    return HTTPFound(request.route_path('edit_users'))
