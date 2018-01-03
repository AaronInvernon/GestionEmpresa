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
        <title>Administracion</title>
       
    </head>
    <body>
        <header>
            <a href="#" class="navbar-brand">[A_Team_Inc]</a>
            <input type="checkbox" class="mybtn" id="btn-menu">
            <label for="btn-menu"><span class="fa fa-bars" id="icono"></span></label>

            <nav class="menu">

                <ul>
                    <li class="boton"><a href="#">Empleados</a></li>
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

         <section id="section">
            <h1>Administración</h1>

            <p>Bienvenido <%=(String)session.getAttribute("Usuario")%></p>
        </section>

        <script>

            $(document).ready(function () {
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
