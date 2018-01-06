<%-- 
    Document   : BarsInOut
    Created on : 24-dic-2017, 16:28:43
    Author     : Kevin
--%>

<%@page import="java.text.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,  java.util.logging.Level, java.util.logging.Logger, java.util.Date"%>
<jsp:useBean id="basico" scope="session" class="nuestrosBeans.baseDeDatos"/>
<!DOCTYPE html>
<html>

    <meta charset="utf-8">
    <title>Bar chart stacked | chart.js</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.min.js"></script>
    <link href="src/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="src/css/ATIclass_Dashboard.css" rel="stylesheet" type="text/css"/>
    <%DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
        Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "javaoracle");
        PreparedStatement stmt = conn.prepareStatement("select TO_CHAR(ENTRADA,'dd-mm-yyyy') as FECHA, TO_CHAR(ROUND (ENTRADA, 'hh24'),'hh24:mi') as ENTRADA, TO_CHAR(ROUND (SALIDA, 'hh24'),'hh24:mi') as SALIDA, TO_CHAR(ROUND (H_COMIDA, 'hh24'),'hh24:mi') as COMIDA, TO_CHAR(ENTRADA,'dy dd','nls_date_language = Spanish') as FECHA2 from ATEAM_ENTRASALE where N_EMP = "+request.getParameter("n_emp"));
        PreparedStatement stmt2 = conn.prepareStatement("select TO_CHAR(ROUND(SYSDATE,'hh24'),'hh24:mi'),TO_CHAR(SYSDATE,'dd-mm-yyyy') from DUAL");
        PreparedStatement stmt3 = conn.prepareStatement("select * from ATEAM_EMP where N_EMP = "+request.getParameter("n_emp"));
        ResultSet rset = stmt.executeQuery();
        ResultSet n = stmt2.executeQuery();
        ResultSet f = stmt3.executeQuery();
        n.next();
        f.next();

        //VARIABLES PARA PRIMER Y SEGUNDO STATEMENT
        String fecha = "";
        String fecha2 = "";
        String entrada = "";
        String conteo1 = "";
        String conteo2 = "";
        String comida = "";
        String salida = "";
        String entradabar = "";
        String salidabar = "";
        String hora = "";
        String fechaminima = "";
        String HoraActual = n.getString(1);
        String FechaActual = n.getString(2);
        String Actual = "'" + FechaActual + "'";
        int HorasTotales = 0;
        String HoraTotal = "";
        String extra = "";
        String Tarde = "";
        int resta3 = 0;
        //Variables 3er Statement
        String NombCompleto = f.getString(1) + " " + f.getString(2);
        String Puesto = f.getString(5);
        String Departamento = f.getString(4);
        String Inc = f.getString(7);
        String Incorp = Inc.substring(0, 10);
        String Salario = f.getString(8) + " €";
        int ExtrasAcum = 0;
        int Deuda=0;
        while (rset.next()) {
            HorasTotales = 8;
            String CapturarFecha = rset.getString(1);
            fecha2 = "'" + CapturarFecha + "'";
            fecha = fecha + "'" + CapturarFecha + "', ";
            String CapturarHoraEntrada = rset.getString(2);
            entrada = entrada + "'" + CapturarHoraEntrada + "',";
            String SubsHoraEntrada = CapturarHoraEntrada.substring(0, 2);

            if (Integer.parseInt(SubsHoraEntrada) > 10) {
                int s = Integer.parseInt(SubsHoraEntrada) - 10;
                Tarde = Tarde + Integer.toString(s) + ",";
                entradabar = entradabar + 10 + ", ";
                Deuda = Deuda + s;
            } else {
                Tarde = Tarde + 0 + ",";
                entradabar = entradabar + SubsHoraEntrada + ", ";
                Deuda = Deuda + 0;
            }

            if (Actual.equals(fecha2)) {
                String FechaMin = rset.getString(5);
                fechaminima = fechaminima + "'" + FechaMin + "',";
                String CapturarHcomida = rset.getString(4);
                int k = HorasTotales - (Integer.parseInt(SubsHoraEntrada) - 10); //8 - (17-10) = 1
                if (k > 8) {
                    HorasTotales = 8;
                } else if (k < 0) {
                    HorasTotales = 0;
                } else {
                    HorasTotales = k;
                }
                if (CapturarHcomida == null) {
                    HorasTotales = HorasTotales + 1;
                    int x = Integer.parseInt(HoraActual.substring(0, 2)) - Integer.parseInt(SubsHoraEntrada);
                    HorasTotales = HorasTotales - x;
                    if (HorasTotales <= 0) {
                        conteo1 = conteo1 + 8 + ",";
                        HorasTotales = 0;
                    } else {
                        conteo1 = conteo1 + Integer.toString(x) + ",";
                    }
                    comida = comida + 0 + ",";
                    conteo2 = conteo2 + 0 + ",";
                    if (HorasTotales == 0) {
                        int y = 0;
                        if (Integer.parseInt(HoraActual.substring(0, 2)) > 19) {
                            y = Integer.parseInt(HoraActual.substring(0, 2)) - 19;
                        } else {
                            y = 19 - Integer.parseInt(HoraActual.substring(0, 2));
                        }

                        extra = extra + Integer.toString(y) + ",";
                        if (y <= 0) {
                            ExtrasAcum = ExtrasAcum + 0;
                        } else {
                            ExtrasAcum = ExtrasAcum + y;
                        }

                    } else {
                        extra = extra + 0 + ",";
                        ExtrasAcum = ExtrasAcum + 0;
                    }
                    HoraTotal = HoraTotal + Integer.toString(HorasTotales) + ",";
                } else {
                    int x = Integer.parseInt(CapturarHcomida.substring(0, 2)) - Integer.parseInt(SubsHoraEntrada); // 19 - 17 =  2
                    HorasTotales = HorasTotales - x; //1 - 2 = -1
                    conteo1 = conteo1 + Integer.toString(x) + ","; // conteo1 = 2
                    int y = 0;
                    if (HorasTotales <= 0) {
                        comida = comida + 0 + ",";
                        y = Integer.parseInt(HoraActual.substring(0, 2)) - (Integer.parseInt(CapturarHcomida.substring(0, 2))); //22 - 19 = 3
                        HorasTotales = 0;
                    } else {
                        comida = comida + 1 + ",";
                        y = Integer.parseInt(HoraActual.substring(0, 2)) - (Integer.parseInt(CapturarHcomida.substring(0, 2)) + 1);
                    }
                    if ((HorasTotales - y) <= 0) { // 0 - 3 = -3
                        conteo2 = conteo2 + HorasTotales + ","; //no aplica
                        HorasTotales = 0;//no aplica
                    } else {
                        conteo2 = conteo2 + Integer.toString(y) + ","; //6
                        HorasTotales = HorasTotales - y;
                    }
                    String CapturarHoraSalida = rset.getString(3);
                    if (CapturarHoraSalida == null) {
                        if (HorasTotales == 0) {
                            int z = 0;
                            if (Integer.parseInt(HoraActual.substring(0, 2)) > 19) {
                                z = Integer.parseInt(HoraActual.substring(0, 2)) - 19;
                            } else {
                                z = 19 - Integer.parseInt(HoraActual.substring(0, 2));
                            }
                            extra = extra + Integer.toString(z) + ",";
                            if (z <= 0) {
                                ExtrasAcum = ExtrasAcum + 0;
                            } else {
                                ExtrasAcum = ExtrasAcum + z;
                            }
                        } else {
                            extra = extra + 0 + ",";
                            ExtrasAcum = ExtrasAcum + 0;
                        }
                        HoraTotal = HoraTotal + Integer.toString(HorasTotales) + ",";
                        salida = salida + 0 + ", ";
                        salidabar = salidabar + 0 + ", ";

                    } else {
                        if (HorasTotales == 0) {
                            int z = 0;
                            if (Integer.parseInt(CapturarHoraSalida.substring(0, 2)) > 19) {
                                z = Integer.parseInt(CapturarHoraSalida.substring(0, 2)) - 19;
                            } else {
                                z = 19 - Integer.parseInt(CapturarHoraSalida.substring(0, 2));
                            }
                            extra = extra + Integer.toString(z) + ",";
                            if (z <= 0) {
                                ExtrasAcum = ExtrasAcum + 0;
                            } else {
                                ExtrasAcum = ExtrasAcum + z;
                            }
                        } else {
                            extra = extra + 0 + ",";
                            ExtrasAcum = ExtrasAcum + 0;
                        }
                        String SubsHoraSalida = CapturarHoraSalida.substring(0, 2);
                        salida = salida + CapturarHoraSalida + ", ";
                        salidabar = salidabar + SubsHoraSalida + ", ";
                    }
                }
            } else {
                int k = HorasTotales - (Integer.parseInt(SubsHoraEntrada) - 10); //AQUI CALCULO EL LARGO DE HORAS TOTALES -- HTotales = 8 - (19:00 - 10:00 = 9) = 7
                if (k > 8) {
                    HorasTotales = 8;
                } else if (k < 0) {
                    HorasTotales = 0;
                } else {
                    HorasTotales = k;
                }
                String CapturarHcomida = rset.getString(4);
                String Substract2 = "";
                if (CapturarHcomida == null) {
                    Substract2 = "00";
                } else {
                    Substract2 = CapturarHcomida.substring(0, 2);
                }
                int x = Integer.parseInt(SubsHoraEntrada);
                int y = Integer.parseInt(Substract2);
                int resta1 = y - x;
                HorasTotales = HorasTotales - resta1;
                if (CapturarHcomida != null) {
                    if(HorasTotales<=0){
                        comida = comida + 0 + ",";
                    }else{
                        comida = comida + 1 + ",";
                    }
                    
                } else {
                    comida = comida + 0 + ",";
                }
                conteo1 = conteo1 + Integer.toString(resta1) + ",";
                String CapturarHoraSalida = rset.getString(3);
                String Substraer3 = "";
                if (CapturarHoraSalida == null) {
                    Substraer3 = "00";
                } else {
                    Substraer3 = CapturarHoraSalida.substring(0, 2);
                }
                int a = Integer.parseInt(Substract2) + 1; //IF 15:00 THEN +1 = 16:00
                int b = Integer.parseInt(Substraer3); // 22:00
                int resta2 = b - a; // 22:00 - 16:00 = 6:00
                if (resta2 > HorasTotales) {
                    conteo2 = conteo2 + Integer.toString(HorasTotales) + ",";
                } else {
                    conteo2 = conteo2 + Integer.toString(resta2) + ",";
                }
                HorasTotales = HorasTotales - resta2;
                if (HorasTotales <= 0) {
                    HorasTotales = 0;
                }
                resta3 = b - 19;
                if (HorasTotales == 0) {
                    
                    extra = extra + Integer.toString(resta3) + ",";
                        ExtrasAcum = ExtrasAcum + resta3;
          
                } else {
                    
                    extra = extra + Integer.toString(resta3) + ",";
                    ExtrasAcum = ExtrasAcum + 0;
                }
                String FechaMin = rset.getString(5);
                fechaminima = fechaminima + "'" + FechaMin + "',";
                HoraTotal = HoraTotal + Integer.toString(HorasTotales) + ",";
                salida = salida + CapturarHoraSalida + ", ";
                salidabar = salidabar + Substraer3 + ", ";

            }
        }
    %>

