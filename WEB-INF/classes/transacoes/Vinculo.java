/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package transacoes;

import utils.*;
import data.*;
import data.VinculoDO;
import data.VinculoData;
import java.util.*;

/**
 *
 * @author Daniel
 */
public class Vinculo {
    
  
  public boolean incluir (VinculoDO vinculo) throws Exception{

      
      //----------FALTA IMPLEMENTAR-------------
      //verificar se os campos de id_projeto e (id_aluno ou id_professor ou id_assistente) são nulos
//     // validacao das regras de negocio
//     if ( vinculo.getIdProfessor()== null ||vinculo.getIdProfessor()== null ||vinculo.getIdProfessor()== null ||vinculo.getIdProfessor()== null ||vinculo.getIdProfessor()== null  ) {
//       return false;
//     }

     // efetuando a transacao
     Transacao tr = new Transacao();
     try {

       tr.begin();
         VinculoData vdata = new VinculoData();
         vdata.incluir(vinculo, tr);
       tr.commit();
       return true;
       
     } catch(Exception e) {
         tr.rollback();
         System.out.println("erro ao incluir " + vinculo);
         e.printStackTrace();
     }
     return false;
  } // incluir
    
  
  public boolean atualizar(VinculoDO vinculo) throws Exception {
     Transacao tr = new Transacao();
	 try{
	   // inserir validacoes de regras de negocio
	   tr.begin();
  	     VinculoData vdata = new VinculoData();
	     vdata.atualizar(vinculo, tr);
	   tr.commit();
	   return true;
	 } catch (Exception e) {
	   tr.rollback();
	   System.out.println("erro ao atualizar");
	   e.printStackTrace();
	 }
	 return false;
  } // atualizar
  
      public boolean excluir (VinculoDO vinculo) throws Exception{
     Transacao tr = new Transacao();
     try {

       tr.begin();
         VinculoData vdata = new VinculoData();
         vdata.excluir(vinculo, tr);
       tr.commit();
       return true;
       
     } catch(Exception e) {
         tr.rollback();
         System.out.println("erro ao excluir ");
         e.printStackTrace();
     }
     return false;
  } // excluir
    
    public VinculoDO buscar(int idobj) throws Exception{
     Transacao tr = new Transacao();
	 try{
	   tr.beginReadOnly();
  	     VinculoData vdata = new VinculoData();
	     VinculoDO v = vdata.buscar(idobj, tr);
	   tr.commit();
	   return v;
	 } catch (Exception e) {
	   tr.rollback();
	   System.out.println("erro ao buscar" + idobj);
	   e.printStackTrace();
	 }
	 return null;
  } // buscar
  

     public Vector buscarPorUserId(int idobj) {

     Transacao tr = new Transacao();
     try {
	   tr.beginReadOnly();
           VinculoData vdata = new VinculoData();
           Vector v = vdata.buscarPorUserId(idobj, tr);
		 tr.commit();
		 return v;
     } catch(Exception e) {
         System.out.println("erro ao pesquisar ");
         e.printStackTrace();
     }
     return null;
  } // buscarPorUserId

    
//-----------???----------
  public static void main(String[] args) {
//      Vinculo v = new Vinculo();
//      VinculoDO vinculo = new VinculoDO();
//      try {
//	    vinculo = v.buscar(6);
//            System.out.println(vinculo.getNusp());
//      } catch(Exception e) {
//            e.printStackTrace();
//      }
  } // main
}
