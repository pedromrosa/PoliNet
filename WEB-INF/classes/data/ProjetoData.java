package data;

import java.sql.*;
import java.util.*;
import utils.Transacao;

public class ProjetoData {

  public void incluir(ProjetoDO projeto, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into projeto (titulo, descricao, palavra_chave1, palavra_chave2, palavra_chave3, semestre_inicio, semestre_fim, id_lab, patrocinador) values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, projeto.getTitulo());
     ps.setString(2, projeto.getDescricao());
     ps.setString(3, projeto.getKW1());
     ps.setString(4, projeto.getKW2());
     ps.setString(5, projeto.getKW3());
     ps.setInt(6, projeto.getInicio());
     ps.setInt(7, projeto.getFim());
     ps.setInt(8, projeto.getLab());
     ps.setString(9, projeto.getPatrocinador());
     int result = ps.executeUpdate();
  }

  public void excluir(ProjetoDO projeto, Transacao tr) throws Exception {
     excluir(projeto.getId(), tr);
  } // excluir

  public void excluir (int idobj, Transacao tr) throws Exception {
  } // excluir 

  public void atualizar(ProjetoDO projeto, Transacao tr) throws Exception {
    Connection con = tr.obterConexao();
    String sql = "update projeto set titulo=?, descricao=?, palavra_chave1=?, palavra_chave2=?, palavra_chave3=?, sem_ini=?, sem_fim=?, id_lab=? patrocinador=? where id=?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, projeto.getTitulo());
    ps.setString(2, projeto.getDescricao());
    ps.setString(3, projeto.getKW1());
    ps.setString(4, projeto.getKW2());
    ps.setString(5, projeto.getKW3());
    ps.setInt(6, projeto.getInicio());
    ps.setInt(7, projeto.getFim());
    ps.setInt(8, projeto.getLab());
    ps.setString(9, projeto.getPatrocinador());
    ps.setInt(10, projeto.getId());
    int result = ps.executeUpdate();
  } // atualizar

  public ProjetoDO buscar(int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from projeto where id=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idobj);
     ResultSet rs = ps.executeQuery();
     rs.next();
     ProjetoDO projeto = new ProjetoDO();
     projeto.setId (rs.getInt("id"));
     projeto.setTitulo (rs.getString("titulo"));
     projeto.setDescricao (rs.getString("descricao"));
     projeto.setKW1 (rs.getString("palavra_chave1"));
     projeto.setKW2 (rs.getString("palavra_chave2"));
     projeto.setKW3 (rs.getString("palavra_chave3"));
     projeto.setInicio (rs.getInt("semestre_inicio"));
     projeto.setFim (rs.getInt("semestre_fim"));
     projeto.setLab (rs.getInt("id_lab"));
     projeto.setPatrocinador (rs.getString("patrocinador"));
     return projeto;
  } // buscar
  
  //17:20 07/12
  public ProjetoDO buscarIdLab(int idlab, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from projeto where id_lab=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idlab);
     ResultSet rs = ps.executeQuery();
     rs.next();
     ProjetoDO projeto = new ProjetoDO();
     projeto.setId (rs.getInt("id"));
     projeto.setTitulo (rs.getString("titulo"));
     projeto.setDescricao (rs.getString("descricao"));
     projeto.setKW1 (rs.getString("palavra_chave1"));
     projeto.setKW2 (rs.getString("palavra_chave2"));
     projeto.setKW3 (rs.getString("palavra_chave3"));
     projeto.setInicio (rs.getInt("semestre_inicio"));
     projeto.setFim (rs.getInt("semestre_fim"));
     projeto.setLab (rs.getInt("id_lab"));
     projeto.setPatrocinador (rs.getString("patrocinador"));
     return projeto;
  } // buscar_idlab
  
  //17:05 07/12
  public ProjetoDO pesquisarPorTitulo(String titulo, Transacao tr) throws Exception{
     Connection con = tr.obterConexao();
     String sql = "select * from projeto where titulo=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, titulo);
     ResultSet rs = ps.executeQuery();
     rs.next();
     ProjetoDO projeto = new ProjetoDO();
     projeto.setId (rs.getInt("id"));
     projeto.setTitulo (rs.getString("titulo"));
     projeto.setDescricao (rs.getString("descricao"));
     projeto.setKW1 (rs.getString("palavra_chave1"));
     projeto.setKW2 (rs.getString("palavra_chave2"));
     projeto.setKW3 (rs.getString("palavra_chave3"));
     projeto.setInicio (rs.getInt("semestre_inicio"));
     projeto.setFim (rs.getInt("semestre_fim"));
     projeto.setLab (rs.getInt("id_lab"));
     projeto.setPatrocinador (rs.getString("patrocinador"));
     return projeto;
  }

  public Vector pesquisarPorKeyword(String kw, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from projeto where palavra_chave1 like ? or palavra_chave2 like ? or palavra_chave3 like ?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, kw);
     ps.setString(2, kw);
     ps.setString(3, kw);
     ResultSet rs = ps.executeQuery();
     System.out.println("query executada");
     Vector projetos = new Vector();
     while (rs.next()) {
        ProjetoDO p = new ProjetoDO();
        p.setId (rs.getInt("id"));
        p.setTitulo (rs.getString("titulo"));
        p.setDescricao (rs.getString("descricao"));
        p.setKW1 (rs.getString("palavra_chave1"));
        System.out.println(" got " + p.getKW1());
        p.setKW2 (rs.getString("palavra_chave2"));
        System.out.println(" got " + p.getKW2());
        p.setKW3 (rs.getString("palavra_chave3"));
        System.out.println(" got " + p.getKW3());
        p.setInicio (rs.getInt("semestre_inicio"));
        p.setFim (rs.getInt("semestre_fim"));
        p.setLab (rs.getInt("id_lab"));
        p.setPatrocinador (rs.getString("patrocinador"));
        projetos.add(p);
     }
     return projetos;
  } // pesquisarPorKeyword

} // ProjetoData