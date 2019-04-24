/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FORM;

/**
 *
 * @author D4ve
 */
public class Usuario {
    
     private int PIDM;
     private String nombreUsuario;
     private String estLn;
     private int aux;

    public String getEstLn() {
        return estLn;
    }

    public void setEstLn(String estLn) {
        this.estLn = estLn;
    }

     
    /**
     * @return the PIDM
     */
    public int getPIDM() {
        return PIDM;
    }

    /**
     * @param PIDM the PIDM to set
     */
    public void setPIDM(int PIDM) {
        this.PIDM = PIDM;
    }

    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }
    
    
}
