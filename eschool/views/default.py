from pyramid.view import view_config

from ..models.user import User


@view_config(route_name='home', renderer='../templates/home.mako')
def my_view(request):
    users = request.dbsession.query(User)

    return {'users': users}


@view_config(route_name='list',
             renderer='../templates/list.mako',
             permission='edit')
def list_view(request):

    return {}
