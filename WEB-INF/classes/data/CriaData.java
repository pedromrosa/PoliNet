package data;

import java.sql.*;
import java.util.*;
import utils.Transacao;

public class CriaData{

  public void incluir(CriaDO cria, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into cria (id_professor, id_projeto) values (?, ?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, cria.getIdProf());
     ps.setInt(2, cria.getIdProjeto());
     int result = ps.executeUpdate();
  }

  public void excluirCria(int id_projeto, int id_professor, Transacao tr) throws Exception {
    Connection con = tr.obterConexao();
    String sql = "delete from cria where id_projeto=? and id_professor=?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setInt(1, id_projeto);
    ps.setInt(2, id_professor);
    int result = ps.executeUpdate();
    System.out.println("apagado com sucesso");
  } // excluir 

  public Vector procurar_projetos(int id_professor, Transacao tr) throws Exception {
    Connection con = tr.obterConexao();
    String sql = "select * from cria where id_professor=?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setInt(1, id_professor);
    ResultSet rs = ps.executeQuery();
    rs.next();
    Vector crias = new Vector();
    while (rs.next()) {
        CriaDO c = new CriaDO();
        c.setIdProf (rs.getInt("id_professor"));
        c.setIdProjeto (rs.getInt("id_projeto"));
        crias.add(c);
    }
    return crias;
  } // procurar_alunos

  public Vector procurar_professores(int id_projeto, Transacao tr) throws Exception {
    Connection con = tr.obterConexao();
    String sql = "select * from cria where id_projeto=?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setInt(1, id_projeto);
    ResultSet rs = ps.executeQuery();
    rs.next();
    Vector professores = new Vector();
    while (rs.next()) {
        CriaDO c = new CriaDO();
        c.setIdProf (rs.getInt("id_professor"));
        c.setIdProjeto (rs.getInt("id_projeto"));
        professores.add(c);
    }
    return professores;
  } // procurar_projetos
  
} // CandidataData