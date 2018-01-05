<%@page import="java.sql.ResultSet"%>
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
        <title>Estado de tu candidatura</title>
    </head>
    <body>
        <div class="container" style='display: flex;justify-content: center;'>
            <div>
                <form action="ConsultarCandidatura.jsp" method="post">
                    <h3 style=" color: #46b8da">Candidatos</h3>
                    <hr/>
                    <div class="col-lg-12">
                        <strong>Introduce tu DNI o NIE:</strong> <input type="text" name='txtDniNie' /> <br/>
                        <input align='center' type="submit" name='submit' value='Ver'/>
                    </div>
                </form>
  
        <%
        if(request.getParameter("txtDniNie")!=null){
                    
                String dni = request.getParameter("txtDniNie");
                String user="externo";
                String pass="1111";
                ResultSet estad =null;
                String cadena = "select puesto_sol, cnombre||' '||capellidos, estado_candidatura from ateam_candi where upper(dni)=upper('"+dni+"')";
                System.out.println(cadena);

                basico.Conectar(user, pass);
                basico.crearStatement();
                estad = basico.crearResultSet(cadena);
      
                if (estad.isBeforeFirst()==true){
                    estad.next();
        %>
                <hr/>
                <br/><br/>
                <table align="center">
                    <tr>
                        <td style="width:90px;"><strong>Puesto: </strong></td>
                        <td> <%=estad.getString(1)%></td>
                    </tr>
                    <tr>
                        <td style="width:90px;"><strong>Nombre: </strong></td>
                        <td> <%=estad.getString(2)%></td>
                    </tr>
                    <tr>
                        <td style="width:90px;"><strong>Candidatura: </strong></td>
                        <td> <%=estad.getString(3)%></td>
                    </tr>
                </table>
                <br/><br/>
                <input type="button" value="Cerrar" onclick="window.close()">
        <%
                }else{
        %>
                <hr/>
                <br/><br/>
                <p>El DNI/NIE introducido no se corresponde con ninguno de nuestros candidatos.</p>
                <br/><br/>
                <input type="button" value="Cerrar" onclick="window.close()">
        <%
                }
        }
        %>
            </div>
        </div>
    </body>
</html>
