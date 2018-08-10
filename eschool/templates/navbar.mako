<nav class="navbar stiky-top navbar-light navbar-expand-lg bg-light">
    <a class="navbar-brand" href="${request.route_path('home')}">Eschool</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
	<span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
	<ul class="navbar-nav">
	    <li class="nav-item">
		<a href="${request.route_path('home')}" class="nav-link">Home</a>
	    </li>
	    <li class="nav-item">
		<a href="${request.route_path('list')}" class="nav-link">Journal</a>
	    </li>
	</ul>
	<ul class="navbar-nav ml-auto">
	    % if not request.authenticated_userid:
		<li class="nav-item">
		    <a href="${request.route_path('login')}" class="nav-link">Login</a>
		</li>
	    % else:
		<li class="nav-item">
		    <a href="${request.route_path('logout')}" class="nav-link">Logout</a>
		</li>
	    % endif
	</ul>
    </div>
</nav>
