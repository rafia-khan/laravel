<!-- Add -->
<div class="modal fade" id="addnew">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
            <h5 class="modal-title"><b>Set a New Schedule</b></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
              
            </div>
            <!-- Log on to codeastro.com for more projects! -->
            <div class="modal-body text-left">
                <form class="form-horizontal" method="POST" action="{{ route('schedule.store') }}">
                    @csrf
                    <div class="form-group">
                        <label for="name"  class="col-sm-6 control-label">Name <i>{without any space}</i></label>

                        
                            <div class="bootstrap-timepicker">
                                <input type="text" placeholder="Enter a Schedule name [hypen accepted]" class="form-control timepicker" id="name" name="slug">
                            </div>
                        <!-- Log on to codeastro.com for more projects! -->
                    </div>
                    <div class="form-group">
                        <label for="time_in" class="col-sm-3 control-label">Time In</label>

                        
                            <div class="bootstrap-timepicker">
                                <input type="time" class="form-control timepicker" id="time_in" name="time_in" required>
                            </div>
                        
                    </div>
                    <div class="form-group">
                        <label for="time_out" class="col-sm-3 control-label">Time Out</label>

                        
                            <div class="bootstrap-timepicker">
                                <input type="time" class="form-control timepicker" id="time_out" name="time_out" required>
                            </div>
                        <!-- Log on to codeastro.com for more projects! -->
                    </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger btn-flat pull-left" data-dismiss="modal"><i class="fa fa-close"></i> Close</button>
                <button type="submit" class="btn btn-success btn-flat"><i class="fa fa-save"></i> Save</button>
                </form>
            </div>
        </div>
    </div>
</div>

