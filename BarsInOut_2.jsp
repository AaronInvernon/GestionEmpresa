<%-- 
    Document   : BarsInOut
    Created on : 24-dic-2017, 16:28:43
    Author     : Kevin
--%>

<%@page import="java.text.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,  java.util.logging.Level, java.util.logging.Logger, java.util.Date"%>
<!DOCTYPE html>
<html>

    <meta charset="utf-8">
    <title>Bar chart stacked | chart.js</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.min.js"></script>
    <%DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
        Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "javaoracle");
        PreparedStatement stmt = conn.prepareStatement("select TO_CHAR(ENTRADA,'dd-mm-yyyy') as FECHA, TO_CHAR(ROUND (ENTRADA, 'hh24'),'hh24:mi') as ENTRADA, TO_CHAR(ROUND (SALIDA, 'hh24'),'hh24:mi') as SALIDA, TO_CHAR(ROUND (H_COMIDA, 'hh24'),'hh24:mi') as COMIDA, TO_CHAR(ENTRADA,'dy dd','nls_date_language = Spanish') as FECHA2 from ATEAM_ENTRASALE where USUARIO = 'ENRIQUE' ");
        PreparedStatement stmt2 = conn.prepareStatement("select TO_CHAR(ROUND(SYSDATE,'hh24'),'hh24:mi'),TO_CHAR(SYSDATE,'dd-mm-yyyy') from DUAL");
        ResultSet rset = stmt.executeQuery();
        ResultSet n = stmt2.executeQuery();
        n.next();
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

        while (rset.next()) {
            HorasTotales = 8;
            String CapturarFecha = rset.getString(1);
            fecha2 = "'" + CapturarFecha + "'";
            fecha = fecha + "'" + CapturarFecha + "', ";
            String CapturarHoraEntrada = rset.getString(2);
            entrada = entrada + "'" + CapturarHoraEntrada + "',";
            String Substraer1 = CapturarHoraEntrada.substring(0, 2);
            entradabar = entradabar + Substraer1 + ", ";
            if (Actual.equals(fecha2)) {
                String FechaMin = rset.getString(5);
                fechaminima = fechaminima + "'" + FechaMin + "',";
                String CapturarHcomida = rset.getString(4);
                if (CapturarHcomida == null) {
                    int x = Integer.parseInt(HoraActual.substring(0, 2)) - Integer.parseInt(Substraer1);
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
                        int y = Integer.parseInt(Substraer1) + 9 - Integer.parseInt(HoraActual.substring(0, 2));
                        extra = extra + Integer.toString(y) + ",";
                    } else {
                        extra = extra + 0 + ",";
                    }
                    HoraTotal = HoraTotal + Integer.toString(HorasTotales) + ",";
                } else {
                    int x = Integer.parseInt(CapturarHcomida.substring(0, 2)) - Integer.parseInt(Substraer1);
                    HorasTotales = HorasTotales - x;
                    conteo1 = conteo1 + Integer.toString(x) + ",";
                    comida = comida + 1 + ",";
                    int y = Integer.parseInt(HoraActual.substring(0, 2)) - (Integer.parseInt(CapturarHcomida.substring(0, 2)) + 1);

                    if ((HorasTotales - y) <= 0) {
                        conteo2 = conteo2 + HorasTotales + ",";
                        HorasTotales = 0;
                    } else {
                        conteo2 = conteo2 + Integer.toString(y) + ",";
                        HorasTotales = HorasTotales - y;
                    }
                    if (HorasTotales == 0) {
                        int z = Integer.parseInt(Substraer1) + 9 - Integer.parseInt(HoraActual.substring(0, 2));
                        extra = extra + Integer.toString(z) + ",";
                    } else {
                        extra = extra + 0 + ",";
                    }
                    HoraTotal = HoraTotal + Integer.toString(HorasTotales) + ",";
                    String CapturarHoraSalida = rset.getString(3);
                    if (CapturarHoraSalida == null) {
                        salida = salida + 0 + ", ";
                        salidabar = salidabar + 0 + ", ";
                    } else {
                        String Substraer3 = CapturarHoraSalida.substring(0, 2);
                        salida = salida + CapturarHoraSalida + ", ";
                        salidabar = salidabar + Substraer3 + ", ";
                    }
                }
            } else {
                String CapturarHcomida = rset.getString(4);
                String Substract2="";
                if(CapturarHcomida==null){
                Substract2 = "00";
                }else{
                Substract2 = CapturarHcomida.substring(0, 2);
                }
                int x = Integer.parseInt(Substraer1);
                int y = Integer.parseInt(Substract2);
                int resta1 = y - x;
                HorasTotales = HorasTotales - resta1;
                if (CapturarHcomida != null) {
                    comida = comida + 1 + ",";
                } else {
                    comida = comida + 0 + ",";
                }
                conteo1 = conteo1 + Integer.toString(resta1) + ",";
                String CapturarHoraSalida = rset.getString(3);
                String Substraer3 ="";
                if (CapturarHoraSalida==null){
                Substraer3 = "00";
                }else{
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
                if (HorasTotales == 0) {
                    int resta3 = b - x - 9;
                    extra = extra + Integer.toString(resta3) + ",";
                } else {
                    extra = extra + 0 + ",";
                }
                String FechaMin = rset.getString(5);
                fechaminima = fechaminima + "'" + FechaMin + "',";
                HoraTotal = HoraTotal + Integer.toString(HorasTotales) + ",";
                salida = salida + CapturarHoraSalida + ", ";
                salidabar = salidabar + Substraer3 + ", ";

            }
        }
    %>


    <style media="screen">
        .myChart-container{
            position: relative;
            margin: auto;
            width: 700px;
            height: 300px;
            margin-top: 100px;

        }
        canvas{
            padding:10px;
            background-color: white;
            margin: 10px;
            border-radius: 5px
        }
    </style>
