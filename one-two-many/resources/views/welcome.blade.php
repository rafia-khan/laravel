<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
    
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <table class="table table-striped mt-2"> 
                    <tr> 
                        <th>Id</th>
                        <th>Name</th>
                        <th>Email</th>
                        
                    </tr>

                    @foreach ($students as $student)
                        <tr> 
                            <td>{{ $student->id}}</td>
                            <td>{{ $student->name}}</td>
                            <td>{{ $student->email}}</td>
                        </tr>
                    @endforeach

                </table>
            </div>
        </div>
    </div>

</body>
</html>