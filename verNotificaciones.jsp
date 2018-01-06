<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<jsp:useBean id="basico" scope="session" class="nuestrosBeans.baseDeDatos"/>
<!DOCTYPE html>
<html>
    <head>
        <title> Notificaciones </title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="src/css/ATIclass_Dashboard.css" rel="stylesheet" type="text/css"/>
        <link href="src/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="src/css/style.css" rel="stylesheet" type="text/css"/>
        <script src="src/js/jquery-1.12.3.min.js" type="text/javascript"></script>
    </head>
    <%
        String notificacion = request.getParameter("noti");

        if (notificacion != null) {
            ResultSet contenido = null;
            ResultSetMetaData meta = null;
            session.setAttribute("NOTIFICACION", notificacion);
            basico.Conectar((String)session.getAttribute("Usuario"), (String)session.getAttribute("Contraseña"));
            basico.crearStatement();
            contenido = basico.crearResultSet("select remitente, destinatario, tipo, mensaje, fecha_env from ateam_sms where id='" + (String) session.getAttribute("NOTIFICACION") + "'");
            contenido.next();
            String varRemite = contenido.getString(1);
            String varDestino = contenido.getString(2);
            String varTipo = contenido.getString(3);
            String varMensaje = contenido.getString(4);
            String varFecha = contenido.getString(5);
            basico.finConectar();
    %>
    <body>
        <div class="container" style="width: 400px">
            <div  style="width: 100%; height: 600px; background-color: white; margin-top: 20px;">
                <!--Cabecera-->
                <div style="background-color: #f5f5f5; width: 100%; height: 76px; padding: 10px">
                    <div class="sidebar-item-pic" style=" padding-left: 10px; margin-right: 10px "></div>
                    <div>
                        <strong style=" color: #46b8da; font-size: 16px">De: <%=varRemite%></strong>
                        <span class="badge badge-pill badge-primary" style="background-color: orange; float: right"><%=varTipo%></span>
                        <br/>
                        <span class="small text-muted">Para: <%=varDestino%></span>

                    </div> 
                </div>       
                <div style="padding: 20px">
                    <form action="verNotificaciones.jsp" method="post">  <!-- ATENCION!! DAR LA ACCION DEL FORMULARIO! -->
                        <hr/>
                        <strong>Fecha de envío: </strong> <%=varFecha%><br/> <input type="text" name="txtEmple" value="<%=varRemite%>" hidden>
                        <strong>Contenido del mensaje: </strong><br/>
                        <fieldset> <%=varMensaje%> </fieldset> <br/> <input type="text" name="txtMensaje" value="<%=varMensaje%>" hidden>
                        <hr/> <input type="text" name="txtTipo" value="<%=varTipo%>" hidden>
                        <div class="input-group">
                            <span class="input-group-addon">Contraseña:</span>  
                            <input class="form-control" style="width: 200px" type="password" name="pass"/>

                            <!-- TIENE que validar que la contraseña introducida es válida (para el usuario en la sesion de RRHH -->
                        </div>
                        <hr/>
                        <div style="display:flex; justify-content: space-around;">
                            <input class="btn btn-primary" type="submit" value="Aceptar" name="submit" id="Aceptar"/>
                            <input class="btn btn-primary" type="submit" value="Borrar" name="submit" id="Borrar"/>
                            

                        </div>
                    </form>
                    <%
                        }

                        if (request.getParameter("pass") != null) {
                            // HAY QUE SUSTITUIR ESTA VARIABLE POR LA DE SESSION CON EL NOMBRE DEL USUARIO session.getAttribute("usuario");
                            basico.Conectar((String)session.getAttribute("Usuario"), (String)session.getAttribute("Contraseña"));
                            basico.crearStatement();
                            String cadenoide = "select password, departamento from ateam_emp where lower(nombre)=lower('" + (String)session.getAttribute("Usuario") + "')";
                            ResultSet prueba = basico.crearResultSet(cadenoide);
                            System.out.println(cadenoide);
                            prueba.next();
                            String test = prueba.getString(1);
                            String depa = prueba.getString(2);
                            String chkTip = request.getParameter("txtTipo");
                            
                            System.out.println((String)session.getAttribute("Usuario"));
                            System.out.println(test);
                            System.out.println(depa);
                            System.out.println(chkTip);

                            basico.finConectar();
                            if (test.equals(request.getParameter("pass")) && depa.equals("ADMINISTRACION")) {
                                
                                if(chkTip.equals("Vacaciones") || chkTip.equals("Dias Libres") || chkTip.equals("Horas Libres")){

                                    if (request.getParameter("submit").equals("Aceptar")) {

                                        String para = request.getParameter("txtEmple");
                                        String cuerpo = request.getParameter("txtMensaje");
                                        basico.Conectar((String)session.getAttribute("Usuario"), request.getParameter("pass")); // la pass es 1234
                                        basico.crearPreparedStatement("insert into ateam_sms(remitente,destinatario,tipo,mensaje,fecha_env,id) values(upper('"+(String)session.getAttribute("Usuario")+"'),upper('"+para+"'),'Solicitud Aceptada','Su solicitud:\'\' "+cuerpo+" \'\' ha sido aceptada',to_date(sysdate,'dd/mm/yy hh24:mi'),seq_ateam_sms.nextval)"); 
                                        basico.ejUpdatePrepStat();
                                        basico.finConectar();

                                        basico.Conectar((String)session.getAttribute("Usuario"), request.getParameter("pass"));
                                        basico.crearPreparedStatement("delete from ateam_sms where id='"+(String)session.getAttribute("NOTIFICACION")+"'");
                                        basico.ejUpdatePrepStat();
                                        basico.finConectar();


                                    } else if (request.getParameter("submit").equals("Borrar")) {

                                        String para = request.getParameter("txtEmple");
                                        String cuerpo = request.getParameter("txtMensaje");

                                        basico.Conectar((String)session.getAttribute("Usuario"), request.getParameter("pass")); // la pass es 1234
                                        basico.crearPreparedStatement("insert into ateam_sms(remitente,destinatario,tipo,mensaje,fecha_env,id) values(upper('"+(String)session.getAttribute("Usuario")+"'),upper('"+para+"'),'Solicitud Rechazada','Su solicitud:\'\' "+cuerpo+" \'\' ha sido rechazada',to_date(sysdate,'dd/mm/yy hh24:mi'),seq_ateam_sms.nextval)"); 
                                        basico.ejUpdatePrepStat();
                                        basico.finConectar();


                                        basico.Conectar((String)session.getAttribute("Usuario"), request.getParameter("pass"));
                                        basico.crearPreparedStatement("delete from ateam_sms where id='"+(String)session.getAttribute("NOTIFICACION")+"'");
                                        basico.ejUpdatePrepStat();
                                        basico.finConectar();

                                    }
                                } else {

                                    if (request.getParameter("submit").equals("Borrar")) {

                                    basico.Conectar((String)session.getAttribute("Usuario"), request.getParameter("pass"));
                                    basico.crearPreparedStatement("delete from ateam_sms where id='"+(String)session.getAttribute("NOTIFICACION")+"'");
                                    basico.ejUpdatePrepStat();
                                    basico.finConectar();
                                    }
                                }
                            } else if(test.equals(request.getParameter("pass")) && depa!="ADMINISTRACION") {
    
                                if (request.getParameter("submit").equals("Borrar")) {

                                    basico.Conectar((String)session.getAttribute("Usuario"), request.getParameter("pass"));
                                    basico.crearPreparedStatement("delete from ateam_sms where id='"+(String)session.getAttribute("NOTIFICACION")+"'");
                                    basico.ejUpdatePrepStat();
                                    basico.finConectar();
                                    }
                            } 
                            if(depa.equals("ADMINISTRACION")){
                            %>
                                <jsp:forward page="DashboardAdmin.jsp"/>
                            <%
                            } else if(depa.equals("RRHH")){
                            %>
                                <jsp:forward page="DashboardRRHH.jsp"/>
                            <%
                            }else if(depa.equals("SECRETARIA")){
                            %>
                                <jsp:forward page="DashboardSecretaria.jsp"/>
                            <%
                            }else if(depa.equals("MANTENIMIENTO")){
                            %>
                                <jsp:forward page="DashboardMantenimiento.jsp"/>
                            <%
                            }else if(depa.equals("DIRECCION")){
                            %>
                                <jsp:forward page="DashboardDireccion.jsp"/>
                            <%
                            }else if(depa.equals("DESARROLLO")){
                            %>
                                <jsp:forward page="DashboardDesarrollo.jsp"/>
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