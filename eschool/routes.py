def includeme(config):
    config.add_static_view('static', 'static', cache_max_age=3600)

    config.add_route('login', '/login')
    config.add_route('logout', '/logout')
    config.add_route('create_account', '/create_account')
    config.add_route('confirm_account', '/confirm_account/{token}')
    config.add_route('user_settings', '/user_settings')
    config.add_route('restore_account', '/restore_account')
    config.add_route('restore_password', '/restore_password/{token}')

    config.add_route('edit_users', '/edit_users')
    config.add_route('delete_user', '/delete_user/{id}')

    config.add_route('home', '/')
    config.add_route('list', '/list')

    config.add_route('list_subjects', '/list_subjects')
    config.add_route('create_subject', '/create_subject')
    config.add_route('delete_subject', '/delete_subject/{id}')

    config.add_route('list_shedule', '/shedule')
