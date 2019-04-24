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
public class Matriz {
    private int codigo_matriz;
    private int codigo_formulario;
    private int codigo_grupo;
    private int codigo_pregunta;
    private int columna;
    private int fila;
    private String Descripcion;

    public Matriz(int codigo_matriz, int codigo_formulario, int codigo_grupo, int codigo_pregunta, int columna, int fila, String Descripcion) {
        this.codigo_matriz = codigo_matriz;
        this.codigo_formulario = codigo_formulario;
        this.codigo_grupo = codigo_grupo;
        this.codigo_pregunta = codigo_pregunta;
        this.columna = columna;
        this.fila = fila;
        this.Descripcion = Descripcion;
    }

    public int getCodigo_matriz() {
        return codigo_matriz;
    }

    public void setCodigo_matriz(int codigo_matriz) {
        this.codigo_matriz = codigo_matriz;
    }

    public int getCodigo_formulario() {
        return codigo_formulario;
    }

    public void setCodigo_formulario(int codigo_formulario) {
        this.codigo_formulario = codigo_formulario;
    }

    public int getCodigo_grupo() {
        return codigo_grupo;
    }

    public void setCodigo_grupo(int codigo_grupo) {
        this.codigo_grupo = codigo_grupo;
    }

    public int getCodigo_pregunta() {
        return codigo_pregunta;
    }

    public void setCodigo_pregunta(int codigo_pregunta) {
        this.codigo_pregunta = codigo_pregunta;
    }

    public int getColumna() {
        return columna;
    }

    public void setColumna(int columna) {
        this.columna = columna;
    }

    public int getFila() {
        return fila;
    }

    public void setFila(int fila) {
        this.fila = fila;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }
    
    
}
