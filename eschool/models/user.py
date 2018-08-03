from sqlalchemy import (
    Column,
    Index,
    Integer,
    Text,
)

from .meta import Base


class User(Base):
    __tablename__ = u'users'
    id = Column(Integer, primary_key=True)
    name = Column(Text)
    password = Column(Text)
