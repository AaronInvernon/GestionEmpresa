<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<jsp:useBean id="basico" scope="session" class="nuestrosBeans.baseDeDatos"/>
<!DOCTYPE html>
<html>
    <head>
        <title> Nueva Candidatura </title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="src/css/ATIclass.css" rel="stylesheet" type="text/css"/>
        <link href="src/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="src/css/style.css" rel="stylesheet" type="text/css"/>
    </head>
                    <%
                    ResultSet candidato =null;
                    ResultSetMetaData meta =null;
                    String dniCandi = "71307312K";
                    basico.Conectar("ceo", "1234");
                    basico.crearStatement();
                    candidato = basico.crearResultSet("select puesto_sol, dni, cnombre, capellidos, sexo, nss, to_char(fecha_nac,'DD/MM/YYYY'), edad, initcap(experiencia), disponibilidad, initcap(estudios), telefono, lower(email), initcap(direccion) from ateam_candi where dni='"+dniCandi+"'");
                    candidato.next();
                    String varPuesto = candidato.getString(1);
                    String varDniNie = candidato.getString(2);
                    String varNom = candidato.getString(3);
                    String varApe1 = candidato.getString(4);
                    String varSex = candidato.getString(5);
                    String varNss = candidato.getString(6);
                    String varFechaNac = candidato.getString(7);
                    String varEdad = candidato.getString(8);
                    String varExp = candidato.getString(9);
                    String varDisp = candidato.getString(10);
                    String varEstudios = candidato.getString(11);
                    String varTelef = candidato.getString(12);
                    String varEmail = candidato.getString(13);
                    String varDir = candidato.getString(14);
                    basico.finConectar();
                %>
    <body>
        <div class="container" style="width: 400px">
            <div  style="width: 100%; height: 600px; background-color: white; margin-top: 20px;">
                <!--Cabecera-->
                <div style="background-color: #f5f5f5; width: 100%; height: 76px; padding: 10px">
                    <div class="sidebar-item-pic" style=" padding-left: 10px; margin-right: 10px "></div>
                    <div>
                        <strong style=" color: #46b8da; font-size: 16px">[<%=varNom%> <%=varApe1%>]</strong>
                        <span class="badge badge-pill badge-primary" style="background-color: orange; float: right">Nueva Solicitud</span>
                        <br/>
                        <span class="small text-muted">[<%=varPuesto%>]</span>

                    </div> 
                </div>       
                <div style="padding: 20px">
                    <form action="NuevaCandidatura_RRHH.jsp" method="post" name='form1'>  <!-- ATENCION!! DAR LA ACCION DEL FORMULARIO! -->
                        <%=varNom%> <%=varApe1%><br/>
                        <strong>DNI/NIE:</strong> <%=varDniNie%><br/>
                        <strong> NSS:</strong> <%=varNss%><br/>
                        <strong>Fecha Nac:</strong> <%=varFechaNac%> (<%=varEdad%>)<br/>
                        <strong>Sexo:</strong> <%=varSex%> <br/>
                        <strong>Dirección:</strong> <%=varDir%> <br/>
                        <strong>Teléfono:</strong> <%=varTelef%><br/>
                        <strong>Correo electrónico:</strong> <%=varEmail%><br/>
                        <strong>Estudios:</strong> <%=varEstudios%> <br/>
                        <strong>Experiencia:</strong> <%=varExp%> <br/>
                        <strong>CV:</strong> <a href="#" target='_blank'> CV.pdf</a> <br/>
                        <hr/>
                        <div class="input-group">
                            <span class="input-group-addon">Contraseña:</span>  
                            <input class="form-control" style="width: 200px" type="password" name="pass"/>

        <!-- TIENE que validar que la contraseña introducida es válida (para el usuario en la sesion de RRHH -->
                        
                        </div>
                        <hr/>
                            <div style="display:flex; justify-content: space-around;">
                                <input class="btn btn-primary" type="submit" value="Aceptar" name="elSub" />
                                <input class="btn btn-primary" type="submit" value="Rechazar" name="elSub"/>
                                
                            </div>
                    </form>
                    <%
                        if(request.getParameter("pass")!=null){
                            String usuario = "ceo"; // HAY QUE SUSTITUIR ESTA VARIABLE POR LA DE SESSION CON EL NOMBRE DEL USUARIO session.getAttribute("usuario");
                            basico.Conectar("system", "javaoracle");
                            basico.crearStatement();
                            ResultSet prueba = basico.crearResultSet("select password from ateam_emp where lower(puesto)=lower('"+usuario+"')");
                            prueba.next();
                            String test = prueba.getString(1);
                            basico.finConectar();
                            
                            if(test.equals(request.getParameter("pass"))){
                                
                                if(request.getParameter("elSub").equals("Aceptar")){

                                    basico.Conectar(usuario, request.getParameter("pass")); // la pass es 1234
                                    basico.crearPreparedStatement("update ateam_candi set estado_candidatura='ACEPTADO' where dni='"+varDniNie+"'");
                                    basico.ejUpdatePrepStat();
                                    basico.finConectar();
                                    %>
                                    <div class='bg-success'> <h5>El candidato ha sido aceptado</h5> </div>
                                    <%
                                }else if(request.getParameter("elSub").equals("Rechazar")){

                                    basico.Conectar(usuario, request.getParameter("pass"));
                                    basico.crearPreparedStatement("update ateam_candi set estado_candidatura='RECHAZADO' where dni='"+varDniNie+"'");
                                    basico.ejUpdatePrepStat();
                                    basico.finConectar();
                                   %>
                                   <div class='bg-success'> <h5>El candidato ha sido rechazado</h5> </div>
                                   <%
                              }

                            } else{
                                    %>
                                    <div class='bg-danger'> <h5>La contraseña introducida no es correcta</h5> </div>
                                    <%
                                    }
                        }
                    %>
                </div>
            </div>
        </div>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/jquery-1.12.3.min.js" type="text/javascript"></script>
    </body>
</html>