</head>
<body style="background-color: #2e1247">
    <!--
      <p style="color:white"><%=fecha%></p>
      <p style="color:white"><%=entrada%></p>
      <p style="color:white"><%=salida%></p>
      <p style="color:white"><%=entradabar%></p>
      <p style="color:white"><%=salidabar%></p>
      <p style="color:white"><%=hora%></p>
      <p style="color:white"><%=fechaminima%></p>
    -->
    <p style="color:white">Para controlar las barras de la base de datos hice lo siguiente:</p>
    <ul style="color:white" >
        <li>
            Un array con la hora de entrada: <%=entradabar%>
        </li>
        <li>
            Un array que cuenta las horas entre la hora de entrada y la comida: <%=conteo1%>
        </li>
        <li>
            Un array de 1hora de comida: <%=comida%>
        </li>
        <li>
            Un array que cuenta las horas entre la hora de comida y el limite de trabajo (8horas total de trabajo limite): <%=conteo2%>
        </li>
        <li>
            Este es el contador de las (8horas total de trabajo limite) que ahora esta en 0 porque se culminó el horario laboral completo<%=HoraTotal%>
        </li>
        <li>
            Un array con las horas extras uqe inicia cuando el contador queda en cero: <%=extra%>
        </li>
        <li>
            Y esta es la fecha que se coloca debajo de las barras: <%=fechaminima%>
        </li>
        <li>
            FechaActual: <%=Actual%>
        </li>
        <li>
            HoraActual: <%=HoraActual%>
        </li>
        <li>
            FechaCapturada: <%=fecha2%>
        </li>
    </ul>

    <div class="myChart-container" >
        <canvas id="myChart"></canvas>
    </div>

    <script type="text/javascript">
        Chart.defaults.global.tooltips.enabled = false;
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
                            min: 05,
                            max: 24,
                            stepSize: 1,
                            fontSize: 8
                        },
                        gridLines: {
                            display: true,
                            color: "rgba(0,0,0,0.1)"
                        }
                    }],
                xAxes: [{

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
</body>
</html>
