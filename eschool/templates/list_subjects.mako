<%inherit file="layout.mako" />

<script>
 $(function (){
     $('#create').click(function(e) {

         var form = $(".md-form");
         var formData = $(form).serialize();
	 $.ajax({
	     type: "POST",
	     url: "${request.route_path('create_subject')}",
	     data: formData,
	     success: function (data) {
		 location.reload();
		 //TODO update table
		 $('#exampleModal').modal('hide');
	     },
	     error: function (xhr, ajaxOptions, thrownError) {
		 var s = JSON.parse(xhr.responseText);
		 console.log(s);
		 alert(s['message']);
	     }
	 });
     });
 });
</script>

<div class="col row justify-content-center">
    <div class="col-md-12 col-xl-10">
	<!-- Button trigger modal -->
	<button type="button" class="btn btn-success float-right ct-button" data-toggle="modal" data-target="#exampleModal">
	    <i class="fa fa-plus"></i>
	    Create subject
	</button>

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	    <div class="modal-dialog" role="document">
		<div class="modal-content">
		    <div class="modal-header">
			<h5 class="modal-title" id="exampleModalLabel">Create subject</h5>
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
			    <span aria-hidden="true">&times;</span>
			</button>
		    </div>
		    <div class="modal-body">
			${form.begin(class_="md-form")}
                        ${form.csrf_token()}
			${form.text('name', class_='form-control', autocomplete='off', placeholder="Subject name")}
			<div class="invalid_feedback text-left">
			    ${form.errorlist("name")}
			</div>
			##<div class="md-form" >
			##<label for="subject_name">Subject name</label>
			##<input type="text" class="form-control" id="subject_name" name="subject_name" value="" />
			##</div>
			${form.end()}
		    </div>
		    <div class="modal-footer">
			<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			<button type="button" class="btn btn-primary" id="create">Create subject</button>
		    </div>
		</div>
	    </div>
	</div>

	% if subjects:
	<table class="table table-bordered algin-middle">
	    <thead>
		<tr>
		    <th scope="col" style="width: 20px;">#</th>
		    <th scope="col">Name</th>
		    % if request.has_permission('edit_subjects'):
			<th scope="col" style="width: 50px;">Delete</th>
		    % endif
		</tr>
	    </thead>
	    <tbody>
		<%
		i = 1
		%>
		% for subject in subjects:
		    <tr>
			<th>${i}</th>
			<th>${subject.name}</th>
			% if request.has_permission('edit_subjects'):
			<th class="text-center">
			    <a href="${request.route_path('delete_subject', id=subject.id)}" class="btn btn-danger">
				<i class="fa fa-trash"></i>
			    </a>
			</th>
			% endif
		    </tr>
		    <% i += 1 %>
		% endfor
	    </tbody>
	</table>
	% endif
    </div>
</div>
