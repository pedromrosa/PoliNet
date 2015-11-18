package data;

import java.sql.*;
import java.util.*;
import utils.Transacao;

public class UsuarioData {

  public void incluir(UsuarioDO usuario, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into usuario (nusp, email, nome, sobrenome, vinculo) values (?, ?, ?, ?, ?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, usuario.getNusp());
     ps.setString(2, usuario.getEmail());
     ps.setString(3, usuario.getNome());
     ps.setString(4, usuario.getSobrenome());
     ps.setString(5, usuario.getVinculo());
     int result = ps.executeUpdate();
  }

  public void excluir(UsuarioDO usuario, Transacao tr) throws Exception {
     excluir(usuario.getId(), tr);
     System.out.println(" got " + usuario.getId());
  } // excluir

  public void excluir (int idobj, Transacao tr) throws Exception {
    Connection con = tr.obterConexao();
    String sql = "delete from usuario where id=?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setInt(1, idobj);
    int result = ps.executeUpdate();
    System.out.println("apagado com sucesso");
  } // excluir 

  public void atualizar(UsuarioDO usuario, Transacao tr) throws Exception {
    Connection con = tr.obterConexao();
    String sql = "update usuario set nusp=?, email=?, nome=?, sobrenome=?, vinculo=? where id=?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, usuario.getNusp());
    ps.setString(2, usuario.getEmail());
    ps.setString(3, usuario.getNome());
    ps.setString(4, usuario.getSobrenome());
    ps.setString(5, usuario.getVinculo());
    ps.setInt(6, usuario.getId());
    int result = ps.executeUpdate();
  } // atualizar

  public UsuarioDO buscar(int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from usuario where id=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idobj);
     ResultSet rs = ps.executeQuery();
     rs.next();
     UsuarioDO usuario = new UsuarioDO();
     usuario.setId (rs.getInt("id"));
     usuario.setNusp (rs.getString("nusp"));
     usuario.setEmail (rs.getString("email"));
     usuario.setNome (rs.getString("nome"));
     usuario.setSobrenome (rs.getString("sobrenome"));
     usuario.setVinculo (rs.getString("vinculo"));
     return usuario;
  } // buscar

  public Vector pesquisarPorNusp(String nusp, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from usuario where nusp like ?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, nusp);
     ResultSet rs = ps.executeQuery();
     System.out.println("query executada");
     Vector usuarios = new Vector();
     while (rs.next()) {
        UsuarioDO u = new UsuarioDO();
        u.setId (rs.getInt("id"));
        u.setNusp (rs.getString("nusp"));
        System.out.println(" got " + u.getNusp());
        u.setEmail (rs.getString("email"));
        u.setNome (rs.getString("nome"));
        u.setSobrenome (rs.getString("sobrenome"));
        u.setVinculo (rs.getString("vinculo"));
        usuarios.add(u);
     }
     return usuarios;
  } // pesquisarPorNusp

} // UsuarioData