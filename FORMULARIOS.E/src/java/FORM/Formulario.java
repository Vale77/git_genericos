/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FORM;

import java.sql.Date;

/**
 *
 * @author david
 */
public class Formulario {
    private int Codigo_formulario;
    private String Nombre_formulario;
    private String Descripcion_formulario;
    private Date Fecha_formulario;
    private String Objetivo_formulario;
    private String Base_formulario;
    private String tipoFormulario;
    private int estadoPublicacion;
    private String queryP;

    public String getQueryP() {
        return queryP;
    }

    public void setQueryP(String queryP) {
        this.queryP = queryP;
    }
    
    public int getEstadoPublicacion() {
        return estadoPublicacion;
    }

    public void setEstadoPublicacion(int estadoPublicacion) {
        this.estadoPublicacion = estadoPublicacion;
    }

    public String getTipoFormulario() {
        return tipoFormulario;
    }

    public void setTipoFormulario(String tipoFormulario) {
        this.tipoFormulario = tipoFormulario;
    }
    
    

    public int getCodigo_formulario() {
        return Codigo_formulario;
    }

    public void setCodigo_formulario(int Codigo_formulario) {
        this.Codigo_formulario = Codigo_formulario;
    }

    public String getNombre_formulario() {
        return Nombre_formulario;
    }

    public void setNombre_formulario(String Nombre_formulario) {
        this.Nombre_formulario = Nombre_formulario;
    }

    public String getDescripcion_formulario() {
        return Descripcion_formulario;
    }

    public void setDescripcion_formulario(String Descripcion_formulario) {
        this.Descripcion_formulario = Descripcion_formulario;
    }

    public Date getFecha_formulario() {
        return Fecha_formulario;
    }

    public void setFecha_formulario(Date Fecha_formulario) {
        this.Fecha_formulario = Fecha_formulario;
    }

    public String getObjetivo_formulario() {
        return Objetivo_formulario;
    }

    public void setObjetivo_formulario(String Objetivo_formulario) {
        this.Objetivo_formulario = Objetivo_formulario;
    }

    public String getBase_formulario() {
        return Base_formulario;
    }

    public void setBase_formulario(String Base_formulario) {
        this.Base_formulario = Base_formulario;
    }
}
