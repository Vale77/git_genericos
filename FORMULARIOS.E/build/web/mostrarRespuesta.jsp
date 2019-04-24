<%-- 
    Document   : mostrarFormulario
    Created on : 14-ene-2018, 21:55:20
    Author     : D4ve
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.LinkedList"%>
<%@page import="FORM.Formulario"%>
<%@page import="FORM.DB"%>
<%@page import="java.sql.Connection"%>
<%@page import="FORM.Usuario"%> <!-- import de Usuario -->
<%@page session="true" %> <!-- Se agrega a modo de validacion -->

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% Usuario currentUser = (Usuario) (session.getAttribute("currentSessionUser")); //Recibe el atributo de sesion del Servlet
/*Si el atributo es diferente de nulo muestra la pagina */
    if (currentUser != null) { %>
<head>
    <meta http-equiv="Content-Type" content="text/html" charset=UTF-8">
    <title>Mostrar-Formularios</title>
    <link href="css/bootstrap.min.css" rel="stylesheet"/>
    <%
        DB con = DB.getInstancia();
        Connection co = con.getConnection();
        LinkedList<Formulario> listaF = new LinkedList<Formulario>();
        ResultSet rs = co.prepareStatement("SELECT * FROM UTIC.UZGTFORMULARIOS ORDER BY codigo_UZGTFORMULARIOS ASC").executeQuery();
        while (rs.next()) {
            Formulario F = new Formulario();
            F.setCodigo_formulario(rs.getInt(1));
            F.setNombre_formulario(rs.getString(2));
            F.setDescripcion_formulario(rs.getString(3));
            F.setFecha_formulario(rs.getDate(4));
            F.setObjetivo_formulario(rs.getString(5));
            F.setBase_formulario(rs.getString(6));
            listaF.add(F);
        }
        rs.close();


    %>

</head>


<div class="row bg-default">
    <div class="col-md-2"><center><img src="Logo_ESPE.png"  WIDTH="160" HEIGHT="100"/></center></div>
    <div class="col-md-8"><center><h1>Gestión de Formularios</h1></center></div>
    <div class="col-md-2"></div>
</div>
<ul class="nav nav-tabs" role="tablist">
    <%                   out.print("<li role=\"presentation\" ><a href=\"NewForm.jsp\"><img src=\"n.png\"/> Nuevo Formulario</a></li>");
        out.print("<li role=\"presentation\"><a href=\"mostrarFormulario.jsp\"><img src=\"m.png\"/> Gestión Formulario</a></li>");
        out.print("<li role=\"presentation\"><a href=\"mostrarGRes.jsp?param=\"null\"><img src=\"pm.png\"/> Formularios Publicados</a></li>");
        out.print("<li role=\"presentation\"><a href=\"mostrarRespuesta.jsp\"><img src=\"a.png\"/> Mostrar Respuestas</a></li>");
    %>

    <%--<li role="presentation"><a  href="mostrarGRes.jsp" >Volver</a></li>--%>
</ul>
<form action="LoginServlet" method="POST">
    <div class="row">
        <div class="col-md-3"></div>

        <div class="col-md-3"></div>
    </div>
    <%
        for (int i = 0; i < listaF.size(); i++) {

            String cod = "";
            out.print("<form action=\"\" method=\"POST\" target=\"_self\" style=\"display:inline;\">");
            out.print("<div class=\"row\">");
            out.print("<div class=\"col-md-1\"></div>");
            out.print("<div class=\"col-md-2\"><center><p id=\"cod\">" + listaF.get(i).getCodigo_formulario() + "</p></center></div>");
            out.print("<div class=\"col-md-4\"><p name=\"nombre\">" + listaF.get(i).getNombre_formulario() + "</p></div>");
            out.print("<div class=\"col-md-4\"><button class=\"btn btn-default\" type=\"text\" name=\"Submit\" onclick=\"this.form.action='mostrarFormularioUsuario.jsp';this.form.submit();\" value='" + cod + listaF.get(i).getCodigo_formulario() + "'>Ver</button></div>");
            out.print("</div></form>");
            //out.print("<form action=\"publicarUsuario.jsp\" method=\"POST\" target=\"_self\" style=\"display: inline;\">");
            //out.print("<div class=\"row\">");
            //out.print("<div class=\"col-md-3\"><button class=\"btn btn-default\" type=\"text\" name=\"enviar\" value='"+cod+listaF.get(i).getCodigo_formulario()+"'>Publicar</button></div>");
            //out.print("</div></form>");
        }
        con.closeConexion();
        /*
        for(int i=0; i<listaF.size();i++)
        {
                            
            String cod = "";
            out.println("<form action=\"publicarUsuario.jsp\" method=\"POST\" target=\"_self\">");
            out.println("<div class=\"col-md-4\"><button class=\"btn btn-default\" type=\"text\" name=\"enviar\" value='"+cod+listaF.get(i).getCodigo_formulario()+"'>Publicar</button></div>");
            out.println("</div></form>");
        }*/

    %>
</form>  
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