</head>
<body style="background-color: #2e1247">
   
    <br/>
    <div class="container">
        <%
        session.setAttribute("miEmp", Integer.parseInt(request.getParameter("n_emp")));
        %>
        <form action="" method="post">
        <div class="col-sm-4" style="color: white; border-radius: 5px; padding:5px">
            <div class="sidebar-item"><a href="#">
                    <div class="sidebar-item-pic"></div>
                    <div class="sidebar-item-content">

                        <strong><%=NombCompleto%></strong><br/>
                        <span class="badge" style="background-color: orange"><%=Puesto%></span>
                    </div> </a>  
            </div><br/>
            Departamento: <%=Departamento%><br/>
            Incorporación: <%=Incorp%><br/>
            Salario: <%=Salario%><br/>
            Horas extras acumuladas: <%=ExtrasAcum%><br/>
            Horas en deuda: <%=Deuda%><br/>


        </div>
        <div class="col-sm-6" style="background-color: white; border-radius: 5px; padding:5px">
            <canvas id="myChart" ></canvas>
        </div>
        <div class="col-sm-2" style="color: white; border-radius: 5px; padding:10px">
            Opciones:<br/>
            <div class="dropdown">
            <button type="button" class="btn dropdown-toggle" Style="background-color: orange; margin: 3px"  value="aumento" id="btncapa1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" >Gestionar Aumento</button><br/>
            <div class="dropdown-menu" aria-labelledby="btncapa1">
                <div id="capa1" class="form-inline" style="padding:20px; color:grey">
                    
                    <p>¿En qué cantidad deseas aumentar el sueldo?</p>
                    Aumentar el sueldo en: <input type="text" name="txtAumento"  class="form-control" placeholder="00"> €.
                    <br/>
                    <div class="input-group">
                        <span>Contraseña:</span><br/>
                        <input style="width: 200px" type="password" class="form-control" name="password1"/>
                    </div><br/><br/>
                    <input style="color:black;" class="btn" type="submit" name="submit" value="Aumentar">
                </div>
            </div>
            </div>
            <button type="button" class="btn dropdown-toggle" Style="background-color: orange; margin: 3px" value="aviso" id="btncapa2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Aviso</button><br/>
            <div class="dropdown-menu" aria-labelledby="btncapa2">
                <div id="capa2" class="form-inline" style="padding:20px; color:grey">
                    <p>¿Avisar de retrasos?</p>
                    <div class="input-group">
                        <span>Contraseña:</span><br/>
                        <input style="width: 200px" type="password" class="form-control" name="password2"/>
                    </div><br/><br/>
                    <input type="text" name='txtNombre' value='<%=NombCompleto%>' hidden="true"/> 
                    <input style="color:black;" class="btn" type="submit" name="submit" value="Enviar Aviso">
                </div>
             </div>   
            <button type="button" class="btn dropdown-toggle" Style="background-color: orange; margin: 3px" value="despido" id="btncapa3" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Gestionar Despido</button>
            <div class="dropdown-menu" aria-labelledby="btncapa3">
                <div id="capa3" class="form-inline" style="padding:20px; color:grey">
                    <p>¿Despedir empleado?</p>
                    <div class="input-group">
                        <span>Contraseña:</span><br/>
                        <input style="width: 200px" type="password" class="form-control" name="password3"/>
                    </div><br/><br/>
                    <input style="color:black;" class="btn" type="submit" name="submit" value="Despedir">
                </div>
                </div>
        </div>
        </form>
            <%
                String user= (String)session.getAttribute("Usuario");
                String pass= (String)session.getAttribute("Contraseña");
                int identificador = Integer.parseInt(request.getParameter("n_emp"));
            if(request.getParameter("password1")!=null && request.getParameter("submit").equals("Aumentar")){
                
               int aument = Integer.parseInt(request.getParameter("txtAumento"));
               basico.Conectar(user, pass);
               String cadena = "update ateam_emp set salario=(salario+"+aument+") where n_emp="+identificador+"";
               basico.crearPreparedStatement(cadena);
               basico.ejUpdatePrepStat();
               
               
            }else if(request.getParameter("password2")!=null && request.getParameter("submit").equals("Enviar Aviso")){
                
                String dato = request.getParameter("txtNombre");
                String[] datoArray = dato.split(" ");
                String miName = datoArray[0];
                String mensajeAviso = "Te has retrasado " + Deuda +" horas";
                String cadena = "insert into ateam_sms(remitente,destinatario,tipo,mensaje,fecha_env,id) values(user,'"+miName+"','AVISO','"+mensajeAviso+"',to_date(sysdate, 'dd/mm/yy hh24:mi'),seq_ateam_sms.nextval)";
     
                
                basico.Conectar(user, pass);
                basico.crearPreparedStatement(cadena);
                basico.ejUpdatePrepStat();
                
            }else if(request.getParameter("password3")!=null && request.getParameter("submit").equals("Despedir")){
                
                basico.Conectar(user, pass);
                String cadena = "delete from ateam_emp where n_emp="+identificador+"";
                basico.crearPreparedStatement(cadena);
                basico.ejUpdatePrepStat();
            }
            %>
            
    </div>
    <script type="text/javascript">
        Chart.defaults.global.tooltips.enabled = false;
        Chart.defaults.global.responsive = false;
        var HorasTarde = [<%=Tarde%>];
        var HoraEntrada = [<%=entradabar%>];
        var ConteoHoras1 = [<%=conteo1%>];
        var comida = [<%=comida%>];
        var ConteoHoras2 = [<%=conteo2%>];
        var HorasTotales = [<%=HoraTotal%>];
        var HoraSalida = [<%=extra%>];
        var labels = [<%=fechaminima%>];
        /* data details here */
        var data = {

            labels: labels,
            datasets: [{
                    label: 'Hra de inicio de jornada laboral',
                    data: HoraEntrada,
                    backgroundColor: 'rgba(0, 0, 0, 0)',
                    borderColor: "#F48FB1"

                }, {
                    label: 'Hras no trabajadas',
                    data: HorasTarde,
                    backgroundColor: 'rgba(226, 16, 16, 0.3)',
                    borderColor: "#F48FB1"

                }, {
                    label: 'Conteo de horas1',
                    data: ConteoHoras1,
                    backgroundColor: "#6629A5",
                    borderColor: "#BA68C8"
                }, {
                    label: 'Comida',
                    data: comida,
                    backgroundColor: 'rgba(102, 41, 165, 0.7)',
                    borderColor: "#BA68C8"
                }, {
                    label: 'Conteo de horas2',
                    data: ConteoHoras2,
                    backgroundColor: "#6629A5",
                    borderColor: "#BA68C8"
                },
                {
                    label: 'horas que debe trabajar',
                    data: HorasTotales,
                    backgroundColor: "rgba(0,0,0,0.1)",
                    borderColor: "#BA68C8"
                },
                {
                    label: 'Hora de Salida contando horas extras trabajadas',
                    data: HoraSalida,
                    backgroundColor: '#FDAF27',
                    borderColor: "#4DB6AC"

                }
            ]
        };
        /* Options here */
        var options = {
            hover: {mode: null},
            tooltips: {
                mode: 'index',
                callbacks: {
                    // Use the footer callback to display the sum of the items showing in the tooltip
                    footer: function (tooltipItems, data) {
                        var sum = 0;

                        tooltipItems.forEach(function (tooltipItem) {
                            sum += data.datasets[tooltipItem.datasetIndex].data[tooltipItem.index];
                        });
                        return 'Sum: ' + sum;
                    }
                },
                footerFontStyle: 'normal'
            },
            legend: {
                display: false
            },
            responsive: true,
            title: {
                display: true,
                text: 'Control Horario de Empleado'
            },
            scales: {
                yAxes: [{
                        //ESTE ES EL STACKED que monta barras sobre barras

                        stacked: true,
                        ticks: {
                            callback: function (value, index, values) {
                                return  value + ':00';
                            },
                            display: true,
                            min: 06,
                            max: 24,
                            stepSize: 2,
                            fontSize: 8
                        },
                        gridLines: {
                            display: true,
                            color: "rgba(0,0,0,0.1)"
                        }
                    }],
                xAxes: [{
                        ticks: {
                            fontSize: 8
                        },
                        stacked: true,

                        gridLines: {
                            display: true,
                            color: "rgba(0,0,0,0.1)"
                        }
                    }]
            }
        };
        /* main part here */
        var ctx = document.getElementById("myChart").getContext('2d');
        var myChart = new Chart(ctx, {
            type: 'bar',
            data: data,
            options: options
        });


    </script>
    <script src="src/js/jquery-1.12.3.min.js" type="text/javascript"></script>
    <script src="src/js/bootstrap.min.js" type="text/javascript"></script>
</body>
</html>
