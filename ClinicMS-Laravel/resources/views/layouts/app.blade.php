<!DOCTYPE html>
<html lang="{{ config('app.locale') }}">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>{{ config('app.name', 'Clinic Management System') }}</title>
    <link href="{{ asset('css/bootstrap.min.css')}}" rel="stylesheet" crossorigin="anonymous">
    <link href="{{ asset('css/datepicker3.css')}}" rel="stylesheet">
    <link href="{{ asset('css/bootstrap-table.css')}}" rel="stylesheet">
    <link href="{{ asset('css/styles.css')}}" rel="stylesheet">
    <link href="{{ asset('css/fontawesome/css/all.css')}}" rel="stylesheet">
    <!-- <link href="{{ asset('css/nepali.datepicker.min.css')}}" rel="stylesheet"> -->
    <link href="{{ asset('css/datatable.css')}}" rel="stylesheet">
    <link href="{{ asset('css/buttons.dataTables.css')}}" rel="stylesheet">
    <link href="{{ asset('css/select2.min.css')}}" rel="stylesheet">
    <link href="{{ asset('css/timepicker.min.css')}}" rel="stylesheet">
    <link href="{{ asset('css/numpad.css')}}" rel="stylesheet">
    <link rel="favicon" sizes="32x32" href="/favicon-32x32.png">
    <link rel="favicon" sizes="16x16" href="/favicon-16x16.png">
    <link rel="icon" type="image/png" href="/favicon.png">
    <link rel="manifest" href="/manifest.json">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="/ms-icon-144x144.png">
    <meta name="theme-color" content="#ffffff">
    <!--Icons-->
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
</head>
    <script>
        window.Laravel = {!! json_encode([
            'csrfToken' => csrf_token(),
        ]) !!};
    </script>
    <script src="{{asset('js/lumino.glyphs.js')}}"></script>
    <script src="{{asset('js/jquery-1.11.1.min.js')}}"></script>
    <script src="{{asset('js/bootstrap.min.js')}}"></script>
    <script src="{{asset('js/bootstrap-datepicker.js')}}"></script>
    <script src="{{asset('js/easypiechart.js')}}"></script>
    <script src="{{asset('js/easypiechart-data.js')}}"></script>
    <script src="{{asset('js/bootstrap-table.js')}}"></script>
    <script src="{{asset('js/nepali.datepicker.min.js')}}"></script>
    <script src="{{asset('js/datatable.js')}}"></script>
    <script src="{{asset('js/dataTables.buttons.min.js')}}"></script>
    <script src="{{asset('js/buttonPrint.js')}}"></script>
    <script src="{{asset('js/select2.min.js')}}"></script>
    <script src="{{asset('js/timepicker.min.js')}}"></script>
    <script src="{{asset('js/numpad.js')}}"></script>
  
    <script src="//cdn.datatables.net/buttons/1.3.1/js/buttons.flash.min.js"></script>



    <script type="text/javascript">
    $(document).ready(function() {
        $('#example').DataTable();
        $('.example').DataTable();
        $('.datepicker').datepicker();
        $('.datepicker1').datepicker({

            format: "mm/dd/yyyy",
            todayHighlight:true,
            autoclose: true,
        });
        $('.datepicker').change(function(){
            $(".datepicker").datepicker('hide');
        });
        $('.datepicker1').change(function(){
            $(".datepicker1").datepicker('hide')
        });
} );
</script>
    <script>
    $(document).ready(function(){

        $('input.timepicker').timepicker({dropdown: true,
    scrollbar: true});
        
        $('#nepaliDateD').nepaliDatePicker({
            disableBefore: '12/08/2073',
            disableAfter: '12/20/2073'
        });
        $('#nepaliDateD1').nepaliDatePicker({
            disableDaysBefore: '10',
            disableDaysAfter: '10'
        });

        $('#nepaliDate5').nepaliDatePicker({
            npdMonth: true,
            npdYear: true,


        });
        $('#nepaliDate').nepaliDatePicker({
            onFocus: false,
            npdMonth: true,
            npdYear: true,
            ndpEnglishInput: 'englishDate',
            ndpTriggerButtonText: 'Date',
            ndpTriggerButtonClass: 'btn btn-primary btn-sm'
        });
        $('#nepaliDate1').nepaliDatePicker({
            onChange: function(){
                alert($('#nepaliDate1').val());
            }
        });
        $('#nepaliDate2').nepaliDatePicker();
        $('#nepaliDate3').nepaliDatePicker({
            onFocus: false,
            npdMonth: true,
            npdYear: true,
            ndpTriggerButton: true,
            ndpTriggerButtonText: 'Date',
            ndpTriggerButtonClass: 'btn btn-primary btn-sm'
        });

        $('#englishDate').change(function(){
            $('#nepaliDate').val(AD2BS($('#englishDate').val()));
        });

        $('#englishDate9').change(function(){
            $('#nepaliDate9').val(AD2BS($('#englishDate9').val()));
        });

        $('#nepaliDate9').change(function(){
            $('#englishDate9').val(BS2AD($('#nepaliDate9').val()));
        });
    });
</script>
    <script type="text/javascript">
         $(document).ready(function() {
  $(".select2").select2();

});
    </script>
    <script type="text/javascript">
