package data;

import java.sql.*;
import java.util.*;
import utils.Transacao;

public class MantemData{

  public void incluir(MantemDO mantem, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into mantem (id_professor, id_lab) values (?, ?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, mantem.getIdProf());
     ps.setInt(2, mantem.getIdLab());
     int result = ps.executeUpdate();
  }

  public void excluirMantem(int id_lab, int id_professor, Transacao tr) throws Exception {
    Connection con = tr.obterConexao();
    String sql = "delete from mantem where id_lab=? and id_professor=?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setInt(1, id_lab);
    ps.setInt(1, id_professor);
    int result = ps.executeUpdate();
    System.out.println("apagado com sucesso");
  } // excluir 

  public Vector procurar_labs(int id_professor, Transacao tr) throws Exception {
    Connection con = tr.obterConexao();
    String sql = "select * from mantem where id_professor=?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setInt(1, id_professor);
    ResultSet rs = ps.executeQuery();
    rs.next();
    Vector mantems = new Vector();
    while (rs.next()) {
        MantemDO c = new MantemDO();
        c.setIdProf (rs.getInt("id_professor"));
        c.setIdLab (rs.getInt("id_lab"));
        mantems.add(c);
    }
    return mantems;
  } // procurar_alunos

  public Vector procurar_professores(int id_lab, Transacao tr) throws Exception {
    Connection con = tr.obterConexao();
    String sql = "select * from mantem where id_lab=?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setInt(1, id_lab);
    ResultSet rs = ps.executeQuery();
    rs.next();
    Vector professores = new Vector();
    while (rs.next()) {
        MantemDO c = new MantemDO();
        c.setIdProf (rs.getInt("id_professor"));
        c.setIdLab (rs.getInt("id_lab"));
        professores.add(c);
    }
    return professores;
  } // procurar_labs
  
} // CandidataData