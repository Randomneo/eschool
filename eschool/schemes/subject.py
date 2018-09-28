from formencode import Schema, validators


class CreateSubjectSchema(Schema):
    allow_extra_fields = True
    filter_extra_fields = True

    name = validators.UnicodeString(min=3)
