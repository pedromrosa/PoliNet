package data;

import java.sql.*;
import java.util.*;
import utils.Transacao;

public class AlunoData extends UsuarioData{

  public void incluir(AlunoDO aluno, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into aluno (id, nusp, email, nome, sobrenome, link_lattes, instituicao, codigo_hist) values (?, ?, ?, ?, ?, ?, ?, ?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, aluno.getId());
     ps.setString(2, aluno.getNusp());
     ps.setString(3, aluno.getEmail());
     ps.setString(4, aluno.getNome());
     ps.setString(5, aluno.getSobrenome());
     ps.setString(6, aluno.getLattes());
     ps.setString(7, aluno.getInstituicao());
     ps.setString(8, aluno.getHist());
     int result = ps.executeUpdate();
  }

  public void excluir(AlunoDO aluno, Transacao tr) throws Exception {
     excluir(aluno.getId(), tr);
     System.out.println(" got " + aluno.getId());
  } // excluir

  public void excluir (int idobj, Transacao tr) throws Exception {
    Connection con = tr.obterConexao();
    String sql = "delete from usuario where id=?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setInt(1, idobj);
    int result = ps.executeUpdate();
    System.out.println("apagado com sucesso");
  } // excluir 

  public void atualizar(AlunoDO aluno, Transacao tr) throws Exception {
    Connection con = tr.obterConexao();
    String sql = "update aluno set nusp=?, email=?, nome=?, sobrenome=?, link_lattes=?, instituicao=?, codigo_CV=?, codigo_hist=? where id=?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, aluno.getNusp());
    ps.setString(2, aluno.getEmail());
    ps.setString(3, aluno.getNome());
    ps.setString(4, aluno.getSobrenome());
    ps.setString(5, aluno.getLattes());
    ps.setString(6, aluno.getInstituicao());
    ps.setString(7, aluno.getCv());
    ps.setString(8, aluno.getHist());
    ps.setInt(9, aluno.getId());
    int result = ps.executeUpdate();
  } // atualizar

  @Override
  public AlunoDO buscar(int idobj, Transacao tr) throws Exception {
    Connection con = tr.obterConexao();
    String sql = "select * from aluno where id=?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setInt(1, idobj);
    ResultSet rs = ps.executeQuery();
    rs.next();
    AlunoDO aluno = new AlunoDO();
    aluno.setId (rs.getInt("id"));
    aluno.setNusp (rs.getString("nusp"));
    aluno.setEmail (rs.getString("email"));
    aluno.setNome (rs.getString("nome"));
    aluno.setSobrenome (rs.getString("sobrenome"));
    aluno.setLattes (rs.getString("link_lattes"));
    aluno.setInstituicao (rs.getString("instituicao"));
    aluno.setCv (rs.getString("codigo_CV"));
    aluno.setHist (rs.getString("codigo_hist"));
    return aluno;
  } // buscar

  /*@Override
  public Vector pesquisarPorNusp(String nusp, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from usuario where nusp like ?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, nusp);
     ResultSet rs = ps.executeQuery();
     System.out.println("query executada");
     Vector alunos = new Vector();
     while (rs.next()) {
        AlunoDO a = new AlunoDO();
        a.setId (rs.getInt("id"));
        a.setNusp (rs.getString("nusp"));
        System.out.println(" got " + a.getNusp());
        a.setEmail (rs.getString("email"));
        a.setNome (rs.getString("nome"));
        a.setSobrenome (rs.getString("sobrenome"));
        a.setLattes (rs.getString("link_lattes"));
        a.setInstituicao (rs.getString("instituicao"));
        a.setCv (rs.getString("codigo_CV"));
        a.setHist (rs.getString("codigo_hist"));
        alunos.add(a);
     }
     return alunos;
  } // pesquisarPorNusp     */

} // AlunoData