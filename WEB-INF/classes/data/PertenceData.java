package data;

import java.sql.*;
import java.util.*;
import utils.Transacao;

public class PertenceData{

  public void incluir(PertenceDO pertence, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into pertence (id_assistente, id_lab) values (?, ?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, pertence.getIdAssis());
     ps.setInt(2, pertence.getIdLab());
     int result = ps.executeUpdate();
  }

  public void excluirPertence(int id_lab, int id_assistente, Transacao tr) throws Exception {
    Connection con = tr.obterConexao();
    String sql = "delete from pertence where id_lab=? and id_assistente=?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setInt(1, id_lab);
    ps.setInt(1, id_assistente);
    int result = ps.executeUpdate();
    System.out.println("apagado com sucesso");
  } // excluir 

  public Vector procurar_labs(int id_assistente, Transacao tr) throws Exception {
    Connection con = tr.obterConexao();
    String sql = "select * from pertence where id_assistente=?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setInt(1, id_assistente);
    ResultSet rs = ps.executeQuery();
    rs.next();
    Vector pertences = new Vector();
    while (rs.next()) {
        PertenceDO c = new PertenceDO();
        c.setIdAssis (rs.getInt("id_assistente"));
        c.setIdLab (rs.getInt("id_lab"));
        pertences.add(c);
    }
    return pertences;
  } // procurar_alunos

  public Vector procurar_assistentes(int id_lab, Transacao tr) throws Exception {
    Connection con = tr.obterConexao();
    String sql = "select * from pertence where id_lab=?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setInt(1, id_lab);
    ResultSet rs = ps.executeQuery();
    rs.next();
    Vector assistentes = new Vector();
    while (rs.next()) {
        PertenceDO c = new PertenceDO();
        c.setIdAssis (rs.getInt("id_assistente"));
        c.setIdLab (rs.getInt("id_lab"));
        assistentes.add(c);
    }
    return assistentes;
  } // procurar_labs
  
} // CandidataData