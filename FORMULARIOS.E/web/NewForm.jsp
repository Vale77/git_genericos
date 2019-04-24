<%-- 
    Document   : NewForm
    Created on : 15/03/2018, 11:06:04 AM
    Author     : D4ve
--%>
<%@page import="FORM.Usuario"%> <!-- import de Usuario -->
<%@page session="true" %> <!-- Se agrega a modo de validacion -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% Usuario currentUser = (Usuario) (session.getAttribute("currentSessionUser")); //Recibe el atributo de sesion del Servlet
/*Si el atributo es diferente de nulo muestra la pagina */
    if (currentUser != null) { %>
<!DOCTYPE html>
<html>
    <head>
        <title>Formularios</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
        <div class="row bg-default">
            <div class="col-md-2"><center><img src="Logo_ESPE.png"  WIDTH="160" HEIGHT="100"/></center></div>
            <div class="col-md-8"><center><h1>Gestión de Formularios</h1></center></div>
            <div class="col-md-2"></div>
        </div>
        <ul class="nav nav-tabs" role="tablist">
            <%                      out.print("<li role=\"presentation\" ><a href=\"NewForm.jsp\"><img src=\"n.png\"/> Nuevo Formulario</a></li>");
                out.print("<li role=\"presentation\"><a href=\"mostrarFormulario.jsp\"><img src=\"m.png\"/> Gestión Formulario</a></li>");
                out.print("<li role=\"presentation\"><a href=\"mostrarGRes.jsp?param=\"null\"><img src=\"pm.png\"/> Formularios Publicados</a></li>");
                out.print("<li role=\"presentation\"><a href=\"mostrarRespuesta.jsp\"><img src=\"a.png\"/> Mostrar Respuestas</a></li>");
            %>


            <%--<li role="presentation"><a  href="mostrarGRes.jsp" >Volver</a></li>--%>
        </ul>

        <form action="nuevoFormulario.jsp" method="POST">   

            <div class="container">
                <div class="row">   
                    <div class="col-md-3"></div>
                    <div class="col-md-3"><h4>Nombre Formulario: </h4></div>
                    <div class="col-md-3"><center><input id="nombre" type="text" name="nombre" class="form-control" placeholder="nombre" required/></center></div>
                </div>
                <div class="row">
                    <div class="col-md-3"></div>
                    <div class="col-md-3"><h4>Descripcion: </h4></div>
                    <div class="col-md-3"><center><input id="descripcion" type="text" name="descripcion" class="form-control" placeholder="descripcion" required/></center></div>
                </div>
                <div class="row">
                    <div class="col-md-3"></div>
                    <div class="col-md-3"><h4>Objetivo: </h4></div>
                    <div class="col-md-3"><center><label for="objetivo" class="sr-only">objetivo</label><input id="objetivo" type="text" name="objetivo" class="form-control" placeholder="objetivo" required/></center></div>
                </div>
                <div class ="row">
                    <br><div class="col-md-3"></div>
                    <div class="col-md-3"><h4>Base: </h4></div>
                    <div class="col-md-3"><center><select  name="seleccion" class="form-control" required>
                                <option selected>DESARROLLO</option>
                            </select></center>


                    </div>

                </div>

                <div class ="row">
                    <br><div class="col-md-3"></div>
                    <div class="col-md-3"><h4>Tipo de formulario: </h4></div>
                    <div class="col-md-3"><center><select  name="seleccionTipo" class="form-control" required>
                                <option selected value="N">NO MODIFICABLE</option>
                                <option value="M">MODIFICABLE</option>
                                <option value="S">SECUENCIAL</option>
                            </select></center>
                        <br><div class="col-md-3"><center><button class="btn btn-default" type="submit" name="Submit" value="guardar">Aceptar</button></center></div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-3"></div>
                    <!--<div class="col-md-3"><center><button class="btn btn-default" type="submit" name="Submit" value="guardar">Aceptar</button></center></div>-->
                </div>
            </div>
        </form>
        %>
        <%
            } catch (Exception e) {
                System.out.println("error." + e.getMessage());

            }
        %>
    </body>
</html>
<% } else {

%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet"></link>
        <title>No Autorizado</title>
    </head>
    <body>
        <%             try {

        %>
        <ul class="nav nav-tabs" role="tablist">




            <div class="col-md-4">Error! Usuario no autorizado</div>


        </form>


    </ul>

    <%             } catch (Exception e) {
            System.out.println("error." + e.getMessage());

        }
    %>

</body>
</html>



<% }%>

