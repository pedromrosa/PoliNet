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
public class CriaDO{
    // declaração de atributos
    private int _id_professor;
    private int _id_projeto;

    public int getIdProf() {
        return _id_professor;
    }

    public void setIdProf(int idprof) {
        this._id_professor = idprof;
    }

    public int getIdProjeto() {
        return _id_projeto;
    }

    public void setIdProjeto(int idproj) {
        this._id_projeto = idproj;
    }
}
