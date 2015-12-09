/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data;

import java.sql.*;
import java.util.*;
import utils.Transacao;

public class VinculoData {

  public void incluir(VinculoDO vinculo, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into vincula (id_professor, id_aluno, id_projeto, id_assistente, id_lab) values (?, ?, ?, ?, ?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, vinculo.getIdProfessor());
     ps.setInt(2, vinculo.getIdAluno());
     ps.setInt(3, vinculo.getIdProjeto());
     ps.setInt(4, vinculo.getIdAssistente());
     ps.setInt(5, vinculo.getIdLab());
     int result = ps.executeUpdate();
  }//incluir

  
 //------------------FALTA IMPLEMENTAR--------------------
 // Usar combinação de IDs para excluir uma linha da tabela "vincula"
  public void excluir(VinculoDO vinculo, Transacao tr) throws Exception {
     excluir(vinculo.getIdProjeto(), tr);
  } // excluir

  public void excluir (int idobj, Transacao tr) throws Exception {
 } // excluir 

  
  //-----------------FALTA IMPLEMENTAR--------------------
  //A atuaização está baseada em um único ID; alterar para combinação de IDs desejada
  public void atualizar(VinculoDO vinculo, Transacao tr) throws Exception {
    Connection con = tr.obterConexao();
    String sql = "update vincula set id_professor=?,id_aluno=?,id_projeto=?,id_assistente=?,id_lab=? where id=?";
    PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, vinculo.getIdProfessor());
     ps.setInt(2, vinculo.getIdAluno());
     ps.setInt(3, vinculo.getIdProjeto());
     ps.setInt(4, vinculo.getIdAssistente());
     ps.setInt(5, vinculo.getIdLab());
    int result = ps.executeUpdate();
  } // atualizar

    //-----------------FALTA IMPLEMENTAR--------------------
  //A busca está baseada em um único ID; alterar para combinação de IDs desejada
  public VinculoDO buscar(int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from vincula where id=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idobj);
     ResultSet rs = ps.executeQuery();
     rs.next();
     VinculoDO vinculo = new VinculoDO();
     vinculo.setIdProfessor (rs.getInt("id_professor"));
     vinculo.setIdAluno (rs.getInt("id_aluno"));
     vinculo.setIdProjeto (rs.getInt("id_projeto"));
     vinculo.setIdAssistente (rs.getInt("id_assistente"));
     vinculo.setIdLab (rs.getInt("id_lab"));
     return vinculo;
  } // buscar


  public Vector buscarPorUserId(int idobj, Transacao tr) throws Exception {  
     Connection con = tr.obterConexao();
     String sql = "select * from vincula where id_professor=? OR id_aluno=? OR id_assistente=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idobj);
     ps.setInt(2, idobj);
     ps.setInt(3, idobj);
     ResultSet rs = ps.executeQuery();
     System.out.println("query executada");
     Vector vinculos = new Vector();
     while (rs.next()) {
        VinculoDO v = new VinculoDO();
        v.setIdProfessor (rs.getInt("id_professor"));
        v.setIdAluno(rs.getInt("id_aluno"));
        v.setIdProjeto(rs.getInt("id_projeto"));
        v.setIdAssistente(rs.getInt("id_assistente"));
        v.setIdLab(rs.getInt("id_lab"));

        vinculos.add(v);
     }
     return vinculos;
  }

} // VinculoData