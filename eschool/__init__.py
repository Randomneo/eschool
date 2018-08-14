from pyramid.config import Configurator
from pyramid.session import SignedCookieSessionFactory

from pyramid.authentication import AuthTktAuthenticationPolicy
from pyramid.authorization import ACLAuthorizationPolicy

from .restources import Root
from .security import groupfinder


def main(global_config, **settings):
    """ This function returns a Pyramid WSGI application.
    """
    authn_policy = AuthTktAuthenticationPolicy(
        u'sosecret',
        hashalg=u'sha512',
        callback=groupfinder,
    )
    authz_policy = ACLAuthorizationPolicy()

    my_session_factory = SignedCookieSessionFactory(u'itsaseekreet')
    config = Configurator(settings=settings,
                          session_factory=my_session_factory,
                          root_factory=Root)

    config.set_authentication_policy(authn_policy)
    config.set_authorization_policy(authz_policy)

    config.include(u'pyramid_mako')
    config.include('pyramid_mailer.debug')
    config.include(u'.models')
    config.include(u'.routes')
    config.scan()
    config.add_static_view(
        name=u'static/media',
        path=u'banereditor.models:banereditor/static/media')

    return config.make_wsgi_app()
