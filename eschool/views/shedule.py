import logging

from pyramid.view import view_config

from ..models.shedule import Shedule, Subject

log = logging.getLogger(__name__)


@view_config(route_name='list_shedule',
             renderer='../templates/shedule.mako')
def list_subjects(request):
    shedule = request.dbsession.query(Shedule)

    return {
        'shedule': shedule
    }
