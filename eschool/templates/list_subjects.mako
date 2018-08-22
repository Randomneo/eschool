<%inherit file="layout.mako" />


<div class="col row justify-content-center">
    <div class="col-md-12 col-xl-10">
	<div class="float-right ct-button" >
	    <a href="#" class="btn btn-success">
		<i class="fa fa-plus"></i>
		Create subject
	    </a>
	</div>

	% if subjects:
	<table class="table table-bordered algin-middle">
	    <thead>
		<tr>
		    <th scope="col" style="width: 20px;">#</th>
		    <th scope="col">Subject</th>
		    <th scope="col" style="width: 50px;">Delete</th>
		</tr>
	    </thead>
	    <tbody>
		<%
		i = 1
		%>
	    </tbody>
	</table>
	% endif
    </div>
</div>
