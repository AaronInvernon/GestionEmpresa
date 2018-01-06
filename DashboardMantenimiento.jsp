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
        <title>Mantenimiento</title>

    </head>
    <body onload="renderTime();">
        <header>
            <a href="DashboardMantenimiento.jsp" class="navbar-brand">[A_Team_Inc]</a>
            <input type="checkbox" class="mybtn" id="btn-menu">
            <input type="checkbox" class="mybtn" id="btn-candidaturas">
            <label for="btn-menu"><span class="fa fa-bars" id="icono"></span></label>

            <nav class="menu">

                <ul>
                    <%
                        String calen = null;
                    %>
                    <li class="boton"><a href="DashboardMantenimiento.jsp?calen=1">Calendario</a></li>
                    <li class="boton"><a href="DashboardMantenimiento.jsp?reun=1">Reservar Sala</a></li>

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
            String user = (String) session.getAttribute("Usuario");
            String pass = (String) session.getAttribute("Contraseña");
            basico.Conectar(user, pass);
            ResultSet empleado = null;
            empleado = basico.crearResultSet("select n_emp from ateam_emp where upper(nombre) =upper('" + (String) session.getAttribute("Usuario") + "')");
            empleado.next();
            int userNum = Integer.parseInt(empleado.getString(1));

            ResultSet hayfecha = basico.crearResultSet("select FECHA from ateam_entrasale where FECHA = TO_CHAR(SYSDATE,'dd/mm/yyyy') AND N_EMP = " + userNum);
            if (hayfecha.isBeforeFirst()) {
                hayfecha.next();
                if (request.getParameter("status") != null) {
                    String estado = request.getParameter("status");
                    if ((estado).equals("Comida")) {
                        int Resultado = basico.insertarComida(userNum, user, pass);
                        if (Resultado > 0) {
        %>
        <div class="PopUpIn" >
            <div class="InBox">
                <a><strong>X</strong></a>
                <h4 style="position:relative; left: 5%; color: grey; text-align: center">Modificado</h4>
                <h5 style="color: grey; text-align: center">control de comida ingresado</h5>
            </div> 
        </div>
        <%
        } else {
        %>
        <div class="PopUpIn" >
            <div class="InBox">
                <a><strong>X</strong></a>
                <h4 style="position:relative; left: 5%; color: grey; text-align: center">ERROR</h4>
                <h5 style="color: grey; text-align: center">no pudo ser ingresado</h5>
            </div> 
        </div>
        <%
                }
            }
            if ((estado).equals("Salida")) {
                int Resultado = basico.insertarSalida(userNum, user, pass);
                if (Resultado > 0) {
        %>
        <jsp:forward page="index.jsp"/>
        <%
        } else {
        %>
        <div class="PopUpIn" >
            <div class="InBox">
                <a><strong>X</strong></a>
                <h4 style="position:relative; left: 5%; color: grey; text-align: center">ERROR</h4>
                <h5 style="color: grey; text-align: center">no pudo ser ingresado</h5>
            </div> 
        </div>
        <%
                    }

                }
            }
        } else {

        %>   

        <div class="PopUpIn" >
            <div class="InBox">
                <a><strong>X</strong></a>
                <h4 style="position:relative; left: 5%; color: grey; text-align: center">Haz clic aquí</h4>
                <h5 style="color: grey; text-align: center">para iniciar tu jornada laboral</h5>
                <form action="">
                    <input id= "entrada" class="btn btn-primary"  type="submit" name="status" value="Entrada"/>
                </form>
            </div> 
        </div>
        <%            if (request.getParameter("status") != null) {
                String estado = request.getParameter("status");
                if ((estado).equals("Entrada")) {
                    int Resultado = basico.insertarEntrada(userNum, user, pass);
                    if (Resultado > 0) {
        %>
        <div class="PopUpIn" >
            <div class="InBox">
                <a><strong>X</strong></a>
                <h4 style="position:relative; left: 5%; color: grey; text-align: center">Modificado</h4>
                <h5 style="color: grey; text-align: center">control de entrada ingresado</h5>
            </div> 
        </div>
        <%
        } else {
        %>
        <div class="PopUpIn" >
            <div class="InBox">
                <a><strong>X</strong></a>
                <h4 style="position:relative; left: 5%; color: grey; text-align: center">ERROR</h4>
                <h5 style="color: grey; text-align: center">no pudo ser ingresado</h5>
            </div> 
        </div>
        <% }
                    }
                }
            }; %>
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
        } else if (request.getParameter("calen") != null) {
        %>
        <jsp:include page="FormularioDeSolicitud.jsp"/> 
        <%
        } else {

            empleado = null;
            basico.Conectar((String) session.getAttribute("Usuario"), (String) session.getAttribute("Contraseña"));
            basico.crearStatement();
            empleado = basico.crearResultSet("select n_emp from ateam_emp where upper(nombre) =upper('" + (String) session.getAttribute("Usuario") + "')");
            empleado.next();
            String numero = "BarsInOut_2.jsp?n_emp=" + empleado.getString(1);
        %>
        <section id="section">
            <h1>Mantenimiento</h1>

            <p>Bienvenido <%=(String) session.getAttribute("Usuario")%></p>
        </section>
        <div>
            <jsp:include page="<%=numero%>" />
        </div>
        <%
            }
        %>
        
        <script src="src/js/jquery-1.12.3.min.js" type="text/javascript"></script>
        <script src="src/js/Dashboards.js" type="text/javascript"></script>
    </body>
</html>
