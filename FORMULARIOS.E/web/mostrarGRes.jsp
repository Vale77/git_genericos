<%-- 
    Document   : mostrarFormulario
    Created on : 14-ene-2018, 21:55:20
    Author     : D4ve
--%>

<%@page import="FORM.Usuario"%>
<%@page import="FORM.DB2"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.LinkedList"%>
<%@page import="FORM.Formulario"%>
<%@page import="FORM.DB"%>
<%@page import="java.sql.Connection"%>
<%@page import="Decrypt.DecryptSmAtrix"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.util.logging.Logger"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>  
    <head>
        <meta http-equiv="Content-Type" content="text/html" charset=UTF-8">
        <title>Mostrar-Formularios</title>
        <link href="css/bootstrap.min.css" rel="stylesheet"/>

        <%
            Usuario currentUser = (Usuario) (session.getAttribute("currentSessionUser"));
            Logger LOGGER = Logger.getLogger("bitacora.subnivel.Control");

            // int PIDMget = 0;
            int PIDMget = 303921;
            //String param = "bccd67a1d7973a4109ab65c82680c115";

            try {
                DecryptSmAtrix dec = new DecryptSmAtrix();
                String id = request.getParameter("param");
                //String id = "L00001826";

                LOGGER.log(Level.INFO, "MOSTRAR GRES ID: ", id);
                if (id.length() > 0) {
                    //JOptionPane.showMessageDialog(null, "entro al if");   
                    id = new String(dec.decrypt(id));

                    LOGGER.log(Level.INFO, "MOSTRAR GRES ID: ", id);
                    DB2 conn = DB2.getInstancia();
                    Connection coo = conn.getConnection();

                    // JOptionPane.showMessageDialog(null, "PIDM: "+user.getPIDM());
                    ResultSet res = coo.prepareStatement("SELECT DISTINCT SPRIDEN_PIDM as estPIDM FROM SPRIDEN WHERE SPRIDEN.SPRIDEN_ID = '" + id + "' AND SPRIDEN.SPRIDEN_CHANGE_IND IS NULL").executeQuery();
                    LOGGER.log(Level.INFO, "MOSTRAR GRES res: ", res);
                    if (res.next()) {
                        LOGGER.log(Level.INFO, "MOSTRAR GRES res: ", res);
                        PIDMget = res.getInt(1);
                    }
                } else {

                    PIDMget = currentUser.getPIDM();
                    LOGGER.log(Level.INFO, "MOSTRAR GRES PIDMget:  ", PIDMget);

                }
            } catch (Exception e) {
                LOGGER.log(Level.WARNING, "MOSTRAR GRES ", e);

            }

            // JOptionPane.showMessageDialog(null, "PIDM: "+PIDMget);
        %>
    </head>
    <body> 
        <%LOGGER.info("esta es la prueba."); %>


        <%             try {

        %>
        <div class="row bg-default">
            <div class="col-md-2"><center><img src="Logo_ESPE.png"  WIDTH="160" HEIGHT="100"/></center></div>
            <div class="col-md-2"></div>
        </div>

        <ul class="nav nav-tabs" role="tablist">

        </ul>
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6"><center><h4 class="text alert alert-info">Usted debe llenar los siguientes formularios</h4></center></div>
            <div class="col-md-3"></div>
        </div>
        <div class="container-fluid">
            <div class="row">
                <div><center><h5 class="text alert alert-info">Los formularios se pueden llenar una sola vez, después deberá guardar e imprimir inmediatamente, ya que luego no tendrá opción de cambiar o volver a imprimir.</h5></center></div>
            </div>
        </div>

        <%  DB con = DB.getInstancia();
            Connection co = con.getConnection();

            LinkedList<Integer> codForms = new LinkedList<Integer>();
            ResultSet resu = co.prepareStatement("select p.codigo_uzgtformularios from UTIC.UZGTFORMULARIO_PERSONA p,UTIC.UZGTFORMULARIOS f where p.spriden_pidm =" + PIDMget + "and p.codigo_uzgtformularios = f.codigo_uzgtformularios and ( p.uzgtformularios_estado_llenado ='N' or f.uzgtformularios_estado_llenado ='S' or f.uzgtformularios_estado_llenado ='M' )  ORDER BY codigo_UZGTFORMULARIOS ASC").executeQuery();
            while (resu.next()) {
                Integer codForm = resu.getInt(1);
                codForms.add(codForm);
            }
            resu.close();
            LinkedList<Formulario> listaF = new LinkedList<Formulario>();
            for (int i = 0; i < codForms.size(); i++) {
                ResultSet rs = co.prepareStatement("SELECT * FROM UTIC.UZGTFORMULARIOS where UZGTFORMULARIOS_ESTADO = 1 AND codigo_uzgtFormularios=" + codForms.get(i) + " ORDER BY codigo_UZGTFORMULARIOS ASC").executeQuery();
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
            }

            for (int i = 0; i < listaF.size(); i++) {

                String cod = "";
                out.print("<form action=\"mostrarForm.jsp\" method=\"POST\" target=\"_self\" style=\"display:inline;\">");
                out.print("<div class=\"row\">");
                out.print("<div class=\"col-md-1\"></div>");
                out.print("<div class=\"col-md-2\"><center><p id=\"cod\">" + listaF.get(i).getCodigo_formulario() + "</p></center></div>");
                out.print("<div class=\"col-md-4\"><p name=\"nombre\">" + listaF.get(i).getNombre_formulario() + "</p></div>");
                out.print("<input type=\"hidden\" name= \"param\" value=\"" + PIDMget + "\" >");
                out.print("<div class=\"col-md-4\"><button class=\"btn btn-default\" type=\"text\" name=\"Submit\" onclick=\"this.form.action='mostrarForm.jsp';this.form.submit();\" value='" + cod + listaF.get(i).getCodigo_formulario() + "'>Llenar</button></div>");

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
        <%             } catch (Exception e) {
                System.out.println("error." + e.getMessage());

            }
        %>
    </body>
</html>

