from formencode import Schema, validators


class UserSchema(Schema):
    allow_extra_fields = True
    filter_extra_fields = True
    login = validators.UnicodeString(min=3)
    password = validators.UnicodeString(min=6)
