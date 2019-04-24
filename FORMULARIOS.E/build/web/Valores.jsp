<%-- 
    Document   : Valores
    Created on : 13-ago-2016, 22:39:15
    Author     : david
--%>


<%@page import="FORM.DB"%>
<%@page import="java.sql.Connection"%>
<%@page import="FORM.TipoPreguntas"%>
<%@page import="java.util.LinkedList"%>
<%@page import="FORM.Grupo"%>
<%@page import="FORM.Preguntas"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="FORM.Valores"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Valor-Pregunta</title>           
        <link href="css/bootstrap.min.css" rel="stylesheet"/>
    </head>
    <body>
        <%@page import="org.apache.log4j.Logger"%>
        <%! static Logger logger = Logger.getLogger("bitacora.subnivel.Control");%>
        <%logger.info("esta es la prueba."); %>
        <%logger.debug("Demostracion del mensaje");%>
        <%logger.warn("Show WARN message");%>
        <%logger.error("Show ERROR message");%>
        <%logger.fatal("Show FATAL message"); %>
        <%

            try {

        %> 
        <div class="row bg-info">
            <div class="col-md-2"><center><img src="espelogo.jpg"/></center></div>
            <div class="col-md-8"><center><h1>Formularios Genericos</h1></center></div>
            <div class="col-md-2"></div>
        </div>
        <ul class="nav nav-tabs" role="tablist">
            <li role="presentation" ><a href="Valores.jsp">Nuevo Valor</a></li>                
            <li role="presentation"><a href="pregunta.jsp">Nueva Pregunta</a></li>
        </ul>
        <form action="nuevoValor.jsp" method="POST">   
            <%                //out.println("<h3>"+pregunta+"</h3>");
            %>
            <div class="container">
                <div class="row">
                    <div class="col-md-3"></div>
                    <div class="col-md-3"><h4>Valor: </h4></div>
                    <div class="col-md-3"><center><input id="valor" type="text" name="valor" class="form-control" placeholder="ingrese el valor de la respuesta" required/></center></div>
                </div>
                <div class="row">
                    <div class="col-md-3"></div>
                    <div class="col-md-3"><center><button class="btn btn-default" type="submit" name="Submit" value="guardar">Agregar</button></center></div>
                </div>
            </div>
        </form>
        <%             } catch (Exception e) {
                System.out.println("error." + e.getMessage());

            }
        %>
    </body>
</html>
