<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <table class="table table-striped"> 
                    <tr>
                        <th>Id</th>
                        <th>Post</th>
                        <th>Comments</th>
                    </tr>

                    <!-- @foreach ( $posts as $p)
                        <tr> 
                            <td> {{$p->id}}</td>
                            <td> {{$p->name}}</td>
                            <td>@foreach ($p->comments as $pc)
                                {{$pc->name}} <br>
                            @endforeach</td>
                        </tr>
                    
                        
                    @endforeach -->

                    @foreach ( $posts as $p)
                        <tr> 
                            <td> {{$p->id}}</td>
                            <td> {{$p->name}}</td>
                            <td>@foreach ($p->comments as $pc)
                                {{$pc->name}} <br>
                            @endforeach</td>
                        </tr>
                    
                        
                    @endforeach

                </table>
            </div>
        </div>
    </div>
</body>
</html>