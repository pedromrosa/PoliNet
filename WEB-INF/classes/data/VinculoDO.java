/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data;

/**
 *
 * @author Gregorio
 */
public class VinculoDO {
    // declaração de atributos

    private int _id_professor;
    private int _id_aluno;
    private int _id_projeto;
    private int _id_assistente;
    private int _id_lab;

    public int getIdProfessor() {
        return _id_professor;
    }

    public void setIdProfessor(int id_professor) {
        this._id_professor = id_professor;
    }
    
    public int getIdAluno() {
        return _id_aluno;
    }

    public void setIdAluno(int id_aluno) {
        this._id_aluno = id_aluno;
    }

    public int getIdProjeto() {
        return _id_projeto;
    }

    public void setIdProjeto(int id_projeto) {
        this._id_projeto = id_projeto;
    }

    public int getIdAssistente() {
        return _id_assistente;
    }

    public void setIdAssistente(int id_assistente) {
        this._id_assistente = id_assistente;
    }

    public int getIdLab() {
        return _id_lab;
    }

    public void setIdLab(int id_lab) {
        this._id_lab = id_lab;
    }    
}
