<%inherit file="layout.mako" />


<div class="col row justify-content-center">
    <div class="col-md-12 col-xl-8">
	<table class="table table-bordered algin-middle">
	    <thead>
		<tr>
		    <th scope="col" style="width: 20px;">#</th>
		    <th scope="col">Username</th>
		    <th scope="col">Email</th>
		    <th scope="col">Group</th>
		    <th scope="col" style="width: 50px;">Delete</th>
		</tr>
	    </thead>
	    <tbody>
		<%
		i = 1
		%>
		% for user in users:
		    <tr>
			<th scope="row" >${i}</th>
			<td>${user.username}</td>
			<td>${user.email}</td>
			<td>${user.group}</td>
			<td>
			    <a href="${request.route_path('delete_user', id=user.id)}" class="btn btn-danger">
				<i class="fa fa-trash"></i>
			    </a>
			</td>
		    </tr>
		    <% i += 1 %>
		% endfor
	    </tbody>
	</table>
    </div>
</div>
