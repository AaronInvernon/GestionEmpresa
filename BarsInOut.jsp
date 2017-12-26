<%-- 
    Document   : BarsInOut
    Created on : 24-dic-2017, 16:28:43
    Author     : Kevin
--%>

<%@page import="java.text.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,  java.util.logging.Level, java.util.logging.Logger"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Bar chart stacked | chart.js</title>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.min.js"></script>
        <%DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
            Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "javaoracle");
            PreparedStatement stmt = conn.prepareStatement("select TO_CHAR(ENTRADA,'dd-mm-yyyy') as FECHA, TO_CHAR(ENTRADA,'hh24:mi') as ENTRADA,  TO_CHAR(SALIDA,'hh24:mi') as SALIDA, TO_CHAR(ENTRADA,'dy dd','nls_date_language = Spanish') as FECHA2  from ATEAM_ENTRASALE where USUARIO = 'ENRIQUE' ");
            ResultSet rset = stmt.executeQuery();
            ResultSetMetaData columnas = rset.getMetaData();
            int campos = columnas.getColumnCount();
            String fecha = "";
            String entrada = "";
            String salida = "";
            String entradabar = "";
            String salidabar = "";
            String hora = "";
            String fechaminima = "";

            while (rset.next()) {
                String CapturarFecha = rset.getString(1);
                String CapturarHoraEntrada = rset.getString(2);
                String CapturarHoraSalida = rset.getString(3);
                String Substraer1 = CapturarHoraEntrada.substring(0, 2);
                String Substraer2 = CapturarHoraSalida.substring(0, 2);
                String FechaMin = rset.getString(4);

                fecha = fecha + "'" + CapturarFecha + "', ";
                entrada = entrada + CapturarHoraEntrada + ", ";
                salida = salida + CapturarHoraSalida + ", ";
                entradabar = entradabar + Substraer1 + ", ";
                salidabar = salidabar + Substraer2 + ", ";
                hora = hora + Substraer1 + "+8" + ",";
                fechaminima = fechaminima+ "'" + FechaMin + "', ";
        %>
        <%}%>
   
    <style media="screen">
        .myChart-container{
            position: relative;
            margin: auto;
            width: 700px;
            height: 300px;
            margin-top: 100px;
            
        }
        canvas{
            border: 2px dotted white;
            padding:10px;
        }
    </style>
</head>
<body style="background-color: #2e1247">
  
    <p style="color:white"><%=fecha%></p>
    <p style="color:white"><%=entrada%></p>
    <p style="color:white"><%=salida%></p>
    <p style="color:white"><%=entradabar%></p>
    <p style="color:white"><%=salidabar%></p>
    <p style="color:white"><%=hora%></p>
    <p style="color:white"><%=fechaminima%></p>
    
    <div class="myChart-container">
        <canvas id="myChart" ></canvas>
    </div>

    <script type="text/javascript">
        Chart.defaults.global.tooltips.enabled = false;
        var data1 = [<%=entradabar%>];
        var data2 = [<%=hora%>];
        var data3 = [<%=salidabar%>];
        var labels = [<%=fechaminima%>];
        /* data details here */
        var data = {

            labels: labels,
            datasets: [{
                    label: 'Hra de inicio de jornada laboral',
                    data: data1,
                    backgroundColor: "#2e1247",
                    borderColor: "#F48FB1"

                }, {
                    label: 'Hora debida de finalizaciónd e trabajo',
                    data: data2,
                    backgroundColor: "#3F900C",
                    borderColor: "#BA68C8"
                },
                {
                    label: 'Hora de Salida contando horas extras trabajadas',
                    data: data3,
                    backgroundColor: '#FDAF27',
                    borderColor: "#4DB6AC"
                    
                }
            ]
        };
        /* Options here */
        var options = {
            
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

                        ticks: {
                            display: true,
                            min: 00,
                            max: 24,
                            stepSize: 1
                        },
                        gridLines: {
                            display: true,
                            color: "rgba(255,99,132,0.2)"
                        }
                    }],
                xAxes: [{

                        stacked: true,
                        gridLines: {
                            display: true,
                            color: "white"
                        }
                    }],
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
