from sqlalchemy import (
    Column,
    Index,
    Integer,
    Text,
    Boolean,
)

from sqlalchemy.dialects.sqlite import BOOLEAN

from .meta import Base


class Subject(Base):
    __tablename__ = u'subjects'
    id = Column(Integer, primary_key=True)
    name = Column(Text)
