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
public class MensagemDO {
    // declaração de atributos
    private int _id_envia;
    private int _id_recebe;
    private String _titulo;
    private String _texto;
    private int _data;

    public int getEnvia() {
        return _id_envia;
    }

    public void setEnvia(int idEnvia ) {
        this._id_envia = idEnvia;
    }

    public int getRecebe() {
        return _id_recebe;
    }

    public void setRecebe(int idRecebe) {
        this._id_envia = idRecebe;
    }
    
    public String getTitulo() {
        return _titulo;
    }

    public void setTitulo(String titulo) {
        this._titulo = titulo;
    }

    public String getTexto() {
        return _texto;
    }

    public void setTexto(String texto) {
        this._texto = texto;
    }    
    
     public int getData() {
        return _data;
    }

    public void setData(int Data) {
        this._data = Data;
    }
}
