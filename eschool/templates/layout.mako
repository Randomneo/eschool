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

	${ next.body() }
    </body>
</html>
