<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="basico" scope="session" class="nuestrosBeans.baseDeDatos"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="src/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="src/css/ATIclass_Dashboard.css" rel="stylesheet" type="text/css"/>
        <link href="src/css/cuadroBienvenido.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Direccion</title>

    </head>
    <body>
        <header>
            <a href="DashboardDireccion.jsp" class="navbar-brand">[A_Team_Inc]</a>
            <input type="checkbox" class="mybtn" id="btn-menu">
            <input type="checkbox" class="mybtn" id="btn-notificaciones">
            <label for="btn-menu"><span class="fa fa-bars" id="icono"></span></label>

            <nav class="menu">

                <ul>
                    <%
                        String emp = null;
                        String calen = null;
                    %>
                    <li class="boton"><a href="DashboardDireccion.jsp?emp=jerarquia">Empleados</a></li>

                    <li class="boton"><a href="DashboardCalendario.jsp?calen=1">Calendario</a></li>
                    <li class="boton"><a href="DashboardDireccion.jsp?reun=1">Reservar Sala</a></li>

                    <li class="mynotes" id="mynotes"><a href="#">Notificaciones</a>
                        <ul>
                            <li>
                                <div class="sidebar-item"><a href="#">
                                        <div class="sidebar-item-pic"></div>
                                        <div class="sidebar-item-content">

                                            <strong>David Miller</strong><p class="myhour">11:21 AM</p>
                                            <div class="mypill">Nueva Solicitud</div>



                                        </div> </a>  
                                </div>
                            </li>
                            <li>
                                <div class="sidebar-item"><a href="#">
                                        <div class="sidebar-item-pic"></div>
                                        <div class="sidebar-item-content">

                                            <strong>David Miller</strong><p class="myhour">11:21 AM</p>
                                            <div class="mypill">Nueva Solicitud</div>



                                        </div> </a>  
                                </div>
                            </li>
                            <li>
                                <div class="sidebar-item"><a href="#">
                                        <div class="sidebar-item-pic"></div>
                                        <div class="sidebar-item-content">

                                            <strong>David Miller</strong><p class="myhour">11:21 AM</p>
                                            <div class="mypill">Nueva Solicitud</div>



                                        </div> </a>  
                                </div>
                            </li>

                            <li>
                                <div class="sidebar-item"><a href="#">
                                        <div class="sidebar-item-pic"></div>
                                        <div class="sidebar-item-content">

                                            <strong>David Miller</strong><p class="myhour">11:21 AM</p>
                                            <div class="mypill">Nueva Candidato</div>
                                        </div> </a>  
                                </div>
                            </li>
                        </ul>
                    <li class="boton"><a href="index.jsp">Log Out</a></li>
                </ul>
            </nav>
        </header>
        <%
            if (request.getParameter("reun") != null) {
        %>
        <h4 align="center"> Debe comprobar la disponibilidad de la sala antes de poder reservarla </h4>
        <jsp:include page="FormularioReservaSR.jsp"/>  
        <%
        } else if (request.getParameter("emp") != null) {
        %>
        <jsp:include page="jerarquia_1.jsp"/>  
        <%
        } else if (request.getParameter("n_emp") != null) {
        %>
        <jsp:include page="BarsInOut.jsp"/> 
        <%
        } else if (request.getParameter("calen") != null) {
        %>
        <jsp:include page="FormularioDeSolicitud.jsp"/> 
        <%
        } else {

            ResultSet empleado = null;
            basico.Conectar((String) session.getAttribute("Usuario"), (String) session.getAttribute("Contraseña"));
            basico.crearStatement();
            empleado = basico.crearResultSet("select n_emp from ateam_emp where upper(nombre) =upper('" + (String) session.getAttribute("Usuario") + "')");
            empleado.next();
            String numero = "BarsInOut_2.jsp?n_emp=" + empleado.getString(1);
        %>
        <section id="section">
            <h1>>Dirección</h1>

            <p>Bienvenido <%=(String) session.getAttribute("Usuario")%></p>
        </section>
        <div>
            <jsp:include page="<%=numero%>" />
        </div>
        <%
            }
        %>
        <div class="PopUpIn" >
            <div class="InBox">
                <a><strong>X</strong></a>
                <h4 style="position:relative; left: 5%; color: grey; text-align: center">Haz clic aquí</h4>
                <h5 style="color: grey; text-align: center">para iniciar tu jornada laboral</h5>
                <input id= "entrada" class="btn btn-primary"  type="submit" name="status" value="Marcar Entrada"/>
            </div> 
        </div>
        <div class="PopUpEat" >
            <div class="EatBox">
                <a><strong>X</strong></a>
                <h4 style="position:relative; left: 5%; color: grey; text-align: center">¡Hora de comer!</h4>
                <h5 style="color: grey; text-align: center">para iniciar tu jornada laboral</h5>
                <input id= "comida" class="btn btn-primary"  type="submit" name="status" value="Marcar Comida"/>
                <input id= "comida" class="btn btn-primary"  type="button" name="status" value="Mas Tarde"/>
            </div> 
        </div>
        <div class="PopUpOut" >
            <div class="OutBox">
                <a><strong>X</strong></a>
                <h4 style="position:relative; left: 5%; color: grey; text-align: center">Finalizar</h4>
                <h5 style="color: grey; text-align: center">Tu horario a culminado</h5>
                <input id= "comida" class="btn btn-primary"  type="submit" name="status" value="Marcar Comida"/>
                <input id= "comida" class="btn btn-primary"  type="button" name="status" value="Mas Tarde"/>
            </div> 
        </div>
        <script src="src/js/jquery-1.12.3.min.js" type="text/javascript"></script>
        <script src="src/js/Dashboards.js" type="text/javascript"></script>
    </body>
</html>
