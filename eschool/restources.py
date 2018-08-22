from pyramid.security import Allow, Everyone
from .enums.groups import Groups

class Root(object):
    __name__ = ''

    __acl__ = [
        (Allow, Everyone, 'view'),
        (Allow, Groups.admin, 'edit_users'),
        (Allow, Groups.teacher, 'edit_students'),
        (Allow, Groups.moderator, 'edit'),
        (Allow, Groups.teacher, 'edit_subject'),
        (Allow, Groups.admin, 'edit_subject'),
    ]

    def __init__(self, request):
        pass
