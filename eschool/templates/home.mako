<%inherit file="layout.mako"/>

<div class="content">

    % for user in users:
	<p>${user.group} ${user.name}</p>
    % endfor
    <div class="col-md-3">
	<p><a href="${request.route_path('login')}">login</a></p>
	<p><a href="${request.route_path('list')}">list</a></p>
    </div>
</div>
