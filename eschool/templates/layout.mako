<!DOCTYPE html>
<html lang="${request.locale_name}">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="pyramid web application">
    <meta name="author" content="Pylons Project">
    <link rel="shortcut icon" href="${request.static_url('eschool:static/pyramid-16x16.png')}">

    <title>Cookiecutter Starter project for the Pyramid Web Framework</title>

    <script type="text/javascript" src="${request.static_url('eschool:static/bower_components/jquery/dist/jquery.min.js')}"></script>
    <!-- Bootstrap core CSS -->
    <link href="//oss.maxcdn.com/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
    <link href="${request.static_url('eschool:static/bower_components/flexslider/flexslider.css')}" rel="stylesheet">
    <link rel="stylesheet" href="${request.static_url('eschool:static/bower_components/eonasdan-bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.min.css')}" />
    <script type="text/javascript" src="${request.static_url('eschool:static/bower_components/moment/min/moment.min.js')}"></script>
    <script type="text/javascript" src="${request.static_url('eschool:static/bower_components/flexslider/jquery.flexslider.js')}"></script>
    <script type="text/javascript" src="${request.static_url('eschool:static/bower_components/eonasdan-bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js')}"></script>


    <script src="${request.static_url('eschool:static/main.js')}"></script>


    <!-- Custom styles for this scaffold -->
    <!-- <link href="${request.static_url('eschool:static/theme.css')}" rel="stylesheet"> -->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="//oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js" integrity="sha384-0s5Pv64cNZJieYFkXYOTId2HMA2Lfb6q2nAcx2n0RTLUnCAoTTsS0nKEO27XyKcY" crossorigin="anonymous"></script>
      <script src="//oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js" integrity="sha384-f1r2UzjsxZ9T4V1f2zBO/evUqSEOpeaUUZcMTz1Up63bl4ruYnFYeM+BxI4NhyI0" crossorigin="anonymous"></script>
    <![endif]-->
  </head>

  <body>

    ${ next.body() }

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <!--<script src="//oss.maxcdn.com/libs/jquery/1.10.2/jquery.min.js" integrity="sha384-aBL3Lzi6c9LNDGvpHkZrrm3ZVsIwohDD7CDozL0pk8FwCrfmV7H9w8j3L7ikEv6h" crossorigin="anonymous"></script>
    <script src="//oss.maxcdn.com/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js" integrity="sha384-s1ITto93iSMDxlp/79qhWHi+LsIi9Gx6yL+cOKDuymvihkfol83TYbLbOw+W/wv4" crossorigin="anonymous"></script>
-->
  </body>
</html>
