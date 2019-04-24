<%-- 
    Document   : modificado.jsp
    Created on : 08/01/2018, 10:10:01
    Author     : DIEGOPC
--%>

<%@page import="FORM.Valores"%>
<%@page import="FORM.TipoPreguntas"%>
<%@page import="FORM.Preguntas"%>
<%@page import="FORM.Grupo"%>
<%@page import="FORM.Formulario"%>
<%@page import="java.util.LinkedList"%>
<%@page import="FORM.Matriz"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="FORM.Cabecera"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="FORM.DB"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Modificación-Formularios</title>
        <link href="css/bootstrap.min.css" rel="stylesheet"/>
        <%

            DB con = DB.getInstancia();
            Connection co = con.getConnection();
            LinkedList<Formulario> listaF = new LinkedList<Formulario>();
            LinkedList<Grupo> listaG = new LinkedList<Grupo>();
            LinkedList<Preguntas> listaP = new LinkedList<Preguntas>();
            LinkedList<TipoPreguntas> listaTP = new LinkedList<TipoPreguntas>();
            LinkedList<Valores> listaV = new LinkedList<Valores>();
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
                listaF.add(F);
            }
            rs.close();
            rs = co.prepareStatement("SELECT * FROM UTIC.UZGTGRUPO WHERE codigo_UZGTFORMULARIOS = '" + Cod + "' order by codigo_UZGTGRUPO ASC").executeQuery();
            while (rs.next()) {
                Grupo G = new Grupo();
                G.setCodigo_formulario(rs.getInt(1));
                G.setCodigo_grupo(rs.getInt(2));
                G.setNombre_grupo(rs.getString(3));
                G.setDescripcion_grupo(rs.getString(4));
                listaG.add(G);
            }
            rs.close();
            rs = co.prepareStatement("SELECT * FROM UTIC.UZGTPREGUNTAS WHERE codigo_UZGTFORMULARIOS = '" + Cod + "' order by codigo_UZGTPREGUNTAS ASC").executeQuery();
            while (rs.next()) {
                Preguntas P = new Preguntas();
                P.setCodigo_formulario(rs.getInt(1));
                P.setCodigo_grupo(rs.getInt(2));
                P.setCodigo_preguntas(rs.getInt(3));
                P.setCodigo_tipo_pregunta(rs.getInt(7));
                P.setLabel_pregunta(rs.getString(8));
                listaP.add(P);
            }
            rs.close();
            rs = co.prepareStatement("SELECT * FROM UTIC.UZGTVALORES WHERE codigo_UZGTFORMULARIOS = '" + Cod + "' order by codigo_UZGTVALORES").executeQuery();
            while (rs.next()) {
                Valores Val = new Valores();
                Val.setCodigo_Valores(rs.getInt(1));
                Val.setCodig_Formularios(rs.getInt(2));
                Val.setCodigo_Grupo(rs.getInt(3));
                Val.setCodigo_Preguntas(rs.getInt(4));
                Val.setValores(rs.getString(5));
                listaV.add(Val);
            }
            rs.close();
        %>
    </head>
    <body><%@page import="org.apache.log4j.Logger"%>
        <%! static Logger logger = Logger.getLogger("bitacora.subnivel.Control");%>
        <%logger.info("esta es la prueba."); %>
        <%logger.debug("Demostracion del mensaje");%>
        <%logger.warn("Show WARN message");%>
        <%logger.error("Show ERROR message");%>
        <%logger.fatal("Show FATAL message"); %>
        <div class="row bg-default">
            <div class="col-md-2"><center><img src="espelogo.jpg"/></center></div>
            <div class="col-md-8"><center><h1>Formularios Genericos</h1></center></div>
            <div class="col-md-2"></div>
        </div>
        <ul class="nav nav-tabs" role="tablist">
            <li role="presentation" ><a href="nuevoFormulario.html">Nuevo Formulario</a></li>
            <li role="presentation"><a href="mostrarFormulario.jsp">Mostrar Formulario</a></li>
            <li role="presentation"><a href="modificarFormulario.jsp">Modificar Formulario</a></li>
            <li role="presentation"><a href="eliminarFormulario.jsp">Eliminar Formulario</a></li>
            <li role="presentation"><a href="index.jsp">Volver</a></li>
        </ul>
        <div class="container">
            <%
                request.setCharacterEncoding("UTF-8");
                out.println("<div class=\"row\">");
                out.println("<div class=\"col-md-3\"></div>");
                out.println("<input type=\"text\" class=\"col-md-6 panel panel-info panel-heading\"  value=" + "\"" + request.getParameter("nombreF") + "\" name=\"nombF\"/>");
                out.println("</div>");

                String nombre = "";
                try {
                    request.setCharacterEncoding("UTF-8");
                    //nombre=request.getParameter("nombF");
                    co.prepareStatement("UPDATE UTIC.UZGTFORMULARIOS SET UZGTFORMULARIOS_nombre='" + request.getParameter("nombreF") + "' WHERE codigo_UZGTFORMULARIOS =" + listaF.getFirst().getCodigo_formulario()).executeUpdate();
                    //out.println("Formulario modificado.");

                } catch (SQLException ex) {
                    //out.println("Formulario no modificado");
                }

                for (int i = 0; i < listaG.size(); i++) {
                    out.println("<div class=\"row \">");
                    out.println("<div class=\"col-md-3\"></div>");
                    out.println("<input class=\"col-md-6 panel panel-info panel-heading\"  value=" + "\"" + listaG.get(i).getNombre_grupo() + "\"/>");
                    out.println("<div class=\"col-md-3\"></div>");
                    out.println("</div>");

                    for (int j = 0; j < listaP.size(); j++) {
                        if (listaP.get(j).getCodigo_grupo() == listaG.get(i).getCodigo_grupo()) {
                            out.println("<div class=\"row\">");
                            out.println("<div class=\"col-md-3\"></div>");
                            out.println("<input class=\"col-md-6 panel panel-info panel-heading\"  value=" + "\"" + listaP.get(j).getLabel_pregunta() + "\"/></br>");
                            if (listaP.get(j).getCodigo_tipo_pregunta() == 1) {
                                //out.println("</br><div class=\"col-md-3\"><input id=\"valor\" type=\"text\" name=\"valor\" class=\"form-control\"/></div>");
                                out.println("</br><div class=\"col-md-3\"></div></br>");
                                out.println("</div>");
                            }

                            if (listaP.get(j).getCodigo_tipo_pregunta() == 2) {
                                out.println("</div>");
                                for (int k = 0; k < listaV.size(); k++) {
                                    if (listaV.get(k).getCodigo_Preguntas() == listaP.get(j).getCodigo_preguntas()) {
                                        out.println("<div class=\"row\">");
                                        out.println("<div class=\"col-md-3\"></div>");
                                        out.println("<div class=\"col-md-3\"><label><input type=\"checkbox\" name=\"Seleccion\">" + listaV.get(k).getValores() + "</input></label></div>");
                                        out.println("<div class=\"col-md-3\"></div>");
                                        out.println("<div class=\"col-md-3\"></div>");
                                        out.println("</div>");
                                    }
                                }
                            }
                            if (listaP.get(j).getCodigo_tipo_pregunta() == 3) {
                                out.println("</div>");
                                for (int k = 0; k < listaV.size(); k++) {
                                    if (listaV.get(k).getCodigo_Preguntas() == listaP.get(j).getCodigo_preguntas()) {
                                        out.println("<div class=\"row\">");
                                        out.println("<div class=\"col-md-3\"></div>");
                                        out.println("<div class=\"col-md-3\"><input type=\"radio\" name=\"seleccion\">" + listaV.get(k).getValores() + "</input></div>");
                                        out.println("<div class=\"col-md-3\"></div>");
                                        out.println("<div class=\"col-md-3\"></div>");
                                        out.println("</div>");
                                    }
                                }
                            }
                            if (listaP.get(j).getCodigo_tipo_pregunta() == 5) {
                                out.println("</div>");
                                out.println("<div class=\"row\">");
                                out.println("<div class=\"col-md-3\"></div>");
                                out.println("<div class=\"col-md-3\"><select type=\"text\" name=\"lista\">");
                                for (int k = 0; k < listaV.size(); k++) {
                                    if (listaV.get(k).getCodigo_Preguntas() == listaP.get(j).getCodigo_preguntas()) {

                                        out.println("<option>" + listaV.get(k).getValores() + "</option>");

                                    }
                                }
                                out.println("</select></div>");
                                out.println("</div>");
                            }
                            if (listaP.get(j).getCodigo_tipo_pregunta() == 4) {
                                out.println("</div>");
                                out.println("<div class=\"row\">");
                                out.println("<div class=\"col-md-3\"></div>");
                                ResultSet rs2 = co.prepareStatement("SELECT * FROM UTIC.UZGTMATRIZ WHERE codigo_UZGTPREGUNTAS = '" + listaP.get(j).getCodigo_preguntas() + "'order by codigo_uzgtmatriz ASC").executeQuery();
                                LinkedList<Matriz> ListaMatriz = new LinkedList<Matriz>();
                                LinkedList<Cabecera> ListaCabeceras = new LinkedList<Cabecera>();
                                while (rs2.next()) {
                                    Matriz Mat = new Matriz(rs2.getInt(1), rs2.getInt(2), rs2.getInt(3), rs2.getInt(4), rs2.getInt(5), rs2.getInt(6), rs2.getString(7));
                                    ListaMatriz.add(Mat);
                                }
                                rs2.close();
                                int mat = ListaMatriz.getFirst().getCodigo_matriz();
                                int filas = ListaMatriz.getFirst().getFila() + 1;
                                int columnas = ListaMatriz.getFirst().getColumna() + 1;
                                ResultSet rs3 = co.prepareStatement("SELECT * FROM UTIC.UZGTCABECERAS WHERE codigo_UZGTMATRIZ = '" + mat + "' order by codigo_uzgtcabezera ASC").executeQuery();
                                while (rs3.next()) {
                                    Cabecera Cab = new Cabecera(rs3.getInt(1), rs3.getInt(2), rs3.getString(3), rs3.getInt(4), rs3.getInt(5));
                                    ListaCabeceras.add(Cab);
                                }
                                rs3.close();
                                out.println("<div class=\"col-md-6 table-responsive\"><table class=\"table table-bordered\">");
                                int puntero = 0;
                                for (int n = 0; n < filas; n++) {
                                    out.println("<tr>");
                                    for (int m = 0; m < columnas; m++) {

                                        if (puntero < ListaCabeceras.size() && ListaCabeceras.get(puntero).getPosicionX() == n && ListaCabeceras.get(puntero).getPosicionY() == m) {
                                            out.println("<th>" + ListaCabeceras.get(puntero).getValor_cabecera() + "</th>");
                                            puntero++;
                                        } else {
                                            out.println("<td><input type=\"text\" name=\"Texto\" placeholder=\"Texto\"'></td>");
                                        }
                                    }
                                    out.println("</tr>");
                                }
                                out.println("</table></div>");
                                out.println("</div>");
                            }
                        }
                    }
                }
                //modifcar grupos
                for (int i = 0; i < listaG.size(); i++) {

                    try {
                        request.setCharacterEncoding("UTF-8");
                        String num = "nomG" + i;

                        //nombre=request.getParameter("nombF");
                        co.prepareStatement("UPDATE UTIC.UZGTGRUPO SET UZGTGRUPO_nombre='" + request.getParameter(num) + "' WHERE codigo_UZGTFORMULARIOS =" + listaF.getFirst().getCodigo_formulario() + "AND codigo_UZGTGRUPO=" + listaG.get(i).getCodigo_grupo()).executeUpdate();
                        //out.println("Grupo modificado."+num);

                    } catch (SQLException ex) {
                        //out.println("Grupo no modificado");
                    }
                    ////////////////////////////////////////////////////////////////////////////////////
                    //////////////////////PREGUNTAS/////////////////////////////////////////////////////
                    for (int j = 0; j < listaP.size(); j++) {
                        if (listaP.get(j).getCodigo_grupo() == listaG.get(i).getCodigo_grupo()) {
                            try {
                                request.setCharacterEncoding("UTF-8");

                                String num = "nomP" + j;

                                //nombre=request.getParameter("nombF");
                                co.prepareStatement("UPDATE UTIC.UZGTPREGUNTAS SET UZGTPREGUNTAS_pregunta='" + request.getParameter(num) + "WHERE codigo_UZGTFORMULARIOS=" + listaP.get(j).getCodigo_formulario() + "' AND  codigo_UZGTGRUPO=" + listaP.get(j).getCodigo_grupo() + "AND codigo_UZGTPREGUNTAS=" + listaP.get(j).getCodigo_preguntas()).executeUpdate();
                                //out.println("Pregunta modificado."+num);

                            } catch (SQLException ex) {
                                //out.println("Pregunta no modificado");
                            }
                            /////////////////////////////////////////////////////////////////////////////////////////////
                            ////////////////////CHECKBOX/////////////////////////////////////////////////////////////////
                            if (listaP.get(j).getCodigo_tipo_pregunta() == 2) {
                                for (int k = 0; k < listaV.size(); k++) {
                                    if (listaV.get(k).getCodigo_Preguntas() == listaP.get(j).getCodigo_preguntas()) {
                                        try {
                                            request.setCharacterEncoding("UTF-8");

                                            String num = "Seleccion" + j;

                                            //nombre=request.getParameter("nombF");
                                            co.prepareStatement("UPDATE UTIC.UZGTVALORES SET UZGTTIPOPREGUNTAS_valor='" + request.getParameter(num) + "' WHERE codigo_UZGTFORMULARIOS =" + listaF.getFirst().getCodigo_formulario() + "AND codigo_UZGTGRUPO=" + listaG.get(i).getCodigo_grupo() + "AND codigo_UZGTPREGUNTAS=" + listaP.get(j).getCodigo_preguntas() + "AND codigo_UZGTVALORES=" + listaV.get(j).getCodigo_Valores()).executeUpdate();
                                            out.println("Check modificado." + num);

                                        } catch (SQLException ex) {
                                            out.println("Check no modificado");
                                        }
                                    }
                                }
                            }
                        }
                    }

                }
                //modificar preguntas

                //nuevo codigo para modificar el nombre del Formulario
                con.closeConexion();
            %>
        </div>
    </body>
</html>
