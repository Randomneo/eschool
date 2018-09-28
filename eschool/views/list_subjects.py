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
from ..models.shedule import Subject
from ..security import check_password, hash_password
from ..schemes.user import (
    CreateUserSchema,
    RestoreUserSchema,
    RestoreUserPasswordSchema,
)
from ..schemes.subject import CreateSubjectSchema
from ..enums.groups import Groups

log = logging.getLogger(__name__)


@view_config(route_name='list_subjects',
             renderer='../templates/list_subjects.mako',
             permission='edit_subjects')
def list_subjects(request):
    subjects = request.dbsession.query(Subject).order_by(Subject.name.asc())
    form = Form(request,
                schema=CreateSubjectSchema())

    return {
        'form': FormRenderer(form),
        'subjects': subjects,
    }
