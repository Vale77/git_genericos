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
public class Cabecera {
    private int codigo_cabecera;
    private int codigo_matriz;
    private String Valor_cabecera;
    private int posicionX;
    private int posicionY;

    public Cabecera(int codigo_cabecera, int codigo_matriz, String Valor_cabecera, int posicionX, int posicionY) {
        this.codigo_cabecera = codigo_cabecera;
        this.codigo_matriz = codigo_matriz;
        this.Valor_cabecera = Valor_cabecera;
        this.posicionX = posicionX;
        this.posicionY = posicionY;
    }

    public int getCodigo_cabecera() {
        return codigo_cabecera;
    }

    public void setCodigo_cabecera(int codigo_cabecera) {
        this.codigo_cabecera = codigo_cabecera;
    }

    public int getCodigo_matriz() {
        return codigo_matriz;
    }

    public void setCodigo_matriz(int codigo_matriz) {
        this.codigo_matriz = codigo_matriz;
    }

    public String getValor_cabecera() {
        return Valor_cabecera;
    }

    public void setValor_cabecera(String Valor_cabecera) {
        this.Valor_cabecera = Valor_cabecera;
    }

    public int getPosicionX() {
        return posicionX;
    }

    public void setPosicionX(int posicionX) {
        this.posicionX = posicionX;
    }

    public int getPosicionY() {
        return posicionY;
    }

    public void setPosicionY(int posicionY) {
        this.posicionY = posicionY;
    }
    
}
