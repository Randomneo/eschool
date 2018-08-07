import bcrypt
from sqlalchemy.exc import SQLAlchemyError

from .models.user import User

import logging
log = logging.getLogger(__name__)


def hash_password(pw):
    hashed_pw = bcrypt.hashpw(pw.encode('utf-8'), bcrypt.gensalt())
    # return unicode instead of bytes because databases handle it better
    return hashed_pw.decode('utf-8')


def check_password(expected_hash, pw):
    if expected_hash is not None:
        return bcrypt.checkpw(pw.encode('utf-8'),
                              expected_hash.encode('utf-8'))
    return False


def groupfinder(userid, request):
    try:
        user = request.dbsession.query(User).filter(User.i == userid).one()
        return user.group
    except SQLAlchemyError as e:
        log.exception(e)

    return None
