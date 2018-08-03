from pyramid.security import Allow, Everyone


class Root(object):
    __name__ = ''

    __acl__ = [
        (Allow, Everyone, u'view'),
        (Allow, u'editor', u'edit')
    ]

    def __init__(self, request):
        pass
