<%inherit file="layout.mako"/>

<script>
 $(function (){
     $('#AddDay').click(function(e) {

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
		 alert(s['message']);
	     }
	 });
     });
 });
</script>


<div class="col justify-content-center d-flex">
    <div class="col-xl-11 col-lg-12 col-md-12 row justify-content-lg-start justify-content-md-center d-flex">
        % for day in shedule:
            ${day}
        % endfor
	<div class="list-group shedule-day col-xl-4 col-lg-6 col-md-10 col-sm-12">
	    <a href="#" class="list-group-item list-group-item-primary">
		aoe
	    </a>
	    <a href="#" class="list-group-item">
		aoe
	    </a>
	    <a href="#" class="list-group-item">
		aoe
	    </a>
	    <a href="#" class="list-group-item">
		aoe
	    </a>
	</div>

	<div class="list-group shedule-day col-xl-4 col-lg-6 col-md-10 col-sm-12">
	    <a href="#" class="list-group-item list-group-item-primary">
		aoe
	    </a>
	    <a href="#" class="list-group-item">
		aoe
	    </a>
	    <a href="#" class="list-group-item">
		aoe
	    </a>
	    <a href="#" class="list-group-item">
		aoe
	    </a>
	</div>
	<div class="list-group shedule-day col-xl-4 col-lg-6 col-md-10 col-sm-12">
	    <a href="#" class="list-group-item list-group-item-primary">
		aoe
	    </a>
	    <a href="#" class="list-group-item">
		aoe
	    </a>
	    <a href="#" class="list-group-item">
		aoe
	    </a>
            <a href="#" class="list-group-item">
		aoe
	    </a>
	</div>
	<div class="list-group shedule-day col-xl-4 col-lg-6 col-md-10 col-sm-12">
	    <div class="list-group-item list-group-item-header list-group-item-primary  d-flex">
		<h3>Monday</h3>
                % if request.has_permission('edit_shedule'):
                    <span class="ml-auto d-flex btn-group" role="group">
                        <button class="btn btn-secondary">
                            <i class="fa fa-pencil-alt"></i>
                        </button>
                        <button class="btn btn-danger">
                            <i class="fa fa-trash"></i>
                        </button>
                    </span>
                % endif
	    </div>
	    <div class="list-group-item align-middle d-flex align-items-center w-100">
                Math
                % if request.has_permission('edit_shedule'):
                    <span class="ml-auto d-flex btn-group" role="group">
                        <button class="btn btn-secondary">
                            <i class="fa fa-pencil-alt"></i>
                        </button>
                        <button class="btn btn-danger">
                            <i class="fa fa-trash"></i>
                        </button>
                    </span>
                % endif
	    </div>
	    <div class="list-group-item align-middle d-flex align-items-center w-100">
		History
                % if request.has_permission('edit_shedule'):
                    <span class="ml-auto d-flex btn-group" role="group">
                        <button class="btn btn-secondary">
                            <i class="fa fa-pencil-alt"></i>
                        </button>
                        <button class="btn btn-danger">
                            <i class="fa fa-trash"></i>
                        </button>
                    </span>
                % endif
	    </div>
	    <div class="list-group-item align-middle d-flex align-items-center w-100">
		Chemestry
                % if request.has_permission('edit_shedule'):
                    <span class="ml-auto d-flex btn-group" role="group">
                        <button class="btn btn-secondary">
                            <i class="fa fa-pencil-alt"></i>
                        </button>
                        <button class="btn btn-danger">
                            <i class="fa fa-trash"></i>
                        </button>
                    </span>
                % endif
	    </div>
            % if request.has_permission('edit_shedule'):
                <div href="#" class="list-group-item text-center list-group-item-action list-group-item-success">
                    <button class="btn btn-success w-100">
                        <i class="fa fa-plus"></i>
                    </button>
                </div>
            % endif
	</div>
        % if request.has_permission('edit_shedule'):
            <div class="list-group shedule-day col-xl-4 col-lg-6 col-md-10 col-sm-12">
                <a href="#" class="list-group-item d-flex justify-content-center btn btn-outline-success" data-toggle="modal" data-target="#AddDayModal">
                    <h3 class="align-self-center">
                        Add day
                        <br>
                        <i class="fa fa-plus"></i>
                    </h3>
                </a>
            </div>
            <div class="modal fade" id="AddDayModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	        <div class="modal-dialog" role="document">
		    <div class="modal-content">
		        <div class="modal-header">
			    <h5 class="modal-title" id="AddDayModal">Add day</h5>
			    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			        <span aria-hidden="true">&times;</span>
			    </button>
		        </div>
		        <div class="modal-body">
                            aoe aoeoae aoe aoe ao eoae aoe
			    <div class="invalid_feedback text-left">
                                aoe
                            </div>
			    ##<div class="md-form" >
			    ##<label for="subject_name">Subject name</label>
			    ##<input type="text" class="form-control" id="subject_name" name="subject_name" value="" />
			    ##</div>
		        </div>
		        <div class="modal-footer">
			    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			    <button type="button" class="btn btn-primary" id="AddDay">Create subject</button>
		        </div>
		    </div>
	        </div>
	    </div>
        % endif
    </div>
</div>
