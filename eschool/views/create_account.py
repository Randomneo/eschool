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
from ..schemes.user import CreateUserSchema

log = logging.getLogger(__name__)

@view_config(route_name='create_account',
             renderer='../templates/create_account.mako')
def create_account_view(request):
    form = Form(request,
                schema=CreateUserSchema())

    if form.validate():
        pass

    return {
        'form': FormRenderer(form),
    }


    """
    mailer = request.mailer

    message = Message(
        subject="Eschool, create account",
        sender="eschool@randomneo.me",
        recipients=['someuser@mail.com'],
        body="Message"
    )

    # mailer.send(message)
    """
    return {}
