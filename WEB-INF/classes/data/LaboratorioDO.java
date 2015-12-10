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
public class LaboratorioDO {
    // declaração de atributos
    private int _id;
    private String _nome;
    private String _departamento;
    private String _descricao;
    private String _link_site;
    
    public int getId() {
        return _id;
    }

    public void setId(int id) {
        this._id = id;
    }
    
    public String getNome() {
        return _nome;
    }

    public void setNome(String nome) {
        this._nome = nome;
    }

    public String getDepartamento() {
        return _departamento;
    }

    public void setDepartamento(String departamento) {
        this._departamento = departamento;
    }

    public String getDescricao() {
        return _descricao;
    }

    public void setDescricao(String descricao) {
        this._descricao = descricao;
    }

    public String getSite() {
        return _link_site;
    }

    public void setSite(String link_site) {
        this._link_site = link_site;
    }
}
