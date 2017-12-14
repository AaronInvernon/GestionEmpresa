
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/ATIclass.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>

        <title>FORMULARIO DE SOLICITUD</title>
    </head>
    <body>
        <div class="container" style="width: 400px">
            <form action="" class="">
                <h3>Solicitud</h3>

                <p>¿Qué deseas solicitar?</p>
                <input class="btn btn-primary" type="button" id="Vacaciones" value="Vacaciones"/>
                <input class="btn btn-primary" type="button" id="DiasLibres" value="Dias Libres"/>
                <input class="btn btn-primary" type="button" id="HorasLibres" value="Horas Libres"/>

                <div id="capa1" class="form-inline">
                    <br/>
                    <p>Tienes <strong style="color: #46b8da">(x)</strong> días de vacaciones </p>
                    <p>¿Cuantos días deseas tomar?</p>
                    <div class="input-group">
                            <span class="input-group-addon">Días</span>
                            <input class="form-control" type="text" style="width: 50px" placeholder="00" name="DiasLibres">
                        </div>
                    <br/><br/>

                    Fecha de inicio: <input class="form-control" type="date" name="Fecha" placeholder="dd/mm/yyyy">

                </div>
                <div id="capa2" class="form-inline">
                    <br/>
                    <p>Tienes <strong style="color: #46b8da">(x)</strong> días libres acumulados </p>
                    <p>¿Cuantos días deseas tomar?</p>
                    <div class="form group">
                        <div class="input-group">
                            <span class="input-group-addon">Días</span>
                            <input class="form-control" type="text" style="width: 50px" placeholder="00" name="DiasLibres">
                        </div>
                    </div>
                    <br/><br/>

                    Fecha de inicio: <input class="form-control" type="date" name="Fecha" placeholder="dd/mm/yyyy">

                </div>
                <div id="capa3" class="form-inline">
                    <br/>
                    <p>Tienes <strong style="color: #46b8da">(x)</strong> horas acumuladas </p>
                    <p>¿Cuantas horas deseas tomar?</p>
                    <div class="input-group">
                            <span class="input-group-addon">Horas</span>
                            <input class="form-control" type="text" style="width: 50px" placeholder="00" name="DiasLibres">
                        </div>
                    <br/><br/>
                    <div class="form-group">
                    Fecha: <input class="form-control" type="date" name="Fecha"/><br/><br/>
                    Hora: <input class="form-control" type="text" style="width: 50px" placeholder="00" name="Horas"> - <input class="form-control" type="text" style="width: 50px" placeholder="00" name="Minutos">
                    </div>
                </div>
                <hr/>
                <div style="padding-left: 20px">
                <div class="checkbox">
                    <input type="checkbox" name="chkLopd" id="chkLopd"/> Soy
                    <em style="color: #46b8da">[Nombre de Empleado]</em>, empleado n°
                    <em style="color: #46b8da">[Número de Empleado]</em> de la empresa A_Team_Inc y deseo enviar esta solicitud.
                </div>
                </div>
                <br/>
                <div class="input-group">
                    <span class="input-group-addon">Contraseña:</span>
                    <input class="form-control" style="width: 200px" type="password" name="pass"/>
                </div>
                <br/>
                <input class="btn btn-primary" type="submit" value="Enviar Solicitud"/>


            </form>
        </div>


        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/jquery-1.12.3.min.js" type="text/javascript"></script>
        <script>
            $(document).ready(function () {
                $("#capa1").hide();
                $("#capa2").hide();
                $("#capa3").hide();


                $("#Vacaciones").click(function () {
                    $("#capa1").show("slow");
                    $("#capa2").hide("slow");
                    $("#capa3").hide("slow");
                });

                $("#DiasLibres").click(function () {
                    $("#capa1").hide("slow");
                    $("#capa2").show("slow");
                    $("#capa3").hide("slow");
                });

                $("#HorasLibres").click(function () {
                    $("#capa1").hide("slow");
                    $("#capa2").hide("slow");
                    $("#capa3").show("slow");
                });


            });
        </script>
    </body>
</html>
