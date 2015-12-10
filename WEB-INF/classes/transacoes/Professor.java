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
 * @author Humberto
 */
public class Professor extends Usuario{
    
    public boolean incluir (ProfessorDO professor) throws Exception{
        
        // validacao das regras de negocio
        if ( (isEmpty(professor.getNusp())) || (isEmpty(professor.getEmail())) || (isEmpty(professor.getNome())) || (isEmpty(professor.getSobrenome())) || (isEmpty(professor.getVinculo())) ) {
            return false;
        }
        
        // efetuando a trasacao
        Transacao tr = new Transacao();
        try {
            tr.begin();
            ProfessorData pdata = new ProfessorData();
            pdata.incluir(professor, tr);
            tr.commit();
            return true;
        } catch(Exception e) {
            tr.rollback();
            System.out.println("erro ao incluir " + professor.getNusp());
            e.printStackTrace();
        }
        return false;
    }
    public boolean atualizar(ProfessorDO professor) throws Exception {
        Transacao tr = new Transacao();
        try {
            // inserir validacoes de regras de negocio
            tr.begin();
            ProfessorData pdata = new ProfessorData();
            pdata.atualizar(professor, tr);
            tr.commit();
            return true;
        } catch (Exception e) {
            tr.rollback();
            System.out.println("erro ao atualizar " + professor.getNusp());
            e.printStackTrace();
        }
        return false;
    }
    public boolean excluir(ProfessorDO professor) throws Exception {
        Transacao tr = new Transacao();
        try {
            // inserir validacoes de regras de negocio
            tr.begin();
            ProfessorData pdata = new ProfessorData();
            pdata.excluir(professor, tr);
            tr.commit();
            return true;
        } catch (Exception e) {
            tr.rollback();
            System.out.println("erro ao excluir " + professor.getNusp());
            e.printStackTrace();
        }
        return false;
    }
    @Override
    public ProfessorDO buscar(int idobj) throws Exception{
        Transacao tr = new Transacao();
        try {
            tr.beginReadOnly();
            ProfessorData pdata = new ProfessorData();
            ProfessorDO professor = pdata.buscar(idobj, tr);
            tr.commit();
            return professor;
        } catch (Exception e) {
            tr.rollback();
            System.out.println("erro ao buscar " + idobj);
            e.printStackTrace();
        }
        return null;
    }
  public ProfessorDO buscarId(int id) throws Exception {
      Transacao tr = new Transacao();
      try {
          tr.beginReadOnly();
          ProfessorData pdata = new ProfessorData();
          ProfessorDO professor   = pdata.buscar(id, tr);
          tr.commit();
          return professor;
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
           ProfessorData pdata = new ProfessorData();
           Vector v = pdata.pesquisarPorNusp(nusp, tr);
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
      Professor p = new Professor();
      ProfessorDO professor = new ProfessorDO();
      try {
	    professor = p.buscar(6);
            System.out.println(professor.getNusp());
      } catch(Exception e) {
            e.printStackTrace();
      }
  } // main
}
