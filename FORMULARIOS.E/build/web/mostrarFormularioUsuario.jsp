<%--
    Document   : mostrarFormularioUsuario
    Created on : 15/03/2018, 11:11:21
    Author     : DIEGOPC
--%>

<%@page import="FORM.Respuestas"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="FORM.Formulario"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.LinkedList"%>
<%@page import="FORM.Valores"%>
<%@page import="java.sql.Connection"%>
<%@page import="FORM.DB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="FORM.Usuario"%> <!-- import de Usuario -->
<%@page session="true" %> <!-- Se agrega a modo de validacion -->
<!DOCTYPE html>
<% Usuario currentUser = (Usuario) (session.getAttribute("currentSessionUser")); //Recibe el atributo de sesion del Servlet
/*Si el atributo es diferente de nulo muestra la pagina */
    if (currentUser != null) { %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuario-Formulario</title>
        <link href="css/bootstrap.min.css" rel="stylesheet"/>
    <div class="row bg-default">
        <div class="col-md-2"><center><img src="Logo_ESPE.png"  WIDTH="160" HEIGHT="100"/></center></div>
        <div class="col-md-8"><center><h1>Gestión de Formularios</h1></center></div>
        <div class="col-md-2"></div>
    </div>
    <ul class="nav nav-tabs" role="tablist">
        <li role="presentation" ><a href="NewForm.jsp"><img src="n.png"/> Nuevo Formulario</a></li>
        <li role="presentation"><a href="mostrarFormulario.jsp"><img src="m.png"/> Gestión Formulario</a></li>
        <li role="presentation"><a href="mostrarGRes.jsp?param="><img src="pm.png"/> Formularios Publicados</a></li>
        <li role="presentation"><a href="mostrarRespuesta.jsp"><img src="a.png"/> Mostrar Respuestas</a></li>


    </ul>
</head>
<body
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

    <%            DB con = DB.getInstancia();
        Connection co = con.getConnection();
        LinkedList<Formulario> listaF = new LinkedList<Formulario>();
        LinkedList<Usuario> listaU = new LinkedList<Usuario>();
        LinkedList<Respuestas> listaR = new LinkedList<Respuestas>();
        String NombreF = request.getParameter("Submit");
        int Cod = Integer.parseInt(NombreF);
        ResultSet rs = co.prepareStatement("SELECT * FROM UTIC.UZGTFORMULARIOS WHERE codigo_UZGTFORMULARIOS = '" + Cod + "'").executeQuery();
        while (rs.next()) {
            Formulario F = new Formulario();
            F.setCodigo_formulario(rs.getInt(1));
            F.setNombre_formulario(rs.getString(2));
            F.setDescripcion_formulario(rs.getString(3));
            F.setFecha_formulario(rs.getDate(4));
            F.setObjetivo_formulario(rs.getString(5));
            F.setBase_formulario(rs.getString(6));
            F.setTipoFormulario(rs.getString(11));
            listaF.add(F);
        }
        rs.close();

        /*Recogo los pidm para mostrarlos segun su usuario*/
        ResultSet rs1 = co.prepareStatement("select * from UZGTFORMULARIO_PERSONA WHERE codigo_UZGTFORMULARIOS ='" + Cod + "'").executeQuery();
        while (rs1.next()) {
            Usuario usuario = new Usuario();
            usuario.setPIDM(rs1.getInt(1));
            usuario.setEstLn(rs1.getString(6));
            listaU.add(usuario);
            //JOptionPane.showMessageDialog(null, rs1.getInt(1));
        }
        rs1.close();
        rs1 = co.prepareStatement("SELECT UZGTRESPUESTAS_ITERACION FROM UZGTRESPUESTAS WHERE CODIGO_UZGTFORMULARIOS=" + Cod + " GROUP BY UZGTRESPUESTAS_ITERACION order by uzgtrespuestas_iteracion asc").executeQuery();
        while (rs1.next()) {
            Respuestas res = new Respuestas();
            res.setIteracionRespuesta(rs1.getInt(1));
            listaR.add(res);
        }
        rs1.close();

        rs1.close();
        if (listaU.isEmpty()) {
            out.println("<div class=\"row\">");
            out.println("<div class=\"col-md-3\"></div>");
            out.println("<div class=\"col-md-6\"><center><h4 class=\"alert alert-info\">" + "No existen Pidms asignados a este formulario" + "</h4></center></div>");
            out.println("</div>");
        } else {
            out.println("<div class=\"row\">");
            out.println("<div class=\"col-md-3\"></div>");
            out.println("<div class=\"col-md-6\"><center><h4 class=\"text-uppercase alert alert-info\">" + "Formulario: " + listaF.getFirst().getNombre_formulario() + "</h4></center></div>");
            out.println("</div>");
            out.print("<div class=\"row\">");
            out.print("<div class=\"col-md-2\"></div>");
            out.print("<div class=\"col-md-2\"><p name=\"cod\">Codigo Formulario</p></div>");
            out.print("<div class=\"col-md-2\"><p name=\"nombre\">Usuario</p></div>");
            out.print("<div class=\"col-md-2\"><p name=\"pidm\">PIDM</p></div>");
            out.print("<div class=\"col-md-1\"></div>");
            out.print("</div></form>");
            out.print("<hr>");
            /*muestro los codigo de formulario, el usuario y su "pidm"*/

            if (listaF.getFirst().getTipoFormulario().equals("N") || listaF.getFirst().getTipoFormulario().equals("M")) {
                //out.print("<div class=\"col-md-2\"><input type=\"hidden\" name=\"iter\" value='"+listaR.getFirst().getIteracionRespuesta()+"' readonly></div>");
                for (int i = 0; i < listaU.size(); i++) {

                    // out.print("<form action=\"mostrarRespuestaUsuario_1.jsp\" method=\"POST\" target=\"_self\">");
                    out.print("<form action=\"mostrarRespuestaUsuario.jsp\" method=\"POST\" target=\"_self\">");
                    out.print("<div class=\"row\">");
                    out.print("<div class=\"col-md-1\"></div>");
                    out.print("<div class=\"col-md-2\"><input class=\"panel panel-info panel-heading\" size='8' type=\"text\" name=\"cod\" value='" + Cod + "' readonly></div>");
                    //JOptionPane.showMessageDialog(null, "iteracion: "+listaR.getFirst().getIteracionRespuesta());
                    //
                    out.print("<div class=\"col-md-3\"><input class=\"panel panel-info panel-heading\" size='8' type=\"text\" name=\"nombre\" value='Usuario' readonly></div>");
                    out.print("<div class=\"col-md-2\"><input type=\"text\" style='heigth : 1px' size='10' class=\"panel panel-info panel-heading\" name=\"pidm\" value='" + listaU.get(i).getPIDM() + "' readonly></div>");
                    out.print("<div class=\"col-md-1\"><button class=\"btn btn-default\" type=\"text\" name=\"Submit\" value='" + Cod + "'>Ver</button></div>");
                    out.print("</div></form>");
                    //JOptionPane.showMessageDialog(null, listaU.get(i).getPIDM()+": "+listaU.size());
                }//cierra for para mostrar resultados
            }//cierre if modificable y no modificable
            if (listaF.getFirst().getTipoFormulario().equals("S")) {
                int aux = 0;
                for (int i = 0; i < listaR.size(); i++) {
                    for (int j = 0; j < listaU.size(); j++) {
                        if (aux != listaR.get(i).getIteracionRespuesta()) {
                            if (listaU.get(j).getEstLn().equals("L")) {
                                //  out.print("<form action=\"mostrarRespuestaUsuario_1.jsp\" method=\"POST\" target=\"_self\">");
                                out.print("<form action=\"mostrarRespuestaUsuario.jsp\" method=\"POST\" target=\"_self\">");
                                out.print("<div class=\"row\">");
                                out.print("<div class=\"col-md-2\"></div>");
                                out.print("<div class=\"col-md-1\"><input type=\"text\" class=\"panel panel-info panel-heading\" name=\"cod\" value='" + Cod + "' readonly></div>");
                                out.print("<div class=\"col-md-1\"><input type=\"text\" class=\"panel panel-info panel-heading\" name=\"iter\" value='" + listaR.get(i).getIteracionRespuesta() + "' readonly></div>");
                                out.print("<div class=\"col-md-3\"><input class=\"panel panel-info panel-heading\" size='20' type=\"text\" name=\"nombre\" value='Usuario' readonly></div>");
                                out.print("<div class=\"col-md-2\"><input type=\"text\" class=\"panel panel-info panel-heading\" name=\"pidm\" value='" + listaU.get(j).getPIDM() + "' readonly></div>");
                                //out.print("<input type=\"hidden\"  name=\"pidm\" value='"+listaU.get(j).getPIDM()+"' readonly></div>");
                                out.print("<div class=\"col-md-1\"><button class=\"btn btn-default\" type=\"text\" name=\"Submit\" value='" + Cod + "'>Ver</button></div>");
                                out.print("</div></form>");
                                aux = listaR.get(i).getIteracionRespuesta();

                            }//if llenados

                            /*
                else{
                    out.println("<div class=\"row\">");
                    out.println("<div class=\"col-md-3\"></div>");
                    out.println("<div class=\"col-md-6\"><center><h4 class=\"alert alert-info\">"+"No existen usuarios que hayan llenado este formulario"+"</h4></center></div>");
                    out.println("</div>");
                }*/
                        }
                    }//cierre for lista pidm
                }//cierra for para mostrar resultados por iteracion
            }//cierre del else if secuencial
        }//cierre de lista usuario con elementos
        con.closeConexion();
    %>
    <%             } catch (Exception e) {
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
        <%@page import="org.apache.log4j.Logger"%>
        <%logger.info("esta es la prueba."); %>
        <%logger.debug("Demostracion del mensaje");%>
        <%logger.warn("Show WARN message");%>
        <%logger.error("Show ERROR message");%>
        <%logger.fatal("Show FATAL message"); %>
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



<% }

%>