<%inherit file="layout.mako"/>

<main role="main">
    <div class="text-center row justify-content-md-center">
	<div class="col-md-6 col-lg-4 text-center">
	    <h1 class="h3">Create account</h1>
	    ${form.begin(request.url, class_="form-create_account")}
	    ${form.csrf_token()}
	    <div class="form-group mb-3">
		${form.text("username", class_="form-control", placeholder="Username")}
		<div class="invalid-feedback text-left">
		    ${form.errorlist("username")}
		</div>
		${form.text("email", class_="form-control", placeholder="Email")}
		<div class="invalid-feedback text-left">
		    ${form.errorlist("email")}
		</div>
		${form.text("password", type="password", class_="form-control", placeholder="Password")}
		<div class="invalid-feedback text-left">
		    ${form.errorlist("password")}
		</div>
		${form.text("password_confirm", type="password", class_="form-control", placeholder="Confirm password")}
		<div class="invalid-feedback text-left">
		    ${form.errorlist("password_confirm")}
		</div>
	    </div>
	    <div class="form-group form-row justify-content-md-center">
		<div class="col-12">
		    ${form.submit('submit', "Create", class_="btn btn-primary btn-block")}
		</div>
	    </div>
	    <div class="form-group form-row justify-content-md-center">
		<div class="col-lg-6">
		    <a href="${request.route_path('restore_account')}" class="btn btn-secondary btn-block">Restore account</a>
		</div>
		<div class="col-lg-6">
		    <a href="${request.route_path('home')}", class="btn btn-secondary btn-block">Cancel</a>
		</div>
	    </div>
	    ${form.end()}
	</div>
    </div>
</main>
