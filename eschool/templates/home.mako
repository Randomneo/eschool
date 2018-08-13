<%inherit file="layout.mako"/>

<div class="content col-md-12">
    % for user in users:
	<p>${user.username} - ${user.password}</p>
    % endfor
</div>
