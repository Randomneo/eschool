from formencode import Schema, validators


class CreateSubjectSchema(Schema):
    name = validators.UnicodeString(min=3)
