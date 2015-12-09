/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data;

/**
 *
 * @author Pedro
 */
public class PertenceDO{
    // declaração de atributos
    private int _id_assistente;
    private int _id_lab;

    public int getIdAssis() {
        return _id_assistente;
    }

    public void setIdAssis(int idassis) {
        this._id_assistente = idassis;
    }

    public int getIdLab() {
        return _id_lab;
    }

    public void setIdLab(int idlab) {
        this._id_lab = idlab;
    }
}
