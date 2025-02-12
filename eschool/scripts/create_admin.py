import os
import sys
import transaction
from getpass import getpass


from pyramid.paster import (
    get_appsettings,
    setup_logging,
)

from pyramid.scripts.common import parse_vars

from ..models.meta import Base
from ..models import (
    get_engine,
    get_session_factory,
    get_tm_session,
)
from ..models.user import User
from ..security import hash_password
from ..enums.groups import Groups


def usage(argv):
    cmd = os.path.basename(argv[0])
    print(u'usage: %s <config_uri> [var=value]\n'
          u'(example: "%s development.ini")' % (cmd, cmd))
    sys.exit(1)


def main(argv=sys.argv):
    if len(argv) < 2:
        usage(argv)
    config_uri = argv[1]
    options = parse_vars(argv[2:])
    setup_logging(config_uri)
    settings = get_appsettings(config_uri, options=options)

    engine = get_engine(settings)

    session_factory = get_session_factory(engine)
    with transaction.manager:
        dbsession = get_tm_session(session_factory, transaction.manager)

        password = getpass("Please input admin password: ")

        user = User(username='admin',
                    password=hash_password(password),
                    group=Groups.admin,
                    email='admin@randomneo.me',
                    activated=True,
                    token=None)

        dbsession.add(user)
