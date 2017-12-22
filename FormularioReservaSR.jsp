
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="basico" scope="session" class="nuestrosBeans.baseDeDatos"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reserva Sala Reunión</title>
        <link href="src/css/ATIclass.css" rel="stylesheet" type="text/css"/>
        <link href="src/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="src/css/style.css" rel="stylesheet" type="text/css"/>
        <link href="src/css/formulario.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <form id="formReserva" method="post">
            <%
                String user = "ceo"; // HAY QUE CAMBIAR EL USUARIO POR EL DE SESSION (CREAR UN USUARIO EN LA BASE DE DATOS)
                String pass = "1234";
                String codigoSala = "";
                basico.Conectar(user, pass);

                basico.crearStatement();
                ResultSet resultadoSala = basico.crearResultSet("select cod_sala from ateam_salasreu");

                
            %>
            <div class="form-group">

                <label>Nombre Reunión: </label>
                <input type="text" class="form-control" name="txtNombre" id="txtNombre"/>
                <span id="errorNombre">Introduce un nombre correcto</span>    

            </div>

            <div class="form-group "> 

                <label>Sala: </label>
                <select class="form-control" name="slctSala" id="slctSala">
                    <%              
                        while (resultadoSala.next()) {
                             codigoSala = resultadoSala.getString(1);
                    %>
                    <option value="<%=codigoSala%>"><%=codigoSala%></option>
                    <%       
                        }
                    %>
                </select>

            </div>

            <div class="form-group ">    

                <label>Fecha: </label>
                <input type="date" class="form-control" name="txtFechaRes" id="txtFechaRes"/>

            </div>

            <div class="form-group "> 

                <label>Hora de inicio: </label>
                <select class="form-control" name="slctHoraInicio" id="slctHoraInicio">
                    <option value="9">9:00</option>
                    <option value="10">10:00</option>
                    <option value="11">11:00</option>
                    <option value="12">12:00</option>
                    <option value="13">13:00</option>
                    <option value="14">14:00</option>
                    <option value="15">15:00</option>
                    <option value="16">16:00</option>
                    <option value="17">17:00</option>
                    <option value="18">18:00</option>
                    <option value="19">19:00</option>
                    <option value="20">20:00</option>
                    <option value="21">21:00</option>
                </select>

            </div>

            <div class="form-group "> 

                <label>Número de horas: </label>
                <select class="form-control" name="slctHoras" id="slctHoras">
                    <option value="1">1 Hora</option>
                    <option value="2">2 Horas</option>
                </select>

            </div>

            <div class="form-group ">

                <input type="button"  class=" btn btn-warning" value="Comprobar Disponibilidad" id="Comprobar"/>
                <input type="submit"  class=" btn btn-primary" value="Enviar" id="Enviar"/>
                <input type="reset" class=" btn btn-danger" value="Limpiar"/>
            </div>
        </form>
        <%
            if (request.getParameter("txtNombre") != null) {

                String nomReunion = request.getParameter("txtNombre");
                String sala = request.getParameter("slctSala");
                String dato = request.getParameter("txtFechaRes");
                int horaInicio = Integer.parseInt(request.getParameter("slctHoraInicio"));
                int nHoras = Integer.parseInt(request.getParameter("slctHoras"));

                String[] datoArray = dato.split("-");
                String resultado = "";
                for (int j = 2; j >= 0; j--) {
                    resultado = resultado + "/" + datoArray[j];
                }
                String fecha = resultado.substring(1, resultado.length());

                String cadena = "insert into ateam_reservasala values('" + nomReunion + "','" + sala + "',to_date('" + fecha + "','dd/mm/yyyy')," + horaInicio + "," + nHoras + ")";
                basico.crearPreparedStatement(cadena);
                basico.ejUpdatePrepStat();

            }
        %>
    </body>
</html>
