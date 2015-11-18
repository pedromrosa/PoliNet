package data;

import java.sql.*;
import java.util.*;
import utils.Transacao;

public class AssistenteData extends UsuarioData{

  public void incluir(AssistenteDO assistente, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into assistente (nusp, email, nome, sobrenome, link_lattes, instituicao, departamento, laboratorio) values (?, ?, ?, ?, ?, ?, ?, ?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, assistente.getNusp());
     ps.setString(2, assistente.getEmail());
     ps.setString(3, assistente.getNome());
     ps.setString(4, assistente.getSobrenome());
     ps.setString(5, assistente.getLattes());
     ps.setString(6, assistente.getInstituicao());
     ps.setString(7, assistente.getDepartamento());
     ps.setString(8, assistente.getLaboratorio());
     int result = ps.executeUpdate();
  }

  //public void excluir(AlunoDO aluno, Transacao tr) throws Exception {
  //   excluir(aluno.getId(), tr);
  //} // excluir

  //public void excluir (int idobj, Transacao tr) throws Exception {
  //} // excluir 

  public void atualizar(AssistenteDO assistente, Transacao tr) throws Exception {
    Connection con = tr.obterConexao();
    String sql = "update assistente set nusp=?, email=?, nome=?, sobrenome=?, link_lattes=?, instituicao=?, departamento=?, laboratorio=? where id=?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, assistente.getNusp());
    ps.setString(2, assistente.getEmail());
    ps.setString(3, assistente.getNome());
    ps.setString(4, assistente.getSobrenome());
    ps.setString(5, assistente.getLattes());
    ps.setString(6, assistente.getInstituicao());
    ps.setString(7, assistente.getDepartamento());
    ps.setString(8, assistente.getLaboratorio());
    ps.setInt(9, assistente.getId());
    int result = ps.executeUpdate();
  } // atualizar

  @Override
  public AssistenteDO buscar(int idobj, Transacao tr) throws Exception {
    Connection con = tr.obterConexao();
    String sql = "select * from assistente where id=?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setInt(1, idobj);
    ResultSet rs = ps.executeQuery();
    rs.next();
    AssistenteDO assistente = new AssistenteDO();
    assistente.setId (rs.getInt("id"));
    assistente.setNusp (rs.getString("nusp"));
    assistente.setEmail (rs.getString("email"));
    assistente.setNome (rs.getString("nome"));
    assistente.setSobrenome (rs.getString("sobrenome"));
    assistente.setLattes (rs.getString("link_lattes"));
    assistente.setInstituicao (rs.getString("instituicao"));
    assistente.setDepartamento (rs.getString("departamento"));
    assistente.setLaboratorio (rs.getString("laboratorio"));
    return assistente;
  } // buscar

  /*@Override
  public Vector pesquisarPorNusp(String nusp, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from assistente where nusp like ?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, nusp);
     ResultSet rs = ps.executeQuery();
     System.out.println("query executada");
     Vector assistentes = new Vector();
     while (rs.next()) {
        AssistenteDO a = new AssistenteDO();
        a.setId (rs.getInt("id"));
        a.setNusp (rs.getString("nusp"));
        System.out.println(" got " + a.getNusp());
        a.setEmail (rs.getString("email"));
        a.setNome (rs.getString("nome"));
        a.setSobrenome (rs.getString("sobrenome"));
        a.setLattes (rs.getString("link_lattes"));
        a.setInstituicao (rs.getString("instituicao"));
        a.setDepartamento (rs.getString("departamento"));
        a.setLaboratorio (rs.getString("laboratorio"));
        assistentes.add(a);
     }
     return assistentes;
  } // pesquisarPorNusp         */

} // AssistenteData