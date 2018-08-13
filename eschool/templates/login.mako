<%inherit file="layout.mako"/>

<main role="main">
<div class="container">
    % if not message == "":
	<p>${message}</p>
    % endif

    <div class="text-center">
	<div class="row justify-content-md-center">
	    <div class="col-md-6 col-lg-4" class="text-center">
		<h1 class="h3">Login</h1>
		% if (renderer.errorlist("login") or renderer.errorlist("password")):
		    <div class="invalid-feedback">
			wrong username or password
		    </div>
		% endif
		${renderer.begin(request.resource_url(request.root, 'login'), class_="form-sigin")}
		${renderer.csrf_token()}
		<input type="hidden" name="came_from" value="${came_from}">
		<div class="form-group">
		    ${renderer.text("username", class_="form-control", size=30, placeholder="Username")}
		    ${renderer.text("password", class_="form-control", type="password", size=30, placeholder="Password")}
		</div>
		<div class="form-group form-row">
		    <div class="col-12">
			${renderer.submit("submit", "Submit", class_="btn btn-primary btn-block")}
		    </div>
		</div>
		<div class="form-group form-row">
		    <div class="col-6">
			<a href="${request.route_path('restore_account')}" class="btn btn-secondary btn-block">Restore account</a>
		    </div>
		    <div class="col-6">
			<a href="${request.route_path('create_account')}" class="btn btn-secondary btn-block">Create account</a>
		    </div>
		</div>
		${renderer.end()}
	    </div>
	</div>
    </div>
</div>
</main>
