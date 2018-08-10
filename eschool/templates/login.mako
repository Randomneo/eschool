<%inherit file="layout.mako"/>

<main role="main">
<div class="container">
    % if not message == "":
	<p>${message}</p>
    % endif

    <div class="text-center">
	<div class="row justify-content-md-center align-items-center">
	    <div class="col-md-3" class="text-center">
		<h1 class="h3">Login</h1>
		${renderer.begin(request.resource_url(request.root, 'login'), class_="form-sigin")}
		${renderer.csrf_token()}
		<input type="hidden" name="came_from" value="${came_from}">
		<div class="form-group">
		    ${renderer.text("login", class_="form-control", size=30, placeholder="Username")}
		    ${renderer.text("password", class_="form-control", type="password", size=30, placeholder="Password")}
		</div>
		<div class="form-group">
		    ${renderer.submit("submit", "Submit", class_="btn btn-primary")}
		</div>
		${renderer.end()}
	    </div>
	</div>
    </div>
</div>
</main>
