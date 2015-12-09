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
public class CandidataDO{
    // declaração de atributos
    private int _id_aluno;
    private int _id_projeto;

    public int getIdAluno() {
        return _id_aluno;
    }

    public void setIdAluno(int idaluno) {
        this._id_aluno = idaluno;
    }

    public int getIdProjeto() {
        return _id_projeto;
    }

    public void setIdProjeto(int idproj) {
        this._id_projeto = idproj;
    }
}
