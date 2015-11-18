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
public class AlunoDO extends UsuarioDO{
    // declaração de atributos
    private String _codigo_CV;
    private String _codigo_Hist;
    private String _cvlattes;
    private String _instituicao;

    public String getCv() {
        return _codigo_CV;
    }

    public void setCv(String codigoCV) {
        this._codigo_CV = codigoCV;
    }

    public String getHist() {
        return _codigo_Hist;
    }

    public void setHist(String linkHist) {
        this._codigo_Hist = linkHist;
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
