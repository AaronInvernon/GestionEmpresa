<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<jsp:useBean id="basico" scope="session" class="nuestrosBeans.baseDeDatos"/>
<!DOCTYPE html>
<html>
    <head>
        <title> Nueva Candidatura </title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="src/css/ATIclass.css" rel="stylesheet" type="text/css"/>
        <link href="src/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="src/css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container" style="width: 400px">
            <div  style="width: 100%; height: 600px; background-color: white; margin-top: 20px;">
                <!--Cabecera-->
                <div style="background-color: #f5f5f5; width: 100%; height: 76px; padding: 10px">
                    <div class="sidebar-item-pic" style=" padding-left: 10px; margin-right: 10px "></div>
                    <div>
                        <strong style=" color: #46b8da; font-size: 16px">[varNom varApe1]</strong>
                        <span class="badge badge-pill badge-primary" style="background-color: orange; float: right">Nueva Solicitud</span>
                        <br/>
                        <span class="small text-muted">[varPuestoVacante]</span>

                    </div> 
                </div>
                <div style="padding: 20px">
                    <form action="XXXXXXXXXXXXXXXXX">  <!-- ATENCION!! DAR LA ACCION DEL FORMULARIO! -->
                    varNom varApe1 varApe2 <br/>
                    DNI/NIE: varDniNie<br/>
                    NSS: varNss<br/>
                    Fecha Nac: varFechNac<br/>
                    Sexo: varSexo <br/>
                    Dirección: varCalle varNum varPiso varCp <br/>
                    <br/>
                    Hay que añadir <br/><br/>
                    *Estudios: varEstudios <br/>
                    *Experiencia: varExperiencia <br/>
                    *CV: docCV <br/>
                    <hr/>
                    <div class="input-group">
                        <span class="input-group-addon">Contraseña:</span>  
                        <input class="form-control" style="width: 200px" type="password" name="pass"/>
                        
        <!-- TIENE que validar que la contraseña introducida es válida (para el usuario en la sesion de RRHH -->
                        
                    </div>
                    <hr/>
                        <div style="display:flex; justify-content: space-around;">
                            <input class="btn btn-primary" type="submit" value="Aceptar" name="Aceptar"/>
                            <input class="btn btn-primary" type="submit" value="Rechazar" name="Rechazar"/>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/jquery-1.12.3.min.js" type="text/javascript"></script>
    </body>
</html>