$(document).ready(function() {
  $(".select").select2();
});
</script>


    @yield('script')
    <style type="text/css">
       li  {
        margin-right: 10px;
       }

    </style>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
    <a class="navbar-brand" href="{{route('dashboard.index')}}"><i class="fas fa-clinic-medical"></i> Clinic Management System</a>
    </div>
    <ul class="nav navbar-nav">
    <li class="{{ request()->is('/*') ? 'active' : '' }}"><a href="{{route('dashboard.index')}}"><i class="fas fa-home"></i> Dashboard</a></li>
       @permission('department.index')
        <li class="dropdown {{ request()->is('department*') || request()->is('service*') || request()->is('package') || request()->is('employee*') || request()->is('doctor*') || request()->is('invoice/report') ? 'active' : '' }}">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fas fa-users-cog"></i> Admin <span class="caret"></span></a>
            <ul class="dropdown-menu">
            
                <li><a href="{{route('department.index')}}">Departments</a></li>

                <li><a href="{{route('service.index')}}"> Services</a></li>

               
                <li><a href="{{route('package.index')}}"> Package</a></li>
                <li><a href="{{route('employee.index')}}">Employees</a></li>

                <li><a href="{{route('doctor.index')}}">Doctor OPD</a></li>
                <li><a href="{{route('invoice.report')}}">Invoice Report</a></li>

          </ul>
        </li>
        @endpermission

        @permission('patient.index')
        <li class="dropdown {{ request()->is('patient*') || request()->is('appointment*') ? 'active' : '' }}">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> <i class="fas fa-hospital-user"></i> Patient <span class="caret"></span></a>
           <ul class="dropdown-menu">
                <li><a href="{{route('patient.index')}}"> Patient</a></li>
                <li><a href="{{route('appointment.index')}}"> Appointment</a></li>
            </ul>
        </li>
        @endpermission

        @permission('invoice.report')
        <li class="dropdown {{ request()->is('account/*') ? 'active' : '' }}">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fas fa-file-medical-alt"></i> Report <span class="caret"></span></a>
           <ul class="dropdown-menu">
                <li><a href="{{route('account.service')}}">Service Sale Report</a></li>
                <li><a href="{{route('account.opd')}}"> Opd Sale Report</a></li>
                <li><a href="{{route('account.package')}}"> Package Sale Report</a></li>
               
            </ul>
        </li>
        @endpermission

        <li class="dropdown {{ request()->is('invoice*') || request()->is('opd*') || request()->is('package/sale') || request()->is('search/invoice') ? 'active' : '' }}">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fas fa-receipt"></i> Invoice/Bill <span class="caret"></span></a>
        <ul class="dropdown-menu">
         <li><a href="{{route('invoice.index')}}">Service Bill</a></li>
          <li><a href="{{route('opd.index')}}"> OPD Bill</a></li>
          <li><a href="{{url('package/sale')}}"> Package Bill</a></li>
        @permission('search.invoice')
          <li><a href="{{route('search.invoice')}}">Invoice Report</a></li>
        @endpermission
           
        </ul>
        </li>

        @permission('test.index')
        <li class="dropdown {{ request()->is('test') || request()->is('reference') || request()->is('haematology') || request()->is('biochemistry') || request()->is('immunology') || request()->is('microbiology') || request()->is('examination') || request()->is('stain') || request()->is('report')  ? 'active' : '' }}">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fas fa-flask"></i> Lab Test <span class="caret"></span></a>
            <ul class="dropdown-menu">
                <li><a href="{{route('test.index')}}"> Manage Test</a></li>
                <li><a href="{{route('reference.index')}}"> Test References </a> </li>
                <li><a href="{{route('haematology.index')}}"> Haematology Report </a> </li>
                <li><a href="{{route('biochemistry.index')}}"> Biochemistry Report </a> </li>
                <li><a href="{{route('immunology.index')}}"> Immunology Report </a> </li>
                <li><a href="{{route('microbiology.index')}}"> Microbiology Report </a> </li>
                <li><a href="{{route('examination.index')}}"> Examination Report </a> </li>
                <li><a href="{{route('stain.index')}}"> Stain Report </a> </li>
                <li><a href="{{route('report.index')}}">Report</a></li>
            </ul>
        </li>
        @endpermission
        @permission('hospital.setting')
        <li class="dropdown {{ request()->is('user*') || request()->is('role*') || request()->is('setting') || request()->is('backup') ? 'active' : '' }}">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fas fa-tools"></i> Setting<span class="caret"></span></a>
            <ul class="dropdown-menu">
            @permission('user.index')
                <li><a href="{{route('user.index')}}"> Users</a></li>
                @permission('role.index')
                <li><a href="{{route('role.index')}}">Roles</a></li>
                @endpermission
                <li><a href="{{ route('hospital.setting')}}"> Settings</a></li>
                <li><a href="{{ route('hospital.backup')}}"> Backup</a></li>
            @endpermission
            </ul>
         </li>
         @endpermission
         </ul>
         <ul class="nav navbar-nav navbar-right">
            <li class="dropdown active">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">{{Auth::user()->name}} <span class="caret"></span></a>
            <ul class="dropdown-menu" >
                <li><a id="password_change">Change Password</a></li>
                <li> <a href="{{ route('logout') }}"onclick="event.preventDefault(); document.getElementById('logout-form').submit();"> Logout</a>
                    <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                        {{ csrf_field() }}
                    </form>
                </li>
            </ul>
        </li>
        </ul>
  </div>
</nav>


@if (count($errors))
<div class="alert alert-success alert-block">
    <button type="button" class="close" data-dismiss="alert">×</button>
    @foreach($errors->all() as $error)
        <strong>{{ $error }}</strong>
    @endforeach
</div>
@endif
@include('change')


@yield('content')



</body>

</html>
