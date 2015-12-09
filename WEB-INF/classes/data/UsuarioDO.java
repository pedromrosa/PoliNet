/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package data;

/**
 *
 * @author Pedro
 */
public class UsuarioDO
{
    // declaração de atributos
    private int _id;
    private String _nusp;
    private String _email;
    private String _nome;
    private String _sobrenome;
    private String _vinculo;
    private String _login;
    private String _senha;
    
    public int getId() {
        return _id;
    }

    public void setId(int id) {
        this._id = id;
    }
    
    public String getNusp() {
        return _nusp;
    }

    public void setNusp(String nusp) {
        this._nusp = nusp;
    }
    
    public String getEmail() {
        return _email;
    }

    public void setEmail(String mail) {
        this._email = mail;
    }
    
    public String getNome() {
        return _nome;
    }

    public void setNome(String nome) {
        this._nome = nome;
    }

    public String getSobrenome() {
        return _sobrenome;
    }

    public void setSobrenome(String sobrenome) {
        this._sobrenome = sobrenome;
    }

    public String getVinculo() {
        return _vinculo;
    }

    public void setVinculo(String vinculo) {
        this._vinculo = vinculo;
    }
    
    public String getLogin() {
        return _login;
    }

    public void setLogin(String login) {
        this._login = login;
    }
    
    public String getSenha() {
        return _senha;
    }

    public void setSenha(String senha) {
        this._senha = senha;
    }
}