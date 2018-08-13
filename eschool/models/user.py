from sqlalchemy import (
    Column,
    Index,
    Integer,
    Text,
    Boolean,
)

from sqlalchemy.dialects.sqlite import BOOLEAN

from .meta import Base


class User(Base):
    __tablename__ = u'users'
    id = Column(Integer, primary_key=True)
    username = Column(Text)
    email = Column(Text)
    password = Column(Text)
    group = Column(Text)
    token = Column(Text)
    activated = Column(BOOLEAN, default=False)
