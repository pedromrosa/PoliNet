package data;

import java.sql.*;
import java.util.*;
import utils.Transacao;

public class CandidataData{

  public void incluir(CandidataDO candidata, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into candidata (id_aluno, id_projeto) values (?, ?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, candidata.getIdAluno());
     ps.setInt(2, candidata.getIdProjeto());
     int result = ps.executeUpdate();
  }

  public void excluir(int id_aluno, Transacao tr) throws Exception {
    Connection con = tr.obterConexao();
    String sql = "delete from candidata where id_aluno=?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setInt(1, id_aluno);
    int result = ps.executeUpdate();
    System.out.println("apagado com sucesso");
  } // excluir 

  public Vector procurar_alunos(int id_projeto, Transacao tr) throws Exception {
    Connection con = tr.obterConexao();
    String sql = "select * from candidata where id_projeto=?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setInt(1, id_projeto);
    ResultSet rs = ps.executeQuery();
    rs.next();
    Vector candidatos = new Vector();
    while (rs.next()) {
        CandidataDO c = new CandidataDO();
        c.setIdAluno (rs.getInt("id_aluno"));
        c.setIdProjeto (rs.getInt("id_projeto"));
        candidatos.add(c);
    }
    return candidatos;
  } // procurar_alunos

  public Vector procurar_projetos(int id_aluno, Transacao tr) throws Exception {
    Connection con = tr.obterConexao();
    String sql = "select * from candidata where id_aluno=?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setInt(1, id_aluno);
    ResultSet rs = ps.executeQuery();
    rs.next();
    Vector projetos = new Vector();
    while (rs.next()) {
        CandidataDO c = new CandidataDO();
        c.setIdAluno (rs.getInt("id_aluno"));
        c.setIdProjeto (rs.getInt("id_projeto"));
        projetos.add(c);
    }
    return projetos;
  } // procurar_projetos
  
} // CandidataData