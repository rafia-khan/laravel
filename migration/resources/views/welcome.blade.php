<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>view</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-12">
                <table class="table table-striped"> 
                        <tr>
                            <th>Id</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>City</th>
                        </tr>

                        <tr> 
                            @foreach ( $products as $pro)
                                <tr> 
                                    <td>{{$pro->id}}</td>
                                    <td>{{$pro->name}}</td>
                                    <td>{{$pro->email}}</td>
                                    <td>{{$pro->age}}</td>
                                </tr>
                                
                            @endforeach
                        </tr>
                </table>
            </div>
        </div>
    </div>
</body>
</html>