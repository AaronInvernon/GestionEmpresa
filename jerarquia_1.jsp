<%-- 
    Document   : jerarquia
    Created on : 30-dic-2017, 11:24:20
    Author     : Kevin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*, java.util.logging.Level, java.util.logging.Logger, java.util.Date"%>
<jsp:useBean id="basico" scope="session" class="nuestrosBeans.baseDeDatos"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="src/css/jerarquia_1.css" rel="stylesheet" type="text/css"/>
        <link href="src/css/ATIclass_Dashboard.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body class="purplebody">
        <%
            String user = "system";
            String pass = "javaoracle";
            basico.Conectar(user, pass);
            DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
            Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "javaoracle");
            PreparedStatement S1 = conn.prepareStatement("SELECT LEVEL,NOMBRE, N_EMP from ATEAM_EMP where level = 1 connect by PRIOR N_EMP = N_RESP START WITH N_EMP=10 ORDER BY LEVEL");
            PreparedStatement S2 = conn.prepareStatement("SELECT LEVEL,NOMBRE, N_EMP, N_RESP from ATEAM_EMP where level = 2 connect by PRIOR N_EMP = N_RESP START WITH N_EMP=10 ORDER BY LEVEL");
            PreparedStatement S3 = conn.prepareStatement("SELECT LEVEL,NOMBRE, N_EMP, N_RESP from ATEAM_EMP where level = 3 connect by PRIOR N_EMP = N_RESP START WITH N_EMP=10 ORDER BY LEVEL");
            ResultSet RS1 = S1.executeQuery();
            ResultSet RS2 = S2.executeQuery();
            
            RS1.next();
            int lvl = RS1.getInt(1);
            String name = RS1.getString(2);
            int N_Emp_Lvl_1 = RS1.getInt(3);
            int N_Emp_Lvl_2 = 0;
            int N_Emp_Lvl_3 = 0;
            int nresp = 0;
        %>
        <div class="tree">
            <ul>
                <li class="main">
                    <a href="?n_emp=<%=N_Emp_Lvl_1%>"><span><%=name%></span></a>
                    <ul>
                        <%
                            while (RS2.next()) {
                                lvl = RS2.getInt(1);
                                name = RS2.getString(2);
                                N_Emp_Lvl_2 = RS2.getInt(3);
                                nresp = RS2.getInt(4);
                                if (nresp == N_Emp_Lvl_1) {%>
                        <li><a href="?n_emp=<%=N_Emp_Lvl_2%>"><span><%=name%></span></a>
                            <ul>
                                <% ResultSet RS3 = S3.executeQuery();
                                    while (RS3.next()) {
                                        lvl = RS3.getInt(1);
                                        name = RS3.getString(2);
                                        N_Emp_Lvl_3 = RS3.getInt(3);
                                           nresp = RS3.getInt(4);
                                           if (nresp == N_Emp_Lvl_2) {%>
                                <li><a href="?n_emp=<%=N_Emp_Lvl_3%>"><span><%=name%></span></a></li>
                                            <% }
                                       }
                                            %>
                            </ul>
                        </li> 
                        <%}
                            }
                        %>
                    </ul>
                </li>
            </ul>
        </div>

        <script src="js/jquery-1.12.3.min.js" type="text/javascript"></script>
    </body>
</html>
