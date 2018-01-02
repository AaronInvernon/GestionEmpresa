
<%@page import="java.sql.ResultSet"%>
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
                    <%
                        
                    String user = "ceo"; // HAY QUE CAMBIAR EL USUARIO POR EL DE SESSION (CREAR UN USUARIO EN LA BASE DE DATOS)
                    String pass = "1234";
                    
                    ResultSet rset= null;
                    basico.Conectar(user, pass);
                    basico.crearStatement();
                    rset = basico.crearResultSet("select initcap(puesto) as puesto from ateam_vacant");
                    %>
                    <strong>Puestos vacantes:</strong><br/><br/>
                    <%
                    if (rset.isBeforeFirst()==true){
                        while(rset.next()){
                            String puesto = rset.getString(1).toUpperCase();
                    %>
                        <input type="radio" name="rdbPuesto" value="<%=puesto%>"/><%=puesto%> <br/>
                    <%
                        }
                    }else if (rset.isBeforeFirst()==false){
                    %>
                        Lo sentimos, pero en estos momentos no existen puestos vacantes. <br/>
                    <%
                    }
                    basico.finConectar();
                    %>
                    
                    <hr/>
                    <br/><strong>Datos personales:</strong><br/><br/>
                    <br/>

                        <div class="form-group">
                                <label>Nombre:</label>
                                <input type="text" class="form-control" name="txtNombre" id="txtNombre"/>
                                <span id="errorNombre">Introduce un nombre correcto</span>    
                        </div>
                        

                        <div class="form-group ">
                            <label>1º Apellido:</label>
                                <input type="text" class="form-control" name="txtApe1" id="txtApe1"/>
                                <span id="errorApe1">Introduce un apellido correcto</span> 
                            
                        </div> 

                        <div class="form-group ">    
                            
                                <label>2º Apellido:</label>
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
                    <hr/>
                    <strong>Datos de contacto:</strong><br/><br/>
                    <br/>
                    
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
                    <hr/>
                    <strong>Sitiación Actual:</strong><br/><br/>
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
                <div class=""></div>
            </form>
            <%
            if(request.getParameter("txtNombre")!=null && request.getParameter("rdbPuesto")!=null){

                String dato = request.getParameter("txtFechaNac");
                String[] datoArray = dato.split("-");
                String resultado="";
                    for(int j=2; j>=0 ; j--){
                        resultado = resultado +"/"+ datoArray[j];
                    }
                String fecha = resultado.substring(1, resultado.length());
                
                String vacante = request.getParameter("rdbPuesto");
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
                
                String cadena="insert into ateam_candi values('"+vacante+"','"+dniNie+"',initcap('"+nombre+"'),initcap('"+apellidos+"'),'"+sexo+"','"+nss+"',to_date('"+fecha+"','dd/mm/yyyy'),'',initcap('"+direccion+"'),upper('"+experiencia+"'),upper('"+disponibilidad+"'),upper('"+estudios+"'),'"+telefono+"','"+mail+"','EN ESPERA',to_char(sysdate,'HH24:MI:SS'))";
                basico.Conectar(user, pass);
                basico.crearPreparedStatement(cadena);
                basico.ejUpdatePrepStat();
                basico.crearCallableStatement("{call system.P_ATEAM_CANDI_EDAD('"+dniNie+"')}");
                basico.ejCallableStatement();
                basico.finConectar();
                
		response.sendRedirect("candidaturaCorrecta.html");
                }else{
                %>
                <h5> Por favor, antes de enviar los datos comprueba que todos los campos han sido rellenados correctamente y que se ha seleccionado un puesto vacante.</h5>
                <%
            } 
            %>
        </div>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/jquery-1.12.3.min.js" type="text/javascript"></script>
      
    </body>
</html>
