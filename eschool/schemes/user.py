from formencode import Schema, validators


class UserSchema(Schema):
    allow_extra_fields = True
    filter_extra_fields = True
    email = validators.UnicodeString(min=3)
    password = validators.UnicodeString(min=6)


class CreateUserSchema(Schema):
    allow_extra_fields = True
    filter_extra_fields = True
    username = validators.UnicodeString(min=3)
    email = validators.Email(not_empty=True)
    password = validators.UnicodeString(min=6)
    password_confirm = validators.UnicodeString(min=6)
    chained_validators = [
        validators.FieldsMatch('password', 'password_confirm'),
    ]


class RestoreUserSchema(Schema):
    allow_extra_fields = True
    filter_extra_fields = True

    email = validators.Email(not_empty=True)


class RestoreUserPasswordSchema(Schema):
    allow_extra_fields = True
    filter_extra_fields = True

    password = validators.UnicodeString(min=6)
    password_confirm = validators.UnicodeString(min=6)
    chained_validators = [
        validators.FieldsMatch('password', 'password_confirm'),
    ]
