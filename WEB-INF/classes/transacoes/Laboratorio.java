/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package transacoes;

import data.*;
import java.util.Vector;
import utils.Transacao;

/**
 *
 * @author HeitorCarvalho1
 */
public class Laboratorio {
    
    public LaboratorioDO buscar(int idobj) throws Exception{
     Transacao tr = new Transacao();
	 try{
	   tr.beginReadOnly();
  	     LaboratorioData ldata = new LaboratorioData();
	     LaboratorioDO l = ldata.buscar(idobj, tr);
	   tr.commit();
	   return l;
	 } catch (Exception e) {
	   tr.rollback();
	   System.out.println("erro ao buscar" + idobj);
	   e.printStackTrace();
	 }
	 return null;
  } // buscar
    public LaboratorioDO pesquisa_id_lab(int id_lab) throws Exception {
     Transacao tr = new Transacao();
	 try{
	   // inserir validacoes de regras de negocio
	   tr.begin();
  	     LaboratorioData pdata = new LaboratorioData();
	     LaboratorioDO p = pdata.buscar(id_lab, tr);
	   tr.commit();
	   return p;
	 } catch (Exception e) {
	   tr.rollback();
	   System.out.println("erro ao buscar id");
	   e.printStackTrace();
	 }
	 return null;
  } // atualizar
    
    public Vector buscarNome(String nome) throws Exception{
     Transacao tr = new Transacao();
	 try{
	   tr.beginReadOnly();
  	     LaboratorioData ldata = new LaboratorioData();
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
  	     LaboratorioData ldata = new LaboratorioData();
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