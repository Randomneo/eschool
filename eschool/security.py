import bcrypt
from sqlalchemy.exc import SQLAlchemyError

from .models.user import User

import logging
log = logging.getLogger(__name__)


def hash_password(pw):
    hashed_pw = bcrypt.hashpw(pw.encode('utf-8'), bcrypt.gensalt())
    # return unicode instead of bytes because databases handle it better
    return hashed_pw.decode('utf-8')


def check_password(pw, hashed_pw):
    expected_hash = hashed_pw.encode('utf-8')
    return bcrypt.checkpw(pw.encode('utf-8'), expected_hash)


def groupfinder(userid, request):
    try:
        user = request.dbsession.query(User).filter(User.username == userid).first()
        if user is not None:
            return [user.group]
        return []
    except SQLAlchemyError as e:
        log.exception(e)

    return None
