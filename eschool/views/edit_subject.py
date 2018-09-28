import logging
from pyramid.view import view_config
from pyramid.httpexceptions import HTTPFound, HTTPNotFound
from sqlalchemy.exc import SQLAlchemyError
from pyramid_simpleform import Form

from ..models.shedule import Subject
from ..schemes.subject import CreateSubjectSchema

log = logging.getLogger(__name__)


@view_config(route_name='create_subject',
             permission='edit_subjects',
             renderer='json')
def create_subject(request):
    form = Form(request, schema=CreateSubjectSchema)
    if form.validate():
        token = request.POST.get("_csrf")
        if token is None or token != request.session.get_csrf_token():
            raise HTTPNotFound

        name = form.data['name']
        if name is None or name == '':
            request.response.status_code = 400
            return {'message': 'No subject name'}

        subject = Subject()
        subject.name = name
        try:
            request.dbsession.add(subject)
        except SQLAlchemyError:
            request.response.status_code = 400
            request.dbsession.rollback()
            return {'message': 'Database error connet to developer via homepage'}
    else:
        request.response.status_code = 400
        return {'message': 'Cant validate form'}


@view_config(route_name='delete_subject',
             permission='edit_subjects')
def delete_subject(request):
    id = request.matchdict['id']

    try:
        request.dbsession.query(Subject).filter(Subject.id == id).delete()
        request.dbsession.flush()
    except SQLAlchemyError:
        request.session.flash('danger; Cant delete subject. Database error connect to developer via home page')
        raise HTTPFound(request.route_path('list_subjects'))

    request.session.flash('success; Subject deleted')
    return HTTPFound(request.route_path('list_subjects'))
