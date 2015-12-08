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
public class AssistenteDO extends UsuarioDO {
    // declaração de atributos
    private String _departamento;
    private String _laboratorio;
    private String _cvlattes;
    private String _instituicao;
    
    public String getDepartamento() {
        return _departamento;
    }

    public void setDepartamento(String departamento) {
        this._departamento = departamento;
    }

    public String getLaboratorio() {
        return _laboratorio;
    }

    public void setLaboratorio(String laboratorio) {
        this._laboratorio = laboratorio;
    }    
    
    public String getInstituicao() {
        return _instituicao;
    }

    public void setInstituicao(String instituicao) {
        this._instituicao = instituicao;
    }

    public String getLattes() {
        return _cvlattes;
    }

    public void setLattes(String cvlattes) {
        this._cvlattes = cvlattes;
    }    
}
