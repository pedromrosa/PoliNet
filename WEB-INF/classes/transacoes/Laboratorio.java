/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package transacoes;

import data.LabData;
import java.util.Vector;
import utils.Transacao;

/**
 *
 * @author HeitorCarvalho1
 */
public class Laboratorio {
    
    public Vector buscarNome(String nome) throws Exception{
     Transacao tr = new Transacao();
	 try{
	   tr.beginReadOnly();
  	     LabData ldata = new LabData();
	     Vector u = ldata.pesquisarPorNome(nome, tr);
	   tr.commit();
	   return u;
	 } catch (Exception e) {
	   tr.rollback();
	   System.out.println("erro ao buscar por nome");
	   e.printStackTrace();
	 }
	 return null;
  }
    public Vector buscarDepartamento(String departamento) throws Exception{
     Transacao tr = new Transacao();
	 try{
	   tr.beginReadOnly();
  	     LabData ldata = new LabData();
	     Vector u = ldata.pesquisarPorDepartamento(departamento, tr);
	   tr.commit();
	   return u;
	 } catch (Exception e) {
	   tr.rollback();
	   System.out.println("erro ao buscar por nome");
	   e.printStackTrace();
	 }
	 return null;
  }
}