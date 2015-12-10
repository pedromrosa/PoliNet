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
public class MantemDO{
    // declaração de atributos
    private int _id_professor;
    private int _id_lab;

    public int getIdProf() {
        return _id_professor;
    }

    public void setIdProf(int idprof) {
        this._id_professor = idprof;
    }

    public int getIdLab() {
        return _id_lab;
    }

    public void setIdLab(int idlab) {
        this._id_lab = idlab;
    }
}
