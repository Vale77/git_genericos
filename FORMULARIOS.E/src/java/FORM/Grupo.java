/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FORM;

/**
 *
 * @author david
 */
public class Grupo {
    private int Codigo_formulario;
    private int Codigo_grupo;
    private String Nombre_grupo;
    private String Descripcion_grupo;

    public int getCodigo_formulario() {
        return Codigo_formulario;
    }

    public void setCodigo_formulario(int Codigo_formulario) {
        this.Codigo_formulario = Codigo_formulario;
    }

    public int getCodigo_grupo() {
        return Codigo_grupo;
    }

    public void setCodigo_grupo(int Codigo_grupo) {
        this.Codigo_grupo = Codigo_grupo;
    }

    public String getNombre_grupo() {
        return Nombre_grupo;
    }

    public void setNombre_grupo(String Nombre_grupo) {
        this.Nombre_grupo = Nombre_grupo;
    }

    public String getDescripcion_grupo() {
        return Descripcion_grupo;
    }

    public void setDescripcion_grupo(String Descripcion_grupo) {
        this.Descripcion_grupo = Descripcion_grupo;
    }
    
}
