def includeme(config):
    config.add_static_view('static', 'static', cache_max_age=3600)

    config.add_route('login', '/login')
    config.add_route('logout', '/logout')
    config.add_route('create_account', '/create_account')
    config.add_route('confirm_account', '/confirm_account/{token}')
    config.add_route('user_settings', '/user_settings')
    config.add_route('restore_account', '/restore_account')
    config.add_route('restore_password', '/restore_password/{token}')

    config.add_route('home', '/')
    config.add_route('list', '/list')
