
<%@page import="java.sql.CallableStatement"%>
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
        <link rel="stylesheet" href="src/css/formulario.css" type="text/css"/>
        <title>Trabaja con nosotros</title>
    </head>
    <body>
        <div class="container">
            <form  class="" name="formularioRegistro" method="post" id="myForm">
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
                                <select class="form-control" name="txtSexo" id="txtSexo">
                                    <option value="H">Hombre</option>
                                    <option value="M">Mujer</option>
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
                                    <option value="E.S.O.">E.S.O.</option>
                                    <option value="Bachiller">Bachiller</option>
                                    <option value="FP-1">Ciclo Formativo Grado Medio</option>
                                    <option value="FP-2">Ciclo Formativo Grado Superior</option>
                                    <option value="Licenciatura">Licenciatura</option>
                                    <option value="Grado">Grado</option>
                                    <option value="Master/Doctorado">Master/Doctorado</option>
                                </select>
                           
                        </div>

                        <div class="form-group ">    
                                <label>Experiencia:</label>
                                <select class="form-control" name="txtExp" id="txtExp">
                                    <option value="menos de 6 meses">Menos de 6 meses</option>
                                    <option value="menos de 1 año">Menos de 1 año</option>
                                    <option value="1-2 años">Entre 1-2 años</option>
                                    <option value="2-5 años">Entre 2-5 años </option>
                                    <option value="mas de 5 años">Más de 5 años </option>
                                </select>
                            
                        </div>
                        <div class="form-group ">    
                                <label>Disponibilidad:</label>
                                <select class="form-control" name="txtDisp" id="txtDisp">
                                    <option value="inmediata">Inmediata</option>
                                    <option value="una semana">Una semana</option>
                                    <option value="15 dias">15 días</option>
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
                            
                            <input type="button"  class=" btn btn-primary" value="Enviar" id="Enviar"></input>
                                <input type="reset" class=" btn btn-danger" value="Limpiar"/>
                        </div>

                   
                </div>
                <div class="">

                </div>
            </form>
            <%
            if(request.getParameter("txtNombre")!=null){

                String user = "ceo"; // HAY QUE CAMBIAR EL USUARIO POR EL DE SESSION (CREAR UN USUARIO EN LA BASE DE DATOS)
                String pass = "1234";
  
                String dato = request.getParameter("txtFechaNac");
                String[] datoArray = dato.split("-");
                String resultado="";
                    for(int j=2; j>=0 ; j--){
                        resultado = resultado +"/"+ datoArray[j];
                    }
                String fecha = resultado.substring(1, resultado.length());
 
                String vacante = "JEFE DE MANTENIMIENTO";
                String dniNie = request.getParameter("txtId").toUpperCase();
                String nombre = request.getParameter("txtNombre");
                String apellidos = request.getParameter("txtApe1") +" "+ request.getParameter("txtApe2");
                String sexo = request.getParameter("txtSexo");
                String nss = request.getParameter("txtNss");
                String direccion = request.getParameter("txtCalle") + " " + request.getParameter("txtNumCalle");
                String experiencia = request.getParameter("txtExp");
                String disponibilidad = request.getParameter("txtDisp");
                String estudios = request.getParameter("txtEstudios");
                String telefono = request.getParameter("txtTlfno");
                String mail = request.getParameter("txtEmail");
                basico.Conectar(user, pass);
                String cadena="insert into ateam_candi values('"+vacante+"','"+dniNie+"',initcap('"+nombre+"'),initcap('"+apellidos+"'),'"+sexo+"','"+nss+"',to_date('"+fecha+"','dd/mm/yyyy'),'',initcap('"+direccion+"'),upper('"+experiencia+"'),upper('"+disponibilidad+"'),upper('"+estudios+"'),'"+telefono+"','"+mail+"','EN ESPERA')";
                basico.crearPreparedStatement(cadena);
                basico.ejUpdatePrepStat();
                basico.crearCallableStatement("{call system.P_ATEAM_CANDI_EDAD('"+dniNie+"')}");
                basico.ejCallableStatement();
                    
                basico.finConectar();
		response.sendRedirect("candidaturaCorrecta.html");
                } 
            %>
        </div>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/jquery-1.12.3.min.js" type="text/javascript"></script>
      
    </body>
</html>
