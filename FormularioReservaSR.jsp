
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
        <script src="src/js/validacionSala.js" type="text/javascript"></script>
    </head>
    <body>
        <div class="container" style="width: 400px">
        <form id="formReserva" method="post">
            <div class="form-group">

                <label>Nombre Reunión: </label>
                <%
                    
                    if(request.getParameter("txtNombre")!=null){
                %>
                <input type="text" class="form-control" value="<%=request.getParameter("txtNombre")%>" name="txtNombre" id="txtNombre"/>
                <%
                    }else{
                %>
                <input type="text" class="form-control" name="txtNombre" id="txtNombre"/>
                <%
                    }
                %>
                <span id="errorNombre">Introduce un nombre entre 5 y 25 caracteres</span>    

            </div>

            <div class="form-group "> 

                <label>Sala: </label>
                <select class="form-control" name="slctSala" id="slctSala">
                    <%     
                        
                String user = "ceo"; // HAY QUE CAMBIAR EL USUARIO POR EL DE SESSION (CREAR UN USUARIO EN LA BASE DE DATOS)
                String pass = "1234";
                String codigoSala = "";
                
                basico.Conectar(user, pass);
                basico.crearStatement();
                ResultSet resultadoSala = basico.crearResultSet("select cod_sala from ateam_salasreu");
                        
                        while (resultadoSala.next()) {
                             codigoSala = resultadoSala.getString(1);
                             if(request.getParameter("slctSala")!=null){
                                 %>
                        <option value="<%=codigoSala%>" selected><%=codigoSala%></option>
                                 <%
                             }else{
                    %>
                        <option value="<%=codigoSala%>"><%=codigoSala%></option>
                    <% 
                            }      
                        }
                    basico.finConectar();
                    %>
                </select>

            </div>

            <div class="form-group ">    

                <label>Fecha: </label>
                <%
                if (request.getParameter("txtFechaRes")!=null){
                %>
                <input type="date" class="form-control" value="<%=request.getParameter("txtFechaRes")%>" name="txtFechaRes" id="txtFechaRes"/>
                <%
                }else{
                %>
                <input type="date" class="form-control" name="txtFechaRes" id="txtFechaRes"/>
                <%
                }
                %>

            </div>

            <div class="form-group "> 

                <label>Hora de inicio: </label>
                <select class="form-control" name="slctHoraInicio" id="slctHoraInicio">
                    <%
                    if (request.getParameter("slctHoraInicio")!=null && Integer.parseInt(request.getParameter("slctHoraInicio"))==9){
                    %>
                    <option value="9" selected>9:00</option>
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
                    <%
                    }else if(request.getParameter("slctHoraInicio")!=null && Integer.parseInt(request.getParameter("slctHoraInicio"))==10){
                    %>
                    <option value="9">9:00</option>
                    <option value="10" selected>10:00</option>
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
                    <%
                    }else if(request.getParameter("slctHoraInicio")!=null && Integer.parseInt(request.getParameter("slctHoraInicio"))==11){
                    %>
                    <option value="9">9:00</option>
                    <option value="10">10:00</option>
                    <option value="11" selected>11:00</option>
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
                    <%
                    }else if(request.getParameter("slctHoraInicio")!=null && Integer.parseInt(request.getParameter("slctHoraInicio"))==12){
                    %>
                    <option value="9">9:00</option>
                    <option value="10">10:00</option>
                    <option value="11">11:00</option>
                    <option value="12" selected>12:00</option>
                    <option value="13">13:00</option>
                    <option value="14">14:00</option>
                    <option value="15">15:00</option>
                    <option value="16">16:00</option>
                    <option value="17">17:00</option>
                    <option value="18">18:00</option>
                    <option value="19">19:00</option>
                    <option value="20">20:00</option>
                    <option value="21">21:00</option>
                    <%
                    }else if(request.getParameter("slctHoraInicio")!=null && Integer.parseInt(request.getParameter("slctHoraInicio"))==13){
                    %>
                    <option value="9">9:00</option>
                    <option value="10">10:00</option>
                    <option value="11">11:00</option>
                    <option value="12">12:00</option>
                    <option value="13" selected>13:00</option>
                    <option value="14">14:00</option>
                    <option value="15">15:00</option>
                    <option value="16">16:00</option>
                    <option value="17">17:00</option>
                    <option value="18">18:00</option>
                    <option value="19">19:00</option>
                    <option value="20">20:00</option>
                    <option value="21">21:00</option>
                    <%
                    }else if(request.getParameter("slctHoraInicio")!=null && Integer.parseInt(request.getParameter("slctHoraInicio"))==14){
                    %>
                    <option value="9">9:00</option>
                    <option value="10">10:00</option>
                    <option value="11">11:00</option>
                    <option value="12">12:00</option>
                    <option value="13">13:00</option>
                    <option value="14" selected>14:00</option>
                    <option value="15">15:00</option>
                    <option value="16">16:00</option>
                    <option value="17">17:00</option>
                    <option value="18">18:00</option>
                    <option value="19">19:00</option>
                    <option value="20">20:00</option>
                    <option value="21">21:00</option>
                    <%
                    }else if(request.getParameter("slctHoraInicio")!=null && Integer.parseInt(request.getParameter("slctHoraInicio"))==15){
                    %>
                    <option value="9">9:00</option>
                    <option value="10">10:00</option>
                    <option value="11">11:00</option>
                    <option value="12">12:00</option>
                    <option value="13">13:00</option>
                    <option value="14">14:00</option>
                    <option value="15" selected>15:00</option>
                    <option value="16">16:00</option>
                    <option value="17">17:00</option>
                    <option value="18">18:00</option>
                    <option value="19">19:00</option>
                    <option value="20">20:00</option>
                    <option value="21">21:00</option>
                    <%
                    }else if(request.getParameter("slctHoraInicio")!=null && Integer.parseInt(request.getParameter("slctHoraInicio"))==16){
                    %>
                    <option value="9">9:00</option>
                    <option value="10">10:00</option>
                    <option value="11">11:00</option>
                    <option value="12">12:00</option>
                    <option value="13">13:00</option>
                    <option value="14">14:00</option>
                    <option value="15">15:00</option>
                    <option value="16" selected>16:00</option>
                    <option value="17">17:00</option>
                    <option value="18">18:00</option>
                    <option value="19">19:00</option>
                    <option value="20">20:00</option>
                    <option value="21">21:00</option>
                    <%
                    }else if(request.getParameter("slctHoraInicio")!=null && Integer.parseInt(request.getParameter("slctHoraInicio"))==17){
                    %>
                    <option value="9">9:00</option>
                    <option value="10">10:00</option>
                    <option value="11">11:00</option>
                    <option value="12">12:00</option>
                    <option value="13">13:00</option>
                    <option value="14">14:00</option>
                    <option value="15">15:00</option>
                    <option value="16">16:00</option>
                    <option value="17"  selected>17:00</option>
                    <option value="18">18:00</option>
                    <option value="19">19:00</option>
                    <option value="20">20:00</option>
                    <option value="21">21:00</option>
                    <%
                    }else if(request.getParameter("slctHoraInicio")!=null && Integer.parseInt(request.getParameter("slctHoraInicio"))==18){
                    %>
                    <option value="9">9:00</option>
                    <option value="10">10:00</option>
                    <option value="11">11:00</option>
                    <option value="12">12:00</option>
                    <option value="13">13:00</option>
                    <option value="14">14:00</option>
                    <option value="15">15:00</option>
                    <option value="16">16:00</option>
                    <option value="17">17:00</option>
                    <option value="18" selected>18:00</option>
                    <option value="19">19:00</option>
                    <option value="20">20:00</option>
                    <option value="21">21:00</option>
                    <%
                    }else if(request.getParameter("slctHoraInicio")!=null && Integer.parseInt(request.getParameter("slctHoraInicio"))==19){
                    %>
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
                    <option value="19" selected>19:00</option>
                    <option value="20">20:00</option>
                    <option value="21">21:00</option>
                    <%
                    }else if(request.getParameter("slctHoraInicio")!=null && Integer.parseInt(request.getParameter("slctHoraInicio"))==20){
                    %>
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
                    <option value="20" selected>20:00</option>
                    <option value="21">21:00</option>
                    <%
                    }else if(request.getParameter("slctHoraInicio")!=null && Integer.parseInt(request.getParameter("slctHoraInicio"))==21){
                    %>
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
                    <option value="21" selected>21:00</option>
                    <%
                    }else{
                    %>
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
                    <%
                    }
                    %>
                </select>

            </div>

            <div class="form-group "> 

                <label>Número de horas: </label>
                <select class="form-control" name="slctHoras" id="slctHoras">
                    <%
                    if (request.getParameter("slctHoras")!=null && Integer.parseInt(request.getParameter("slctHoras"))==1){
                    %>
                    <option value="1" selected>1 Hora</option>
                    <option value="2">2 Horas</option>
                    <%
                    }else if(request.getParameter("slctHoras")!=null && Integer.parseInt(request.getParameter("slctHoras"))==2){
                    %>
                    <option value="1">1 Hora</option>
                    <option value="2" selected>2 Horas</option>
                    <%  
                    }else{
                    %>
                    <option value="1">1 Hora</option>
                    <option value="2">2 Horas</option>
                    <%   
                    }
                    %>
                </select>

            </div>

            <div class="form-group ">

                <input type="submit"  class=" btn btn-warning" value="Comprobar Disponibilidad" id="Comprobar" name="submit"/>

                <input type="submit"  class=" btn btn-primary" value="Enviar" id="Enviar" name="submit" disabled/>
   
                <input type="reset" class=" btn btn-danger" value="Limpiar" id="reset"/>
            </div>
            <br/>
        <%
            if (request.getParameter("txtNombre") != null && request.getParameter("txtNombre")!=""){
                
                String nomReunion = request.getParameter("txtNombre");
                String sala = request.getParameter("slctSala");
                int horaInicio = Integer.parseInt(request.getParameter("slctHoraInicio"));
                int nHoras = Integer.parseInt(request.getParameter("slctHoras"));
                
                String dato = request.getParameter("txtFechaRes");
                String[] datoArray = dato.split("-");
                String resultado = "";
                for (int j = 2; j >= 0; j--) {
                    resultado = resultado + "/" + datoArray[j];
                }
                String fecha = resultado.substring(1, resultado.length());
                int lastTest = 1;
                if(request.getParameter("submit").equals("Enviar")){

                    basico.Conectar(user, pass);
                    String cadena = "insert into ateam_reservasala values('" + nomReunion + "','" + sala + "',to_date('" + fecha + "','dd/mm/yyyy')," + horaInicio + "," + nHoras + ")";
                    basico.crearPreparedStatement(cadena);
                    basico.ejUpdatePrepStat();
                    basico.finConectar();
                    String mensaje = "La reunion '"+nomReunion+"', en la sala "+sala+"; Ha sido convocada desde las "+horaInicio+":00 hasta las "+(horaInicio+nHoras)+":00 el día: "+fecha+".";
                    boolean hayReunion = true;
                    session.setAttribute("estadoReunion", hayReunion);
                    response.sendRedirect("DashboardRRHH.jsp");
                %>
                    <h4 align="center"> <%=mensaje%> </h4> <br/> <br/>     
                <%    
                } else if(request.getParameter("submit").equals("Comprobar Disponibilidad")){
                    
                    basico.Conectar(user, pass);
                    String cadena = "select * from ateam_reservasala where cod_sala='"+sala+"' and fecha=to_date('" + fecha + "','dd/mm/yyyy') and (hora_inicio between "+horaInicio+" and "+(horaInicio+nHoras)+" or hora_inicio+num_horas between "+horaInicio+" and "+(horaInicio+nHoras)+")"; 
                    System.out.println(cadena);
                    basico.crearStatement();
                    ResultSet check = basico.crearResultSet(cadena);
                    
                    while (check.next()){
                        int Inicio = check.getInt(4);
                        int Horas = check.getInt(5);
                        int Fin = Inicio + Horas;
                        int sumaForm = horaInicio + nHoras;
                            if(horaInicio == Inicio || sumaForm == Fin){
                                //sala no disponible
                                lastTest = 0 * lastTest;       
                            }else if(horaInicio >= Inicio && horaInicio < Fin){
                                lastTest = 0 * lastTest;
                            }else if (sumaForm == Inicio || horaInicio == Fin){
                                //sala disponible
                                lastTest = 1 * lastTest;  
                            }       
                    } 
                    if (lastTest==1){
                        
                        %>
                        <script type="text/javascript">
                            $('#Enviar').removeAttr('disabled');
                        </script>
                        <h4 align="center">La sala <%=sala%> está disponible</h4> <br/><br/>
                        <% 
                    }else if (lastTest==0){
                        
                        %>
                        <h4 align="center">La sala <%=sala%> no está disponible entre las horas consultadas del <%=fecha%> </h4> <br/><br/>
                        <%
                    }
                }
                    basico.finConectar();
        %>
        </form>
        </div>
        <%
            }
        %>
    </body>
</html>
