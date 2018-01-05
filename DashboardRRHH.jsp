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
            <input type="checkbox" class="mybtn" id="btn-candidaturas">
            <input type="checkbox" class="mybtn" id="btn-notificaciones">
            <label for="btn-menu"><span class="fa fa-bars" id="icono"></span></label>

            <nav class="menu">

                <ul>
                    <%
                        String emp = null;
                    %>
                    <li class="boton"><a href="DashboardRRHH.jsp?emp=jerarquia">Empleados</a></li>
                    <li class="submenu" id="mycandis"><a href="#">Candidaturas</a>
                        <%
                    String user = (String)session.getAttribute("Usuario");
                    String pass = (String)session.getAttribute("Contraseña");
                    ResultSet vacantes = null;

                    basico.Conectar(user, pass);
                    basico.crearStatement();
                    vacantes = basico.crearResultSet("select * from ateam_vacant");
                        %>
                        <div class="space">
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
                        </div>
                    </li>
                    <li class="boton"><a href="#">Calendario</a></li>
                    <li class="boton"><a href="DashboardRRHH.jsp?reun=1">Reservar Sala</a></li>

                    <li class="submenu" id="mynotes"><a href="#">Notificaciones</a>
                                 <ul>
                            <%
                            ResultSet rset=null;
                            basico.Conectar(user, pass);
                            basico.crearStatement();
                            String cad ="select * from ateam_sms where upper(destinatario)=upper('"+(String)session.getAttribute("Usuario")+"')";
                            System.out.println(cad);
                            rset = basico.crearResultSet(cad);
                            if (rset.isBeforeFirst()){
                                while(rset.next()){                                  
                                %>
                                    <li>
                                        <div class="sidebar-item"><a href="?noti=<%=rset.getString(6)%>">
                                            <div class="sidebar-item-pic"></div>
                                            <div class="sidebar-item-content">
                                                <strong><%=rset.getString(1)%></strong><p class="myhour"><%=rset.getString(5)%></p>
                                                <div class="mypill"><%=rset.getString(3)%></div>

                                            </div> </a>  
                                        </div> 
                                    </li>   
                                <%
                                }
                            }else{
                                %>  
                                <li>
                                <div class="sidebar-item"><a href="#">
                                        <div class="sidebar-item-pic"></div>
                                        <div class="sidebar-item-content">
                                            <strong>No tiene nnotificaciones nuevas</strong>

                                        </div> </a>  
                                </div>
                                </li>
                                <%
                            }
                                %>
                        </ul>
                    <li class="boton"><a href="index.jsp">Log Out</a></li>
                </ul>
            </nav>
        </header>

        <div class="content container">
            <%
            if (request.getParameter("reun") != null) {
            %>
            <h4 align="center"> Debe comprobar la disponibilidad de la sala antes de poder reservarla </h4>
            <jsp:include page="FormularioReservaSR.jsp"/>
            <%
            } else if (request.getParameter("noti") != null) {
            %>
            <jsp:include page="verNotificaciones.jsp"/>
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
            <jsp:include page="BarsInOut.jsp"/> 
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
        <script src="src/js/Dashboards.js" type="text/javascript"></script>
    </body>
</html>
