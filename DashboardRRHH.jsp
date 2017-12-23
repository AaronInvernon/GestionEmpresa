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
        <script src="src/js/jquery-1.12.3.min.js" type="text/javascript"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Tablero</title>
    </head>
    <body>
        <header>
            <a href="#" class="navbar-brand">[A_Team_Inc]</a>
            <input type="checkbox" class="mybtn" id="btn-menu">
            <label for="btn-menu"><span class="fa fa-bars" id="icono"></span></label>
            
            <nav class="menu">

                <ul>
                    <li class="boton"><a href="#">Empleados</a></li>
                    <li class="submenu"><a href="#">Candidaturas</a>
                        <ul>
                        <%
                            String user= "ceo";
                            String pass= "1234";
                            ResultSet resultado=null;
                            basico.Conectar(user, pass);
                            basico.crearStatement();
                            resultado = basico.crearResultSet("select dni, initcap(cnombre), hora from ateam_candi");
                            while(resultado.next()){
                                String dni= resultado.getString(1);
                            %>
                            
                            <li>
                                <div class="sidebar-item"><a href="DashboardRRHH.jsp?dni=<%=dni%>">
                                        <div class="sidebar-item-pic"></div>
                                        <div class="sidebar-item-content">

                                            <strong><%=resultado.getString(2)%></strong><p class="myhour"><%=resultado.getString(3)%></p>
                                            <div class="mypill">Nueva Candidato</div>
                                        </div> </a>  
                                </div>
                            </li>
                            <%
                            }
                            basico.finConectar();
                            %>
                        </ul>
                    </li>
                    <li class="boton"><a href="#">Calendario</a></li>
                    <li class="boton"><a href="#">Estadísticas</a></li>
                    <li class="boton"><a href="#">Agenda</a></li>
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
                    <li class="boton">
                        <a id="userbox" href="#" class="dropdown-toggle grandbtn" data-toggle="dropdown">
                            Usuario
                        </a>
                        <ul class="dropdown-menu" style="padding:15px ; border-radius: 5px ">
                            <li class="dropdown" style="height: 30px"><a href="#">Perfil</a></li>
                            <li class="dropdown" style="height: 30px"><a href="#">Logout</a></li>

                        </ul>
                    </li>
                </ul>
            </nav>
        </header>
        
        <div class="content container">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolore, sit, iste, totam nobis voluptatem beatae culpa voluptas eligendi soluta aliquam atque quidem eaque possimus. Excepturi, magni nostrum aut praesentium id!</p>
            
            <% if(request.getParameter("dni")!=null){
                %>
            <jsp:include page="NuevaCandidatura_RRHH.jsp"/>
            <%
                }
            %>
        </div>

        <script>
            
            $(document).ready (function (){
                $("#btn-menu").attr('checked', false);
            });
            
            $(".submenu").click(function () {
                $(this).children("ul").slideToggle();
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
