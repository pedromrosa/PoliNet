/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package transacoes;

import utils.*;
import data.*;
import java.util.*;
/**
 *
 * @author Gregorio
 */
public class Assistente extends Usuario{
    
    public boolean incluir (AssistenteDO assistente) throws Exception{
        
        // validacao das regras de negocio
        if ( (isEmpty(assistente.getNusp())) || (isEmpty(assistente.getEmail())) || (isEmpty(assistente.getNome())) || (isEmpty(assistente.getSobrenome())) || (isEmpty(assistente.getVinculo())) ) {
            return false;
        }
        
        // efetuando a trasacao
        Transacao tr = new Transacao();
        try {
            tr.begin();
            AssistenteData asdata = new AssistenteData();
            asdata.incluir(assistente, tr);
            tr.commit();
            return true;
        } catch(Exception e) {
            tr.rollback();
            System.out.println("erro ao incluir " + assistente.getNusp());
            e.printStackTrace();
        }
        return false;
    }
    public boolean atualizar(AssistenteDO assistente) throws Exception {
        Transacao tr = new Transacao();
        try {
            // inserir validacoes de regras de negocio
            tr.begin();
            AssistenteData asdata = new AssistenteData();
            asdata.atualizar(assistente, tr);
            tr.commit();
            return true;
        } catch (Exception e) {
            tr.rollback();
            System.out.println("erro ao atualizar " + assistente.getNusp());
            e.printStackTrace();
        }
        return false;
    }
    public boolean excluir(AssistenteDO assistente) throws Exception {
        Transacao tr = new Transacao();
        try {
            // inserir validacoes de regras de negocio
            tr.begin();
            AssistenteData asdata = new AssistenteData();
            asdata.excluir(assistente, tr);
            tr.commit();
            return true;
        } catch (Exception e) {
            tr.rollback();
            System.out.println("erro ao excluir " + assistente.getNusp());
            e.printStackTrace();
        }
        return false;
    }
    @Override
    public AssistenteDO buscar(int idobj) throws Exception{
        Transacao tr = new Transacao();
        try {
            tr.beginReadOnly();
            AssistenteData asdata = new AssistenteData();
            AssistenteDO assistente = asdata.buscar(idobj, tr);
            tr.commit();
            return assistente;
        } catch (Exception e) {
            tr.rollback();
            System.out.println("erro ao buscar " + idobj);
            e.printStackTrace();
        }
        return null;
    }
  public AssistenteDO buscarId(int id) throws Exception {
      Transacao tr = new Transacao();
      try {
          tr.beginReadOnly();
          AssistenteData asdata = new AssistenteData();
          AssistenteDO assistente   = asdata.buscar(id, tr);
          tr.commit();
          return assistente;
      } catch (Exception e) {
          System.out.println("erro ao buscar ID: " + id);
          e.printStackTrace();
      }
      return null;
  }
  public Vector pesquisar(String nusp) {
     if ( isEmpty(nusp) )
        return null;

     Transacao tr = new Transacao();
     try {
	   tr.beginReadOnly();
           AssistenteData asdata = new AssistenteData();
           Vector v = asdata.pesquisarPorNusp(nusp, tr);
		 tr.commit();
		 return v;
     } catch(Exception e) {
         System.out.println("erro ao pesquisar " + nusp);
         e.printStackTrace();
     }
     return null;
  } // pesquisar

  private boolean isEmpty(String s) {
     if (null == s)
       return true;
     if (s.length() == 0)
       return true;
     return false;
  }

  public static void main(String[] args) {
      Assistente as = new Assistente();
      AssistenteDO assistente = new AssistenteDO();
      try {
	    assistente = as.buscar(6);
            System.out.println(assistente.getNusp());
      } catch(Exception e) {
            e.printStackTrace();
      }
  } // main
}
