from sqlalchemy import (
    Column,
    Index,
    Integer,
    Text,
    Boolean,
    Table,
    ForeignKey,
)
from sqlalchemy.orm import relationship

from .meta import Base

shedule_subject_table = Table(
    'shedule_subject', Base.metadata,
    Column('id', Integer, primary_key=True),
    Column('shedule_id', Integer, ForeignKey('shedules.id')),
    Column('subject_id', Integer, ForeignKey('subjects.id'))
)


class Shedule(Base):
    __tablename__ = u'shedules'
    id = Column(Integer, primary_key=True)
    day = Column(Text)
    subject = relationship(
        "Subject",
        secondary=shedule_subject_table,
        back_populates="shedule")


class Subject(Base):
    __tablename__ = u'subjects'
    id = Column(Integer, primary_key=True)
    name = Column(Text)
    shedule = relationship(
        "Shedule",
        secondary=shedule_subject_table,
        back_populates="subject")
