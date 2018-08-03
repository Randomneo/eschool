<%inherit file="layout.mako"/>

<nav class="navbar navbar-default navbar-static-top">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">Baner manager</a>
    </div>
    <div id="navbar" class="navbar-collapse collapse">
      <ul class="nav navbar-nav">
        <li><a href="${request.resource_url(request.root)}">Home</a></li>
        <li><a href="${request.resource_url(request.root, 'list', 0)}">List</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li class="active"><a href="${request.resource_url(request.root, 'login')}">login</a></li>
      </ul>
    </div><!--/.nav-collapse -->
  </div>
</nav>

<div class="container theme-showcase" role="main">
  % if not message == "":
  <p>${message}</p>
  % endif
  <div class="col-md-4">
    ${renderer.begin(request.resource_url(request.root, 'login'))}
    ${renderer.csrf_token()}
    <input type="hidden" name="came_from" value="${came_from}">
    <div class="form-group">
      ${renderer.label("login", "Login")}
      ${renderer.errorlist("login")}
      ${renderer.text("login", class_="form-control", size=30)}
    </div>
    <div class="form-group">
      ${renderer.label("password", "Password")}
      ${renderer.errorlist("password")}
      ${renderer.text("password", class_="form-control", type="password", size=30)}
    </div>
    <div class="form-group">
      ${renderer.submit("submit", "Submit", class_="btn btn-primary")}
    </div>
    ${renderer.end()}
  </div>
</div>
