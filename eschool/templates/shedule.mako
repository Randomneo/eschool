<%inherit file="layout.mako"/>

<div class="col justify-content-center d-flex">
    <div class="col-xl-11 col-lg-12 col-md-12">
        % for day in shedule:
            ${day}
        % endfor
        <div class="row shedule-row">
	    <div class="list-group shedule-day col-lg-4 col-md-12 col-sm-12">
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

	    <div class="list-group shedule-day col-lg-4 col-md-12 col-sm-12">
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
	    <div class="list-group shedule-day col-lg-4 col-md-12 col-sm-12">
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
        </div>
        <div class="row shedule-row">
	    <div class="list-group shedule-day col-lg-4 col-md-12 col-sm-12">
	        <div class="list-group-item list-group-item-header list-group-item-primary list-group-item-action d-flex">
		    <h3>aoe</h3>
                    <span class="ml-auto">
                        <button class="btn btn-secondary">
                            <i class="fa fa-pencil-alt"></i>
                        </button>
                        <button class="btn btn-danger">
                            <i class="fa fa-trash"></i>
                        </button>
                    </span>
	        </div>
	        <div class="list-group-item align-middle d-flex align-items-center w-100">
		    aoe
                    <span class="ml-auto">
                        <button class="btn btn-secondary">
                            <i class="fa fa-pencil-alt"></i>
                        </button>
                        <button class="btn btn-danger">
                            <i class="fa fa-trash"></i>
                        </button>
                    </span>
	        </div>
	        <div class="list-group-item align-middle d-flex align-items-center w-100">
		    aoe
                    <span class="ml-auto">
                        <button class="btn btn-secondary">
                            <i class="fa fa-pencil-alt"></i>
                        </button>
                        <button class="btn btn-danger">
                            <i class="fa fa-trash"></i>
                        </button>
                    </span>
	        </div>
	        <div class="list-group-item align-middle d-flex align-items-center w-100">
		    aoe
                    <span class="ml-auto">
                        <button class="btn btn-secondary">
                            <i class="fa fa-pencil-alt"></i>
                        </button>
                        <button class="btn btn-danger">
                            <i class="fa fa-trash"></i>
                        </button>
                    </span>
	        </div>
                <div href="#" class="list-group-item text-center list-group-item-action list-group-item-success">
                    <button class="btn btn-success w-100">
                        <i class="fa fa-plus"></i>
                    </button>
                </div>
	    </div>
            <div class="list-group shedule-day col-lg-4 col-md-12 col-sm-12">
                <a href="#" class="list-group-item list-group-item-success d-flex justify-content-center btn btn-outline-success">
                    <h3 class="align-self-center">
                        Add day
                        <br>
                        <i class="fa fa-plus"></i>
                    </h3>
                </a>
            </div>
        </div>
    </div>
</div>
