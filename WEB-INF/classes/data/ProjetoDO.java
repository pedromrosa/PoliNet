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
public class ProjetoDO {
    // declaração de atributos
    // os nomes tem que ser iguais que os nomes dos elementos de INPUT 
    // criados no formulário em index.jsp
    private int _id;
    private String _titulo;
    private String _descricao;
    private String _keyword1;
    private String _keyword2;
    private String _keyword3;
    private int _sem_ini;
    private int _sem_fim;
    private int _id_lab;
    private String _patrocinador;

    public int getId() {
        return _id;
    }

    public void setId(int id) {
        this._id = id;
    }
    
    public String getTitulo() {
        return _titulo;
    }

    public void setTitulo(String titulo) {
        this._titulo = titulo;
    }

    public String getDescricao() {
        return _descricao;
    }

    public void setDescricao(String descricao) {
        this._descricao = descricao;
    }

    public String getKW1() {
        return _keyword1;
    }

    public void setKW1(String keyword1) {
        this._keyword1 = keyword1;
    }

    public String getKW2() {
        return _keyword2;
    }

    public void setKW2(String keyword2) {
        this._keyword2 = keyword2;
    }

    public String getKW3() {
        return _keyword3;
    }

    public void setKW3(String keyword3) {
        this._keyword3 = keyword3;
    }

    public int getInicio() {
        return _sem_ini;
    }

    public void setInicio(int sem_ini) {
        this._sem_ini = sem_ini;
    }

    public int getFim() {
        return _sem_fim;
    }

    public void setFim(int sem_fim) {
        this._sem_fim = sem_fim;
    }

    public int getLab() {
        return _id_lab;
    }

    public void setLab(int id_lab) {
        this._id_lab = id_lab;
    }

    public String getPatrocinador() {
        return _patrocinador;
    }

    public void setPatrocinador(String patrocinador) {
        this._patrocinador = patrocinador;
    }
}