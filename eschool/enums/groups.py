class Groups():
    '''
    # TODO You can apply any amount of groups for user
    For now you can apply only one group for user

    Student can only check they marks change own info
        (except school special info for administration)
        cant delete themself
    Moderator can create school, create and add teachers for school,
        create and add students for school
        can delete only own schools
    Techer can create lessons, homework, create and add students,
        put marks, add notifications, view all students mark;

    Admin has absolute permission
    '''

    student = 'student'
    moderator = 'moderator'
    teacher = 'teacher'
    admin = 'admin'
