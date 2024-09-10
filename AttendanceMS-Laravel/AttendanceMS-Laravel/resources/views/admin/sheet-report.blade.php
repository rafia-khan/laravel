@extends('layouts.master')
@section('content')

    <div class="card">
        <div class="card-header bg-success text-white">
            Attendance Sheet Report
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-md table-hover" id="printTable">
                <thead class="thead-dark">
                        <tr >

                            <th>Employee</th>
                            <th>Position</th>
                            <!-- <th>ID</th> -->
							<!-- Log on to codeastro.com for more projects! -->
                            @php
                                $today = today();
                                $dates = [];
                                
                                for ($i = 1; $i < $today->daysInMonth + 1; ++$i) {
                                    $dates[] = \Carbon\Carbon::createFromDate($today->year, $today->month, $i)->format('Y-m-d');
                                }
                                
                            @endphp
                            @foreach ($dates as $date)
                            <th style="">
                            
                                
                                    {{ $date }}
                            
                        </th>
                      

                            @endforeach

                        </tr>
                    </thead>

                    <tbody>





                        @foreach ($employees as $employee)

                            <input type="hidden" name="emp_id" value="{{ $employee->id }}">

                            <tr>
                                <td>{{ $employee->name }}</td>
                                <td>{{ $employee->position }}</td>
                                <!-- <td>{{ $employee->id }}</td> -->
								<!-- Log on to codeastro.com for more projects! -->






                                @for ($i = 1; $i < $today->daysInMonth + 1; ++$i)


                                    @php
                                        
                                        $date_picker = \Carbon\Carbon::createFromDate($today->year, $today->month, $i)->format('Y-m-d');
                                        
                                        $check_attd = \App\Models\Attendance::query()
                                            ->where('emp_id', $employee->id)
                                            ->where('attendance_date', $date_picker)
                                            ->first();
                                        
                                        $check_leave = \App\Models\Leave::query()
                                            ->where('emp_id', $employee->id)
                                            ->where('leave_date', $date_picker)
                                            ->first();
                                        
                                    @endphp
                                    <td>

                                        <div class="form-check form-check-inline ">

                                            @if (isset($check_attd))
                                                 @if ($check_attd->status==1)
                                                 <i class="fa fa-check text-success"></i>
                                                 @else
                                                 <i class="fa fa-check text-danger"></i>
                                                 @endif
                                               
                                            @else
                                            <i class="fas fa-times text-danger"></i>
                                            @endif
                                        </div>
                                        <div class="form-check form-check-inline">
                                          
                                            @if (isset($check_leave))
                                            @if ($check_leave->status==1)
                                            <i class="fa fa-check text-success"></i>
                                            @else
                                            <i class="fa fa-check text-danger"></i>
                                            @endif
                                          
                                       @else
                                       <i class="fas fa-times text-danger"></i>
                                       @endif
                                        

                                        </div>

                                    </td>

                                @endfor
                            </tr>
                        @endforeach





                    </tbody>
					<!-- Log on to codeastro.com for more projects! -->


                </table>
            </div>
        </div>
    </div>
@endsection
