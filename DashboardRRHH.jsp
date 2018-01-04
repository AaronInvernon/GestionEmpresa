<%-- 
    Document   : newjsp
    Created on : 16-dic-2017, 15:55:06
    Author     : Kevin
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="basico" scope="session" class="nuestrosBeans.baseDeDatos"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <link href="src/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>       
        <link href="src/css/DashboardClass.css" rel="stylesheet" type="text/css"/>
        <link href="src/css/ATIclass_Dashboard.css" rel="stylesheet" type="text/css"/>
        <link href="src/css/cuadroBienvenido.css" rel="stylesheet" type="text/css"/>
        <script src="src/js/jquery-1.12.3.min.js" type="text/javascript"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Tablero</title>
    </head>
    <body>
        <header>
            <a href="DashboardRRHH.jsp" class="navbar-brand">[A_Team_Inc]</a>
            <input type="checkbox" class="mybtn" id="btn-menu">
            <label for="btn-menu"><span class="fa fa-bars" id="icono"></span></label>

            <nav class="menu">

                <ul>
                    <%
                        String emp = null;
                    %>
                    <li class="boton"><a href="DashboardRRHH.jsp?emp=jerarquia">Empleados</a></li>
                    <li class="submenu"><a href="#">Candidaturas</a>

                        <%
                            String user = "ceo";
                            String pass = "1234";
                            ResultSet vacantes = null;

                            basico.Conectar(user, pass);
                            basico.crearStatement();

                            vacantes = basico.crearResultSet("select * from ateam_vacant");
                        %>
                        <ul>

                            <%
                                while (vacantes.next()) {
                                    String puesto = vacantes.getString(1);
                                    String departa = vacantes.getString(2);
                                    int plazas = vacantes.getInt(3);
                            %>
                            <li class="submenu2">
                                <div class="sidebar-puesto">

                                    <div class="sidebar-puesto-content"><a>
                                            <%=puesto%> <div class="plazaPill">Nº plazas: <%=plazas%></div>
                                            <p class="opacoDept"><%=departa%></p></a>

                                    </div>
                                </div>
                                <ul>   
                                    <%
                                        ResultSet candidatos = null;
                                        basico.crearStatement();
                                        candidatos = basico.crearResultSet("select dni, initcap(cnombre), hora from ateam_candi where puesto_sol='" + puesto + "'");
                                        while (candidatos.next()) {
                                            String dni = candidatos.getString(1);
                                    %>
                                    <li>
                                        <div class="sidebar-item"><a href="DashboardRRHH.jsp?dni=<%=dni%>">
                                                <div class="sidebar-item-pic"></div>
                                                <div class="sidebar-item-content">

                                                    <strong><%=candidatos.getString(2)%></strong><p class="myhour"><%=candidatos.getString(3)%></p>
                                                    <div class="mypill">Nuevo Candidato</div>
                                                </div> </a>  
                                        </div>
                                    </li>
                                    <%
                                        }
                                    %> 
                                </ul>
                            </li>
                            <%
                                }
                                basico.finConectar();
                                String reun = null;
                            %>
                        </ul>
                    </li>
                    <li class="boton"><a href="#">Calendario</a></li>
                    <li class="boton"><a href="DashboardRRHH.jsp?reun=1">Reservar Sala</a></li>

                    <li class="submenu"><a href="#">Notificaciones</a>
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

        <div class="content container">
            <%
                if (session.getAttribute("CandiEstado") != null) {
                    if ((boolean) session.getAttribute("CandiEstado") == true) {
            %>
            <h4 align="center"> El candidato ha sido aceptado. </h4>     
            <%
                session.setAttribute("CandiEstado", null);
            } else if ((boolean) session.getAttribute("CandiEstado") == false) {
            %>
            <h4 align="center"> El candidato ha sido rechazado. </h4>
            <%
                    session.setAttribute("CandiEstado", null);
                }
            } else if (request.getParameter("reun") != null) {
            %>
            <h4 align="center"> Debe comprobar la disponibilidad de la sala antes de poder reservarla </h4>
            <jsp:include page="FormularioReservaSR.jsp"/>
            <%
            } else if (request.getParameter("dni") != null) {
            %>
            <jsp:include page="NuevaCandidatura_RRHH.jsp"/>
            <%
            } else if (request.getParameter("emp") != null) {
            %>
            <jsp:include page="jerarquia_1.jsp"/> 
            <%
            } else if (request.getParameter("n_emp") != null) {
            %>
            <jsp:include page="BarsInOut_2.jsp"/> 
            <%
            } else {
                ResultSet empleado = null;
                basico.Conectar(user, pass);
                basico.crearStatement();
                empleado = basico.crearResultSet("select n_emp from ateam_emp where upper(nombre) =upper('" + (String) session.getAttribute("Usuario") + "')");
                empleado.next();
                String numero = "BarsInOut_2.jsp?n_emp="+empleado.getString(1);
            %>
            <section id="section">
                <h1>Recursos Humanos</h1>

                <p>Bienvenido <%=(String) session.getAttribute("Usuario")%></p>
            </section>
            <div>
                <jsp:include page="<%=numero%>" />
            </div>

            <%

                }
            %>
        </div>

        <script>

            $(document).ready(function () {
                $("#btn-menu").attr('checked', false);
            });

            $(".submenu").click(function () {
                $(this).children("ul").slideToggle("slow").show();
                $(this).children("ul").toggleClass('active');
            });

            $(".submenu2").click(function () {
                $(this).children("ul").toggleClass('active');
            });

            $(".boton").click(function () {
                $("#btn-menu").attr('checked', false);
            });

            $(".submenu").children("ul").click(function () {
                $("#btn-menu").attr('checked', false);
            });

        </script>
    </body>
</html>
