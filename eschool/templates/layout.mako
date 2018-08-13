<!DOCTYPE html>
<html lang="${request.locale_name}">
    <head>
	<meta charset="utf-8">
	<meta name="author" content="Randomneo">

	<title>Cookiecutter Starter project for the Pyramid Web Framework</title>

	<link rel="stylesheet" href="${request.static_url("eschool:static/node_modules/bootstrap/dist/css/bootstrap.css")}" type="text/css" />
	<link rel="stylesheet" href="${request.static_url('eschool:static/main.css')}" type="text/css" media="screen" />

	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js""></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
    </head>

    <body>
	<%include file="navbar.mako"/>

	<div class="row justify-content-md-center">
	    <div class="col-md-10">
		% for message in request.session.pop_flash():
		    <div class="alert alert-${message.split(';')[0]} alert-dismissible fade show" role="alert">
			${message.split(';')[1]}
			<button type="button" class="close" data-dismiss="alert" aria-label="Close">
			    <span aria-hidden="true">&times;</span>
			</button>
		    </div>
		% endfor
	    </div>
	</div>

	${ next.body() }
    </body>
</html>
