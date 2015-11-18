package data;

import java.sql.*;
import java.util.*;
import utils.Transacao;

public class ProfessorData extends AssistenteData{

  public void incluir(ProfessorDO professor, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into professor (nusp, email, nome, sobrenome, link_lattes, instituicao, departamento, laboratorio) values (?, ?, ?, ?, ?, ?, ?, ?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, professor.getNusp());
     ps.setString(2, professor.getEmail());
     ps.setString(3, professor.getNome());
     ps.setString(4, professor.getSobrenome());
     ps.setString(5, professor.getLattes());
     ps.setString(6, professor.getInstituicao());
     ps.setString(7, professor.getDepartamento());
     ps.setString(8, professor.getLaboratorio());
     int result = ps.executeUpdate();
  }

  //public void excluir(AlunoDO aluno, Transacao tr) throws Exception {
  //   excluir(aluno.getId(), tr);
  //} // excluir

  //public void excluir (int idobj, Transacao tr) throws Exception {
  //} // excluir 

  public void atualizar(ProfessorDO professor, Transacao tr) throws Exception {
    Connection con = tr.obterConexao();
    String sql = "update professor set nusp=?, email=?, nome=?, sobrenome=?, link_lattes=?, instituicao=?, departamento=?, laboratorio=? where id=?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, professor.getNusp());
    ps.setString(2, professor.getEmail());
    ps.setString(3, professor.getNome());
    ps.setString(4, professor.getSobrenome());
    ps.setString(5, professor.getLattes());
    ps.setString(6, professor.getInstituicao());
    ps.setString(7, professor.getDepartamento());
    ps.setString(8, professor.getLaboratorio());
    ps.setInt(9, professor.getId());
    int result = ps.executeUpdate();
  } // atualizar

  @Override
  public ProfessorDO buscar(int idobj, Transacao tr) throws Exception {
    Connection con = tr.obterConexao();
    String sql = "select * from professor where id=?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setInt(1, idobj);
    ResultSet rs = ps.executeQuery();
    rs.next();
    ProfessorDO professor = new ProfessorDO();
    professor.setId (rs.getInt("id"));
    professor.setNusp (rs.getString("nusp"));
    professor.setEmail (rs.getString("email"));
    professor.setNome (rs.getString("nome"));
    professor.setSobrenome (rs.getString("sobrenome"));
    professor.setLattes (rs.getString("link_lattes"));
    professor.setInstituicao (rs.getString("instituicao"));
    professor.setDepartamento (rs.getString("departamento"));
    professor.setLaboratorio (rs.getString("laboratorio"));
    return professor;
  } // buscar

  /*@Override
  public Vector pesquisarPorNusp(String nusp, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from professor where nusp like ?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, nusp);
     ResultSet rs = ps.executeQuery();
     System.out.println("query executada");
     Vector professores = new Vector();
     while (rs.next()) {
        ProfessorDO p = new ProfessorDO();
        p.setId (rs.getInt("id"));
        p.setNusp (rs.getString("nusp"));
        System.out.println(" got " + p.getNusp());
        p.setEmail (rs.getString("email"));
        p.setNome (rs.getString("nome"));
        p.setSobrenome (rs.getString("sobrenome"));
        p.setLattes (rs.getString("link_lattes"));
        p.setInstituicao (rs.getString("instituicao"));
        p.setDepartamento (rs.getString("departamento"));
        p.setLaboratorio (rs.getString("laboratorio"));
        professores.add(p);
     }
     return professores;
  } // pesquisarPorNusp         */

} // ProfessorData