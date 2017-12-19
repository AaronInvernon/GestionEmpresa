
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="src/css/ATIclass.css" rel="stylesheet" type="text/css"/>
        <link href="src/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="src/css/style.css" rel="stylesheet" type="text/css"/>
        
        <title>Trabaja con nosotros</title>
    </head>
    <body>
        <div class="container">
            <form action="" class="" name="formularioRegistro" method="post" id="myForm">
                <h3 style=" color: #46b8da">Trabaja con Nosotros</h3>
                <hr/>
                <div class="col-lg-9">
                    <strong>Datos personales</strong><br/><br/>
                    <div class="form-inline">

                        <div class="form-group col-lg-4">
                            <div class="input-group">
                                <span class="input-group-addon">Nombre:</span>
                                <input type="text" class="form-control" name="txtNombre" id="txtNombre"/>
                            </div>
                        </div>

                        <div class="form-group col-lg-4">
                            <div class="input-group">
                                <span class="input-group-addon">Apellido1:</span>
                                <input type="text" class="form-control" name="txtApe1" id="txtApe1"/>
                            </div>
                        </div> 

                        <div class="form-group col-lg-4">    
                            <div class="input-group">
                                <span class="input-group-addon">Apellido2:</span>
                                <input type="text" class="form-control" name="txtApe2" id="txtApe2"/>
                            </div>
                        </div>
                    </div>

                    <br/>
                    <br/>

                    <div class="form-inline">

                        <div class="form-group col-lg-4">
                            <div class="input-group">
                                <span class="input-group-addon">
                                    <input type="radio" name="id" value="txtDni" id="txtDni"/>DNI   
                                    <input type="radio" name="id" value="txtNie" id="txtNie"/>NIE
                                </span>
                                <input type="text" class="form-control col-lg-2" name="txtId" id="txtId"/>
                            </div>
                        </div> 

                        <div class="form-group col-lg-4">    
                            <div class="input-group">
                                <span class="input-group-addon">NSS</span>
                                <input type="text" class="form-control" name="txtNss" id="txtNss"/>
                            </div>
                        </div>

                    </div>

                    <br/>
                    <br/>

                    <div class="form-inline">

                        <div class="form-group col-lg-4">    
                            <div class="input-group">
                                <span class="input-group-addon">Nacim:</span>
                                <input type="date" class="form-control" name="txtFechaNac" id="txtFechaNac"/>
                            </div>
                        </div>

                        <div class="form-group col-lg-4">    
                            <div class="input-group">
                                <span class="input-group-addon">Sexo:</span>
                                <select class="form-control" name="txtsexo" id="txtsexo">
                                    <option>Hombre</option>
                                    <option>Mujer</option>
                                </select>
                            </div>
                        </div>

                    </div>



                    <br/>
                    <br/>
                    <hr/>

                    <div class="form-inline">

                        <div class="form-group col-lg-5">    
                            <div class="input-group">
                                <span class="input-group-addon">Dirección</span>
                                <input type="text" class="form-control" name="txtCalle" id="txtCalle" placeholder="Calle/Avenida/Paseo"/>
                            </div>
                        </div>

                        <div class="form-group col-lg-5">    
                            <div class="input-group">
                                <input type="text" class="form-control" name="txtNumCalle" id="txtNumCalle" placeholder="n°"/>
                            </div>
                        </div>

                    </div>

                    <br/>
                    <br/>

                    <div class="form-inline">

                        <div class="form-group col-lg-4">    
                            <div class="input-group">
                                <span class="input-group-addon">Nacimiento:</span>
                                <input type="date" class="form-control" name="txtFechaNac" id="txtFechaNac"/>
                            </div>
                        </div>

                        <div class="form-group col-lg-6">    
                            <div class="input-group">
                                <span class="input-group-addon">Email:</span>
                                <input type="text" class="form-control" name="txtEmail" id="txtEmail"/>
                            </div>
                        </div>

                    </div>

                    <br/>
                    <br/>

                    <div class="form-inline">

                        <div class="form-group col-lg-5">    
                            <div class="input-group">
                                <span class="input-group-addon">Estudios:</span>
                                <select class="form-control" name="txtEstudios" id="txtEstudios">
                                    <option>E.S.O.</option>
                                    <option>Bachiller</option>
                                    <option>Ciclo Formativo Grado Medio</option>
                                    <option>Ciclo Formativo Grado Superior</option>
                                    <option>Licenciatura</option>
                                    <option>Grado</option>
                                    <option>Master/Doctorado</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group col-lg-5">    
                            <div class="input-group">
                                <span class="input-group-addon">Experiencia:</span>
                                <select class="form-control" name="txtExp" id="txtExp">
                                    <option>Menos de 6 meses</option>
                                    <option>Menos de 1 año</option>
                                    <option>Entre 1-2 años</option>
                                    <option>Entre 2-5 años </option>
                                    <option>Más de 5 años </option>
                                </select>
                            </div>
                        </div>

                    </div>
                    
                    <br/>
                    <br/>
                    
                    <div class="form-inline">

                        <div class="form-group col-lg-6">    
                            <div class="input-group">
                                <span class="input-group-addon">Introduce tu CV:</span>
                                <input type="file" class="form-control" name="txtCV" id="txtCV"/>
                            </div>
                        </div>

                    </div>
                    
                    <br/>
                    <br/>
                    
                    <div class="form-inline">


                        <div class="form-group col-lg-3">    
                            <div class="input-group">
                                <input type="submit" class="form-control" value="Enviar"/>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="col-lg-3">

                </div>
            </form>
        </div>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/jquery-1.12.3.min.js" type="text/javascript"></script>
        <script src="js/jquery.validate.js"></script><script>
  $(document).ready(function(){
    $("#myform").validate({
    rules: {
        txtNombre:{
            required:true,
        minlength:2,
        maxlength:25
        },
        txtApellidos:{
            required:true
        },
        txtEdad:{
            required:true,
            digits:true
        },
        txtDireccion:{
            required:true
        },
        txtCP:{
            required:true,
            digits:true,
            minlength:5,
            maxlength:5
        },    
        txtCorreo:{
            email:true,
            required:true
        },
        txtPagina:{
            url:true,
            required:true
        },
        txtPassword:{
            required:true
        minlength:5,
        maxlength:5
        },
        txtPasswordb:{
            required:true,
            equalTo: "#idPassword"
        },
  
    },
    submitHandler: function(){
            alert("rqr");
    }
    });
  });
</script>
    </body>
</html>
