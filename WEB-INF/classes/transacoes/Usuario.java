package transacoes;

import utils.*;
import data.*;
import java.util.*;

public class Usuario {

  public boolean incluir (UsuarioDO usuario) throws Exception{

     // validacao das regras de negocio
     if ( (isEmpty(usuario.getNusp())) || ( isEmpty(usuario.getEmail())) || ( isEmpty(usuario.getNome())) || ( isEmpty(usuario.getSobrenome())) || ( isEmpty(usuario.getVinculo())) ) {
       return false;
     }

     // efetuando a transacao
     Transacao tr = new Transacao();
     try {

       tr.begin();
         UsuarioData udata = new UsuarioData();
         udata.incluir(usuario, tr);
       tr.commit();
       return true;
       
     } catch(Exception e) {
         tr.rollback();
         System.out.println("erro ao incluir " + usuario.getNusp());
         e.printStackTrace();
     }
     return false;
  } // incluir

  public boolean atualizar(UsuarioDO usuario) throws Exception {
     Transacao tr = new Transacao();
	 try{
	   // inserir validacoes de regras de negocio
	   tr.begin();
  	     UsuarioData udata = new UsuarioData();
	     udata.atualizar(usuario, tr);
	   tr.commit();
	   return true;
	 } catch (Exception e) {
	   tr.rollback();
	   System.out.println("erro ao atualizar" + usuario.getNusp());
	   e.printStackTrace();
	 }
	 return false;
  } // atualizar

    public boolean excluir (UsuarioDO usuario) throws Exception{
     Transacao tr = new Transacao();
     try {

       tr.begin();
         UsuarioData udata = new UsuarioData();
         udata.excluir(usuario, tr);
       tr.commit();
       return true;
       
     } catch(Exception e) {
         tr.rollback();
         System.out.println("erro ao excluir " + usuario.getNusp());
         e.printStackTrace();
     }
     return false;
  } // excluir
    
    public UsuarioDO buscar(int idobj) throws Exception{
     Transacao tr = new Transacao();
	 try{
	   tr.beginReadOnly();
  	     UsuarioData udata = new UsuarioData();
	     UsuarioDO u = udata.buscar(idobj, tr);
	   tr.commit();
	   return u;
	 } catch (Exception e) {
	   tr.rollback();
	   System.out.println("erro ao buscar" + idobj);
	   e.printStackTrace();
	 }
	 return null;
  } // buscar
    public UsuarioDO buscarEmail(String email) throws Exception{
     Transacao tr = new Transacao();
	 try{
	   tr.beginReadOnly();
  	     UsuarioData udata = new UsuarioData();
	     UsuarioDO u = udata.buscarEmail(email, tr);
	   tr.commit();
	   return u;
	 } catch (Exception e) {
	   tr.rollback();
	   System.out.println("erro ao buscar" + email);
	   e.printStackTrace();
	 }
	 return null;
  } // buscar
    
    //--------PESQUISA DE PERFIL POR NOME-------- 18:30 07/12 -- Fuess
     public Vector buscar(String nome) throws Exception{
     Transacao tr = new Transacao();
	 try{
	   tr.beginReadOnly();
  	     UsuarioData udata = new UsuarioData();
	     Vector u = udata.pesquisarPorNome(nome, tr);
	   tr.commit();
	   return u;
	 } catch (Exception e) {
	   tr.rollback();
	   System.out.println("erro ao buscar por nome");
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
           UsuarioData udata = new UsuarioData();
           Vector v = udata.pesquisarPorNusp(nusp, tr);
		 tr.commit();
		 return v;
     } catch(Exception e) {
         System.out.println("erro ao pesquisar " + nusp);
         e.printStackTrace();
     }
     return null;
  } // pesquisar
////----------PESQUISA POR NUSP-----------  18:30 07/12 --  Fuess -- passou de Vector para UsuarioDO
//  public UsuarioDO pesquisar(String nusp) {
//     if ( isEmpty(nusp) )
//        return null;
//
//     Transacao tr = new Transacao();
//     try {
//	   tr.beginReadOnly();
//           UsuarioData udata = new UsuarioData();
//           UsuarioDO v = udata.pesquisarPorNusp(nusp, tr);
//		 tr.commit();
//		 return v;
//     } catch(Exception e) {
//         System.out.println("erro ao pesquisar " + nusp);
//         e.printStackTrace();
//     }
//     return null;
//  } // pesquisar

  public UsuarioDO buscarNusp(String nusp) throws Exception{
     Transacao tr = new Transacao();
	 try{
	   tr.beginReadOnly();
  	     UsuarioData udata = new UsuarioData();
	     UsuarioDO u = udata.buscarNusp(nusp, tr);
	   tr.commit();
	   return u;
	 } catch (Exception e) {
	   tr.rollback();
	   System.out.println("erro ao buscar" + nusp);
	   e.printStackTrace();
	 }
	 return null;
  } // buscar
  

  private boolean isEmpty(String s) {
     if (null == s)
       return true;
     if (s.length() == 0)
       return true;
     return false;
  }
 

  public static void main(String[] args) {
      Usuario u = new Usuario();
      UsuarioDO usuario = new UsuarioDO();
      try {
	    usuario = u.buscar(6);
            System.out.println(usuario.getNusp());
      } catch(Exception e) {
            e.printStackTrace();
      }
  } // main
} // Usuario