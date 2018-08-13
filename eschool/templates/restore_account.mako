<%inherit file="layout.mako"/>

<main role="main">
    <div class="text-center row justify-content-md-center">
	<div class="col-md-6 col-lg-4 text-center">
	    <h1 class="h3">Restore account</h1>
	    ${form.begin(request.url, class_="form-create_account")}
	    ${form.csrf_token()}
	    <div class="form-group mb-3">
		${form.text("email", class_="form-control", placeholder="Email")}
		<div class="invalid-feedback text-left">
		    ${form.errorlist("email")}
		</div>
	    </div>
	    <div class="form-group form-row justify-content-md-center">
		<div class="col-12">
		    ${form.submit('submit', "Restore", class_="btn btn-primary btn-block")}
		</div>
	    </div>
	    ${form.end()}
	</div>
    </div>
</main>
