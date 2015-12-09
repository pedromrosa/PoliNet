package data;

import java.sql.*;
import java.util.*;
import utils.Transacao;

public class MensagemData {

  public void enviar (MensagemDO mensagem, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into mensagem (id_envia, id_recebe, titulo, texto, data) values (?, ?, ?, ?, ?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, mensagem.getEnvia());
     ps.setInt(2, mensagem.getRecebe());
     ps.setString(3, mensagem.getTitulo());
     ps.setString(4, mensagem.getTexto());
     ps.setInt(5, mensagem.getData());
     int result = ps.executeUpdate();
  }

public void excluirMsg(MensagemDO mensagem, Transacao tr) throws Exception {
    excluirMsg(mensagem.getData(), tr);
} // excluir

public void excluirMsg(int data, Transacao tr) throws Exception {
    Connection con = tr.obterConexao();
    String sql = "delete from mensagem where data=?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setInt(1, data);
    int result = ps.executeUpdate();
    System.out.println("apagado com sucesso");
} // excluir 

public MensagemDO buscar(int data, Transacao tr) throws Exception {
    Connection con = tr.obterConexao();
    String sql = "select * from mensagem where data=?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setInt(1, data);
    ResultSet rs = ps.executeQuery();
    rs.next();
    MensagemDO mensagem = new MensagemDO();
    mensagem.setEnvia (rs.getInt("id_envia"));
    mensagem.setRecebe (rs.getInt("id_recebe"));
    mensagem.setTitulo (rs.getString("titulo"));
    mensagem.setTexto (rs.getString("texto"));
    mensagem.setData(rs.getInt("data"));
    return mensagem;
  } // buscar

  public Vector pesquisarInbox(int idRecebe, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from mensagem where id_recebe like ?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idRecebe);
     ResultSet rs = ps.executeQuery();
     System.out.println("query executada");
     Vector inbox = new Vector();
     while (rs.next()) {
        MensagemDO u = new MensagemDO();
        u.setEnvia (rs.getInt("id_envia"));
        u.setRecebe (rs.getInt("id_recebe"));
        System.out.println(" got " + u.getRecebe());
        u.setTitulo (rs.getString("titulo"));
        u.setTexto (rs.getString("texto"));
        u.setData (rs.getInt("data"));
        inbox.add(u);
     }
     return inbox;
  }
  
     public Vector pesquisarOutbox(int idEnvia, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from mensagem where id_envia like ?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idEnvia);
     ResultSet rs = ps.executeQuery();
     System.out.println("query executada");
     Vector outbox = new Vector();
     while (rs.next()) {
        MensagemDO u = new MensagemDO();
        u.setEnvia (rs.getInt("id_envia"));
        System.out.println(" got " + u.getEnvia());
        u.setRecebe (rs.getInt("id_recebe"));
        u.setTitulo (rs.getString("titulo"));
        u.setTexto (rs.getString("texto"));
        u.setData (rs.getInt("data"));
        outbox.add(u);
     }
     return outbox;
  } // pesquisarInbox
  

} // AlunoData