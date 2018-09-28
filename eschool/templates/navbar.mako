<%!
from eschool.enums.groups import Groups
from pyramid.security import Allowed
%>

<nav class="navbar stiky-top navbar-light navbar-expand-lg bg-light">
    <a class="navbar-brand" href="${request.route_path('home')}">Eschool</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
	<span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
	<ul class="navbar-nav">
	    <li class="nav-item">
		<a href="${request.route_path('home')}" class="nav-link active">Home</a>
	    </li>

	    % if request.has_permission('edit'):
		<li class="nav-item">
		    <a href="${request.route_path('list')}" class="nav-link">Journal</a>
		</li>
	    % endif
	    % if request.has_permission('edit_users'):
		<li class="nav-item">
		    <a href="${request.route_path('edit_users')}" class="nav-link">Edit users</a>
		</li>
	    % endif
	    % if request.has_permission('edit_subjects'):
		<li class="nav-item">
		    <a href="${request.route_path('list_subjects')}" class="nav-link">Subjects</a>
		</li>
	    % endif
	    <li class="nav-item">
		<a href="${request.route_path('list_shedule')}" class="nav-link">Shedule</a>
	    </li>
	</ul>
	<ul class="navbar-nav ml-auto">
	    % if not request.authenticated_userid:
		<li class="nav-item">
		    <a href="${request.route_path('login')}" class="nav-link">Login</a>
		</li>
		<li class="nav-item">
		    <a href="${request.route_path('create_account')}" class="nav-link">Signup</a>
		</li>
	    % else:
		<li class="nav-item">
		    <a href="${request.route_path('user_settings')}" class="nav-link">User settings</a>
		</li>
		<li class="nav-item">
		    <a href="${request.route_path('logout')}" class="nav-link">Logout</a>
		</li>
	    % endif
	</ul>
    </div>
</nav>
