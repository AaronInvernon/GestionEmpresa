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
                    ResultSet prueba =null;
                    ResultSetMetaData meta =null;
                    String dniCandi = "71307312K";
                    basico.Conectar("ceo", "1234");
                    basico.crearStatement();
                    prueba = basico.crearResultSet("select puesto_sol, dni, cnombre, capellidos, sexo, nss, to_char(fecha_nac,'DD/MM/YYYY'), edad, initcap(experiencia), disponibilidad, initcap(estudios), telefono, lower(email), initcap(direccion) from ateam_candi where dni='"+dniCandi+"'");
                    prueba.next();
                    String varPuesto = prueba.getString(1);
                    String varDniNie = prueba.getString(2);
                    String varNom = prueba.getString(3);
                    String varApe1 = prueba.getString(4);
                    String varSex = prueba.getString(5);
                    String varNss = prueba.getString(6);
                    String varFechaNac = prueba.getString(7);
                    String varEdad = prueba.getString(8);
                    String varEstudios = prueba.getString(11);
                    String varExp = prueba.getString(9);
                    String varDisp = prueba.getString(10);
                    String varTelef = prueba.getString(12);
                    String varEmail = prueba.getString(13);
                    String varDir = prueba.getString(14);
                    
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
                    <form action="NuevaCandidatura_RRHH.jsp">  <!-- ATENCION!! DAR LA ACCION DEL FORMULARIO! -->
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
                    <strong>CV:</strong> <a href="#" target='_blank'> Vicario_Arroyo_Ester_CV.pdf</a> <br/>
                    <hr/>
                    <div class="input-group">
                        <span class="input-group-addon">Contraseña:</span>  
                        <input class="form-control" style="width: 200px" type="password" name="pass"/>
                        
        <!-- TIENE que validar que la contraseña introducida es válida (para el usuario en la sesion de RRHH -->
                        
                    </div>
                    <hr/>
                        <div style="display:flex; justify-content: space-around;">
                            <input class="btn btn-primary" type="submit" value="Aceptar" name="Aceptar"/>
                            <input class="btn btn-primary" type="submit" value="Rechazar" name="Rechazar"/>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/jquery-1.12.3.min.js" type="text/javascript"></script>
    </body>
</html>

