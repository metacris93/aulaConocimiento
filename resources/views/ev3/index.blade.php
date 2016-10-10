@extends('layouts.app')

@section('contentheader_title')
    Mantenimiento de Introduccion EV3
@endsection


@section('main-content')

    <div class="row" style="width : 80%; margin : 0 auto;">
        </br><div class="col-lg-12 margin-tb">
            
            <div class="pull-right">
                <a class="btn btn-success" data-toggle="modal" data-target="#myModal">
                  <span class="glyphicon glyphicon-plus"></span> Crear Ev3
                 </a>
            </div>
        </div>
    </div>

    @if ($message = Session::get('success'))
        <div class="alert alert-success" >
            <p>{{ $message }}</p>
        </div>
    @endif

    <table class="table table-bordered" style="width : 80%; margin : 0 auto; ">
        <tr>
            <th width="100px">Titulo</th>
            <th width="280px">Descrip.</th>      
            <th width="200px">Acciones</th>
        </tr>
    @foreach ($items as $key => $item)
    <tr>
        <td>{{ $item->titulo }}</td>
        <td>{{ $item->descripcion }}</td>
        <td>
            <a class="btn btn-info" href="{{ url('ev3',$item->titulo) }}">
              <span class="glyphicon glyphicon-list-alt"></span>
            </a>
            <a class="btn btn-info" data-toggle="modal" data-target="#edittaller{{ $item->id }}"> 
                <span class="glyphicon glyphicon-pencil"></span>
            </a>
            <a class="btn btn-danger" data-toggle="modal" data-target="#etaller{{ $item->id }}"> 
                <span class="glyphicon glyphicon-remove"></span>
            </a>

        </td>
    </tr>
    @endforeach
    </table>


<!-- Modal Nuevo ev3-->
<div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel">Nuevo Ev3</h4>
        </div>
        <div class="modal-body">

            {!! Form::open(array('route' => 'ev3.store','method'=>'POST')) !!}
                <div class="row">

                    <div class="col-xs-12 col-sm-12 col-md-12">
                        <div class="form-group">
                            <strong>Titulo:</strong>
                            {!! Form::text('titulo', null, array('placeholder' => 'Titulo','class' => 'form-control')) !!}
                        </div>
                    </div>
                    
                   <div class="col-xs-12 col-sm-12 col-md-12">
                        <div class="form-group">
                            <strong>Descripcion:</strong>
                            {!! Form::text('descripcion', null, array('placeholder' => 'Descripcion','class' => 'form-control')) !!}
                        </div>
                    </div>
                    
                </div>
        </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
        <button type="submit" class="btn btn-primary">Guardar</button>
      </div>
      {!! Form::close() !!}
    </div>
  </div>
</div>




@endsection