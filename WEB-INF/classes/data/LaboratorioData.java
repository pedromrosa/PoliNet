package data;

import java.sql.*;
import java.util.*;
import utils.Transacao;

public class LaboratorioData {

  public void incluir(LaboratorioDO lab, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into lab (nome, departamento, descricao, link_site) values (?, ?, ?, ?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, lab.getNome());
     ps.setString(2, lab.getDepartamento());
     ps.setString(3, lab.getDescricao());
     ps.setString(4, lab.getSite());
     int result = ps.executeUpdate();
  }

  public void excluir(LaboratorioDO lab, Transacao tr) throws Exception {
     excluir(lab.getId(), tr);
  } // excluir

  public void excluir (int idobj, Transacao tr) throws Exception {
  } // excluir 

  public void atualizar(LaboratorioDO lab, Transacao tr) throws Exception {
    Connection con = tr.obterConexao();
    String sql = "update lab set nome=?, departamento=?, descricao=?, link_site=? where id=?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, lab.getNome());
    ps.setString(2, lab.getDepartamento());
    ps.setString(3, lab.getDescricao());
    ps.setString(4, lab.getSite());
    ps.setInt(5, lab.getId());
    int result = ps.executeUpdate();
  } // atualizar

  public LaboratorioDO buscar(int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from lab where id=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idobj);
     ResultSet rs = ps.executeQuery();
     rs.next();
     LaboratorioDO lab = new LaboratorioDO();
     lab.setId (rs.getInt("id"));
     lab.setNome (rs.getString("nome"));
     lab.setDepartamento (rs.getString("departamento"));
     lab.setDescricao (rs.getString("descricao"));
     lab.setSite (rs.getString("link_site"));
     return lab;
  } // buscar

  public Vector pesquisarPorNome(String nome, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from lab where nome like ?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, "%" + nome + "%");
     ResultSet rs = ps.executeQuery();
     System.out.println("query executada");
     Vector labs = new Vector();
     while (rs.next()) {
        LaboratorioDO l = new LaboratorioDO();
        l.setId (rs.getInt("id"));
        l.setNome (rs.getString("nome"));
        System.out.println(" got " + l.getNome());
        l.setDepartamento (rs.getString("departamento"));
        l.setDescricao (rs.getString("descricao"));
        l.setSite (rs.getString("link_site"));
        labs.add(l);
     }
     return labs;
  } // pesquisarPorNome
  public Vector pesquisarPorDepartamento(String departamento, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from lab where departamento like ?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, departamento);
     ResultSet rs = ps.executeQuery();
     System.out.println("query executada");
     Vector labs = new Vector();
     while (rs.next()) {
        LaboratorioDO l = new LaboratorioDO();
        l.setId (rs.getInt("id"));
        l.setNome (rs.getString("nome"));
        System.out.println(" got " + l.getNome());
        l.setDepartamento (rs.getString("departamento"));
        l.setDescricao (rs.getString("descricao"));
        l.setSite (rs.getString("link_site"));
        labs.add(l);
     }
     return labs;
  } // pesquisarPorDepartamento

} // LabData