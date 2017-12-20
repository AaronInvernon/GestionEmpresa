
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="basico" scope="session" class="nuestrosBeans.baseDeDatos"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="src/css/ATIclass.css" rel="stylesheet" type="text/css"/>
        <link href="src/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="src/css/style.css" rel="stylesheet" type="text/css"/>
        <script src="src/js/validacionRegistroBlur.js" type="text/javascript"></script>
        <style>
            span{
                visibility: hidden;
            }
            .error{
                color:red;
            }
            .errorInput{
                background: rgba(255, 99, 71, 0.5);
                border:red 1px solid;
            }
            
            .okInput{
                background: rgba(160, 242, 130, 0.1);
                border:green 1px solid;
            }
        </style>
        <title>Trabaja con nosotros</title>
    </head>
    <body>
        <div class="container">
            <form action="" class="" name="formularioRegistro" method="post" id="myForm">
                <h3 style=" color: #46b8da">Trabaja con Nosotros</h3>
                <hr/>
                <div class="col-lg-12">
                    <strong>Datos personales</strong><br/><br/>
                    

                        <div class="form-group">
                                <label>Nombre:</label>
                                <input type="text" class="form-control" name="txtNombre" id="txtNombre"/>
                                <span id="errorNombre">Introduce un nombre correcto</span>    
                        </div>
                        

                        <div class="form-group ">
                                <label>Apellido1:</label>
                                <input type="text" class="form-control" name="txtApe1" id="txtApe1"/>
                                <span id="errorApe1">Introduce un apellido correcto</span> 
                            
                        </div> 

                        <div class="form-group ">    
                            
                                <label>Apellido2:</label>
                                <input type="text" class="form-control" name="txtApe2" id="txtApe2"/>
                                <span id="errorApe2">Introduce un apellido correcto</span> 
                            
                        </div>
                    
                    <br/>
                    <br/>

                        <div class="form-group ">
                            
                                <label>
                                    <input type="radio" name="id" value="txtDni" id="txtDni"/>DNI   
                                    <input type="radio" name="id" value="txtNie" id="txtNie"/>NIE
                                </label>
                                <input type="text" class="form-control " name="txtId" id="txtId"/>
                                <span id="errorDNI">Introduce el formato correcto</span>
                            
                        </div> 

                        <div class="form-group ">    
                            
                                <label>NSS</label>
                                <input type="text" class="form-control" name="txtNss" id="txtNss"/>
                                <span id="errorNss">Solo se admiten 12 digitos</span>
                            
                        </div>

                    

                    <br/>
                    <br/>

                   

                        <div class="form-group ">    
                            
                                <label>Nacim:</label>
                                <input type="date" class="form-control" name="txtFechaNac" id="txtFechaNac"/>
                            
                        </div>

                        <div class="form-group ">    
                            
                                <label>Sexo:</label>
                                <select class="form-control" name="txtsexo" id="txtsexo">
                                    <option>Hombre</option>
                                    <option>Mujer</option>
                                </select>
                            
                        </div>

                    


                    <br/>
                    <br/>
                    <hr/>


                        <div class="form-group ">    
                            
                                <label>Dirección</label>
                                <input type="text" class="form-control" name="txtCalle" id="txtCalle" placeholder="Calle/Avenida/Paseo"/>
                            
                        </div>

                        <div class="form-group ">    
                            
                                <input type="text" class="form-control" name="txtNumCalle" id="txtNumCalle" placeholder="n°"/>
                            
                        </div>

                   

                    <br/>
                    <br/>


                        <div class="form-group ">    
                                <label>Email:</label>
                                <input type="text" class="form-control" name="txtEmail" id="txtEmail"/>
                                <span id="errorMail">Introduce un formato de mail correcto</span>
                            
                        </div>
                        
                        <div class="form-group ">    
                                <label>Teléfono: </label>
                                <input type="text" class="form-control" name="txtTlfno" id="txtTlfno"/>
                                <span id="errorTlfno">Solo se admiten 9 digitos</span>
                            
                        </div>

                  

                    <br/>
                    <br/>

                  

                        <div class="form-group ">    
                                <label>Estudios:</label>
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

                        <div class="form-group ">    
                                <label>Experiencia:</label>
                                <select class="form-control" name="txtExp" id="txtExp">
                                    <option>Menos de 6 meses</option>
                                    <option>Menos de 1 año</option>
                                    <option>Entre 1-2 años</option>
                                    <option>Entre 2-5 años </option>
                                    <option>Más de 5 años </option>
                                </select>
                            
                        </div>
                        <div class="form-group ">    
                                <label>Disponibilidad:</label>
                                <select class="form-control" name="txtExp" id="txtExp">
                                    <option>Inmediata</option>
                                    <option>Una semana</option>
                                    <option>15 días</option>
                                </select>
                            
                        </div>

                    
                    
                    <br/>
                    <br/>
                    
                   

                        <div class="form-group ">    
                                <label>Introduce tu CV:</label>
                                <input type="file" class="form-control" name="txtCV" id="txtCV"/>
                           
                        </div>

              
                    
                    <br/>
                    <br/>
                    
                 


                        <div class="form-group ">    
                                <input type="submit" class="form-control btn btn-primary" value="Enviar"/>
                            
                        </div>

                   
                </div>
                <div class="">

                </div>
            </form>
        </div>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/jquery-1.12.3.min.js" type="text/javascript"></script>
      
    </body>
</html>
