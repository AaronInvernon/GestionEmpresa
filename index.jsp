<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/ATIclass.css" rel="stylesheet" type="text/css"/>
        <title>MAINPAGE</title>

    </head>
    <body class="purplebody"><!--Purple body esta en ATIclass.css, lo invente para hacerlo morado-->

        <!--Div container-fluid abarca todo el ancho de pantalla-->
        <div id="Barriba">


            <header> <!--Cabecera del contenedor-->
                <br/><!--He colocado esto para separar un poco el menú (deberia funcionar colocar un margen)-->

                <!--Barra de Navegación-->
                <nav class="my-nav navbar navbar-default">

                    <!--Div container-fluid abarca todo el ancho de pantalla-->
                    <div >

                        <!--Navbar header contiene el logo y el boton toggle para móviles-->
                        <div class="navbar-header" >
                            <!--Este es el boton toggle-->                                       <!-- el data-target llama al contenido del menu toggle a través de un ID-->
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-1">
                                <span class="sr-only">Menú</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>

                            <!--el Navbar Brand contiene el Logo, puede ser tambien una imagen-->
                            <a href="#Barriba" class="navbar-brand" id="flecha">[A_Team_Inc]</a>
                        </div>

                        <!--Este div es el contenedor con id="navbar-1" que llama el boton toggle-->
                        <!--Todo lo que esté aquí, aparece en el menu desplegable movil-->
                        <div class="collapse navbar-collapse" id="navbar-1">


                            <ul class="nav navbar-nav navbar-right">
                                <li><a href="#espacio1" id="flecha">Sobre ATI</a></li>
                                <li ><a href="#plantilla" id="flecha">Trabaja en ATI</a></li>
                                <li class="dropdown grandbtn">
                                    <a href="#" class="dropdown-toggle grandbtn" data-toggle="dropdown">
                                        Login <span class="caret"></span>
                                    </a>
                                    <div class="dropdown-menu" style="padding:15px ; width: 200px; border-radius: 5px ">
                                        <form class="px-4 py-3">
                                            <div class="form-group">
                                                <label for="exampleDropdownFormEmail1">Email address</label>
                                                <input type="email" class="form-control" id="exampleDropdownFormEmail1" placeholder="email@example.com">
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleDropdownFormPassword1">Password</label>
                                                <input type="password" class="form-control" id="exampleDropdownFormPassword1" placeholder="Password">
                                            </div>
                                            <div class="form-check">
                                                <label class="form-check-label">
                                                    <input type="checkbox" class="form-check-input">
                                                    Remember me
                                                </label>
                                            </div>
                                            <button type="submit" class="btn btn-primary">Sign in</button>
                                        </form>
                                        <div class="divider"></div>
                                        <a class="dropdown-item" href="#">New around here? Sign up</a><br/>
                                        <a class="dropdown-item" href="#">Forgot password?</a>

                                    </div>
                                </li>
                            </ul>

                        </div>

                    </div>
                    </div>

                </nav>
            </header>
            <!--Esta es la linea horizontal blanca (que podemos eliminar si molesta)-->
            <div class="h-line"/>
        </div>

        <!--Este div contenedor abarca toda la pantalla-->    
        <div>

            <!--Este div SUPERCENTER tiene el contenido de bienvenida centrado a través de css variable (Investigado aparte)-->
            <div class="Supercenter" id="imgn">
                <h5>Bienvenido a</h5>
                <h1>[A_Team_Inc]</h1>
                <div>
                    <img src="img/001.png" alt=""/>
                    <img src="img/002.png" alt=""/>
                    <img src="img/003.png" alt=""/>

                </div>
                <br/>
                <div>
                    <a href="#espacio1" id="flecha">
                        <img style="width: 35px; height: 35px;" src="img/arrow.png" alt=""/>
                    </a>
                </div>  
            </div>
        </div>

        <!-- Primera caja con SOBRE NOSOTROS -->
        <div id="menu2">
            <div id="espacio1"  >
                <div class="caption">
                    <span  id="colores" style="font-size:25px;">SOBRE NOSOTROS</span>
                </div>
            </div>
            <div class="punto" id="Primero" >
                <p>El proyecto consiste en la elaboración de una  aplicación web para el control de una empresa ficticia.

                    La web estará dividida en: una sección con información sobre la empresa, otra sección para candidatos y una última sección para empleados.

                    La sección de información será la página de inicio de la aplicación.

                    Tanto la sección de candidatos como la sección de empleados contarán con un sistema de LogIn-LogOut.

                    La empresa estará dividida en departamentos. El usuario accede a un tablero de control personalizado en función al departamento en el que se encuentra. Para hacer pruebas con la aplicación web podemos tomar en cuenta el tablero de control de un usuario empleado, un usuario del departamento de recursos humanos o un usuario de administración.

                    Para acceder por primera vez a la web será necesario registrarse y serán los empleados del departamento de recursos humanos los encargados de admitir y tramitar las solicitudes que lleguen. (Para ello tendrá unas notificaciones que avisarán de las nuevas solicitudes.) Un sistema de notificaciones informará sobre nuevas solicitudes, tanto para candidatos como para empleados. 

                    Los empleados podrán solicitar fechas de inicio y fin de sus vacaciones, de este modo, se notificará al departamento de Administración y estos, a su vez, podrán validar (o no) dicho periodo en función del estado del calendario.

                    Una vez logueado, el usuario podrá consultar la jerarquía dentro de la empresa siempre y cuando tenga permisos para ello, así como información específica de los empleados seleccionados como las horas trabajadas y los cursos realizados. 

                    Los candidatos registrados en la web, podrán cumplimentar un formulario con sus datos personales, experiencia laboral, estudios, disponibilidad… y la posibilidad de subir un documento .pdf con su CV y una foto cuando quieran optar a un puesto disponible.





                    El departamento de RRHH podrá gestionar las nuevas candidaturas y archivarlas para realizar entrevista con los candidatos o descartarlos del proceso de selección en cuestión.



                    Todos los empleados podrán mandar avisos cuando algo se haya estropeado al departamento de mantenimiento o cuando falte algún tipo de material, para que así le llegue una notificación a los empleados de mantenimiento.

                    Si se encuentra algún bug en la web se enviará un informe de error al departamento de desarrollo para que lo solucionen.
                </p>
            </div>
            <div id="espacio2">
                <div class="caption">
                    <span  id="colores" style="font-size:25px;">TRABAJA PARA NOSOTROS</span>
                </div>
            </div>
            <div class="plantilla" id="plantilla">
              
                <p>

                    Esto es una prueba para que trabajes con Nosotros
                </p>
                <a class="boton_personalizado" href=""><input type="submit" value="ACCEDE"/></a>
            </div>
        </div> 
        <script src="js/jquery-1.12.3.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script> 
        <script>
            $(function () {

                $('a[id=flecha]').click(function () {

                    if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '')
                            && location.hostname == this.hostname) {

                        var $target = $(this.hash);

                        $target = $target.length && $target || $('[name=' + this.hash.slice(1) + ']');

                        if ($target.length) {

                            var targetOffset = $target.offset().top;

                            $('html,body').animate({scrollTop: targetOffset}, 1000);

                            return false;

                        }

                    }

                });

            });
        </script>
    </body>
</html>
