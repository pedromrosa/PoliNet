package transacoes;

import utils.*;
import data.*;
import java.util.*;

public class Aluno extends Usuario {

  public boolean incluir (AlunoDO aluno) throws Exception{

     // validacao das regras de negocio
     if ( (isEmpty(aluno.getNusp())) || ( isEmpty(aluno.getEmail())) || ( isEmpty(aluno.getNome())) || ( isEmpty(aluno.getSobrenome())) || ( isEmpty(aluno.getVinculo())) ) {
       return false;
     }

     // efetuando a transacao
     Transacao tr = new Transacao();
     try {

       tr.begin();
         AlunoData adata = new AlunoData();
         adata.incluir(aluno, tr);
       tr.commit();
       return true;
       
     } catch(Exception e) {
         tr.rollback();
         System.out.println("erro ao incluir " + aluno.getNusp());
         e.printStackTrace();
     }
     return false;
  } // incluir

  public boolean atualizar(AlunoDO aluno) throws Exception {
     Transacao tr = new Transacao();
	 try{
	   // inserir validacoes de regras de negocio
	   tr.begin();
  	     AlunoData adata = new AlunoData();
	     adata.atualizar(aluno, tr);
	   tr.commit();
	   return true;
	 } catch (Exception e) {
	   tr.rollback();
	   System.out.println("erro ao atualizar" + aluno.getNusp());
	   e.printStackTrace();
	 }
	 return false;
  } // atualizar

   public boolean excluir(AlunoDO aluno) throws Exception {
     Transacao tr = new Transacao();
	 try{
	   // inserir validacoes de regras de negocio
	   tr.begin();
  	     AlunoData adata = new AlunoData();
	     adata.excluir(aluno, tr);
	   tr.commit();
	   return true;
	 } catch (Exception e) {
	   tr.rollback();
	   System.out.println("erro ao excluir" + aluno.getNusp());
	   e.printStackTrace();
	 }
	 return false;
  } // excluir
  
  @Override
  public AlunoDO buscar(int idobj) throws Exception{
     Transacao tr = new Transacao();
	 try{
	   tr.beginReadOnly();
  	     AlunoData adata = new AlunoData();
	     AlunoDO a = adata.buscar(idobj, tr);
	   tr.commit();
	   return a;
	 } catch (Exception e) {
	   tr.rollback();
	   System.out.println("erro ao buscar" + idobj);
	   e.printStackTrace();
	 }
	 return null;
  } // buscar

  public Vector pesquisar(String nusp) {
     if ( isEmpty(nusp) )
        return null;

     Transacao tr = new Transacao();
     try {
	   tr.beginReadOnly();
           AlunoData adata = new AlunoData();
           Vector v = adata.pesquisarPorNusp(nusp, tr);
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
      Aluno a = new Aluno();
      AlunoDO aluno = new AlunoDO();
      try {
	    aluno = a.buscar(6);
            System.out.println(aluno.getNusp());
      } catch(Exception e) {
            e.printStackTrace();
      }
  } // main
} // Aluno