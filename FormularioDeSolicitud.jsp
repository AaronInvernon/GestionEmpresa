<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="basico" scope="session" class="nuestrosBeans.baseDeDatos"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="src/css/ATIclass_Dashboard.css" rel="stylesheet" type="text/css"/>
        <link href="src/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="src/css/style.css" rel="stylesheet" type="text/css"/>

        <title>FORMULARIO DE SOLICITUD</title>
    </head>
    <body>
        <div class="container" style="width: 400px">
            <form action="" class="" method="post">
                <h3>Solicitud</h3>

                <p>¿Qué deseas solicitar?</p>
                <input class="btn btn-primary" type="radio" id="Vacaciones"  name="rdbLibre" value="Vacaciones" /> <strong>Vacaciones</strong> 
                <input class="btn btn-primary" type="radio" id="DiasLibres"  name="rdbLibre" value="Dias Libres" /> <strong>Dias Libres</strong>
                <input class="btn btn-primary" type="radio" id="HorasLibres"  name="rdbLibre" value="Horas Libres" /> <strong>Horas Libres</strong>

                <div id="capa1" class="form-inline">
                    <br/>
                    <p>Tienes <strong style="color: #46b8da">(x)</strong> días de vacaciones </p>
                    <p>¿Cuantos días deseas tomar?</p>

                    Fecha de inicio: <input class="form-control" type="date" name="FechaInicioVacaciones" placeholder="dd/mm/yyyy">
                    <br/><br/>
                    Fecha fin: <input class="form-control" type="date" name="FechaFinVacaciones" placeholder="dd/mm/yyyy">

                </div>
                <div id="capa2" class="form-inline">
                    <br/>
                    <p>Tienes <strong style="color: #46b8da">(x)</strong> días libres acumulados </p>
                    <p>¿Cuantos días deseas tomar?</p>
                    <!-- <div class="form group">
                         <div class="input-group">
                             <span class="input-group-addon">Días</span>
                             <input class="form-control" type="text" style="width: 50px" placeholder="00" name="DiasLibres">
                         </div>
                     </div>-->
                    Fecha de inicio: <input class="form-control" type="date" name="FechaInicioDias" placeholder="dd/mm/yyyy">
                    <br/><br/>
                    Fecha fin: <input class="form-control" type="date" name="FechaFinDias" placeholder="dd/mm/yyyy">
                </div>
                <div id="capa3" class="form-inline">
                    <br/>
                    <p>Tienes <strong style="color: #46b8da">(x)</strong> horas acumuladas </p>
                    <p>¿Cuantas horas deseas tomar?</p>
                    <div class="input-group">
                        <span class="input-group-addon">Horas</span>
                        <input class="form-control" type="text" style="width: 50px" placeholder="00" name="HorasLibres">
                    </div>
                    <br/><br/>
                    <div class="form-group">
                        Fecha: <input class="form-control" type="date" name="FechaHoras"/><br/><br/>
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
                    <input class="form-control" style="width: 200px" type="password" name="password"/>
                </div>
                <br/>
                <input class="btn btn-primary" type="submit" value="Enviar Solicitud"/>


            </form>
        </div>
        <%
            if (request.getParameter("password") != null) {
                
                if (request.getParameter("rdbLibre").equals("Vacaciones")){

                    String tipo = request.getParameter("rdbLibre");
                    String dato = request.getParameter("FechaInicioVacaciones");
                    String[] datoArray = dato.split("-");
                    String resultado = "";
                    for (int j = 2; j >= 0; j--) {
                        resultado = resultado + "/" + datoArray[j];
                    }
                    String fechaInicio = resultado.substring(1, resultado.length());
                    
                    String dato2 = request.getParameter("FechaFinVacaciones");
                    String[] datoArray2 = dato2.split("-");
                    String resultado2 = "";
                    for (int j = 2; j >= 0; j--) {
                        resultado2 = resultado2 + "/" + datoArray2[j];
                    }
                    String fechaFin = resultado2.substring(1, resultado2.length());
                    
                    basico.Conectar((String) session.getAttribute("Usuario"), (String) session.getAttribute("Contraseña"));
                    String cadena = "insert into ateam_libre values('" + (String) session.getAttribute("Usuario") + "',to_date('" + fechaInicio + "','dd/mm/yyyy'),to_date('" + fechaFin + "','dd/mm/yyyy'), '"  + tipo + "')";
                    System.out.println(cadena);
                    basico.crearPreparedStatement(cadena);
                    basico.ejUpdatePrepStat();
                    basico.finConectar();
                    

                } else if (request.getParameter("rdbLibre").equals("Dias Libres")) {
                    
                    String tipo = request.getParameter("rdbLibre");
                    String dato = request.getParameter("FechaInicioDias");
                    String[] datoArray = dato.split("-");
                    String resultado = "";
                    for (int j = 2; j >= 0; j--) {
                        resultado = resultado + "/" + datoArray[j];
                    }
                    String fechaInicio = resultado.substring(1, resultado.length());
                    
                    String dato2 = request.getParameter("FechaFinDias");
                    String[] datoArray2 = dato2.split("-");
                    String resultado2 = "";
                    for (int j = 2; j >= 0; j--) {
                        resultado2 = resultado2 + "/" + datoArray2[j];
                    }
                    String fechaFin = resultado2.substring(1, resultado2.length());
                    
                    basico.Conectar((String) session.getAttribute("Usuario"), (String) session.getAttribute("Contraseña"));
                    String cadena = "insert into ateam_libre values('" + (String) session.getAttribute("Usuario") + "',to_date('" + fechaInicio + "','dd/mm/yyyy'),to_date('" + fechaFin + "','dd/mm/yyyy'), '"  + tipo + "')";
                    System.out.println(cadena);
                    basico.crearPreparedStatement(cadena);
                    basico.ejUpdatePrepStat();
                    basico.finConectar();
                    
                } else if (request.getParameter("rdbLibre").equals("Horas Libres")) {

                    String tipo = request.getParameter("rdbLibre");
                    int horasLibres = Integer.parseInt(request.getParameter("HorasLibres"));
                    
                    String dato = request.getParameter("FechaHoras");
                    String[] datoArray = dato.split("-");
                    String resultado = "";
                    for (int j = 2; j >= 0; j--) {
                        resultado = resultado + "/" + datoArray[j];
                    }
                    String fechaInicio = resultado.substring(1, resultado.length());
                    
                    String horas = request.getParameter("Horas");
                    String minutos = request.getParameter("Minutos");
                    
                    String HoraInicio = horas +":"+ minutos;
                    int horas2 = Integer.parseInt(horas);
                    int horaFinal = horas2+horasLibres;
                    String horaFin = horaFinal + ":" + minutos;
                    
                    
                    basico.Conectar((String) session.getAttribute("Usuario"), (String) session.getAttribute("Contraseña"));
                    String cadena = "insert into ateam_libre values('" + (String) session.getAttribute("Usuario") + "',to_date('" + fechaInicio + HoraInicio + "','dd/mm/yyyy hh24:mi'),to_date('" + fechaInicio + horaFin + "','dd/mm/yyyy hh24:mi'), '"  + tipo + "')";
                    System.out.println(cadena);
                    basico.crearPreparedStatement(cadena);
                    basico.ejUpdatePrepStat();
                    basico.finConectar();
                }

            }
        %>

        <script src="src/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="src/js/jquery-1.12.3.min.js" type="text/javascript"></script>
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
