<%-- 
    Document   : newjsp
    Created on : 16-dic-2017, 15:55:06
    Author     : Kevin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="src/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="src/css/DashboardClass.css" rel="stylesheet" type="text/css"/>
        <link href="src/css/ATIclass.css" rel="stylesheet" type="text/css"/>
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
                    <li><a href="#">Empleados</a></li>
                    <li><a href="#">Candidaturas</a></li>
                    <li><a href="#">Calendario</a></li>
                    <li><a href="#">Estadísticas</a></li>
                    <li><a href="#">Agenda</a></li>
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
                                            <div class="mypill">Nueva Solicitud</div>



                                        </div> </a>  
                                </div>
                            </li>
                        </ul>
                    <li>
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
        </div>

        <script>
            
            $(".submenu").click(function () {
                //if($(this).children("ul").is(':hidden')){
                $(this).children("ul").slideToggle();
                $(this).children("ul").toggleClass('active');
                //}else{
                  //$(this).children("ul").slideToggle();  
                });
                
              // INTENTO  
            // $('#btn-menu').click(function () {
               // if($('#btn-menu').Attr(':checked')){
                    
              //      $(".submenu").children("ul").toggleClass('default');
               // }
            
           // });
           // 
           // INTENTO
            //$( '.mybtn' ).click(function() {
            //if( $(this).is(':checked') ){
        // Hacer algo si el checkbox ha sido seleccionado
        //alert("El checkbox con valor " + $(this).val() + " ha sido seleccionado");
    //} else {
        // Hacer algo si el checkbox ha sido deseleccionado
      //  alert("El checkbox con valor " + $(this).val() + " ha sido deseleccionado");
    //}
//});
        </script>
    </body>
</html>
