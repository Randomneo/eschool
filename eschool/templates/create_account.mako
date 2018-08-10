<%inherit file="layout.mako"/>

<main role="main">
    <div class="text-center row justify-content-md-center">
	<div class="col-md-6 col-lg-4 text-center">
	    <h1 class="h3">Create account</h1>
	    ${form.begin(request.url, class_="form-create_account")}
	    ${form.csrf_token()}
	    <div class="form-group">
		${form.text("username", class_="form-control", placeholder="Username")}
		${form.text("email", class_="form-control", placeholder="Email")}
		${form.text("password", type="password", class_="form-control", placeholder="Password")}
		${form.text("password_confirm", type="password", class_="form-control", placeholder="Confirm password")}
	    </div>
	    <div class="form-group form-row justify-content-md-center">
		<div class="col-5">
		    ${form.submit('submit', "Create", class_="btn btn-primary btn-block")}
		</div>
		<div class="col-3">
		    <a href="${request.route_path('home')}", class="btn btn-secondary btn-block">Cancel</a>
		</div>
	    </div>
	    ${form.end()}
	</div>
    </div>
</main>
