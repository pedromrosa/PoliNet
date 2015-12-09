package transacoes;

import utils.*;
import data.*;
import java.util.*;

public class Mensagem {

  public boolean incluir (MensagemDO mensagem) throws Exception{
     // efetuando a transacao
     Transacao tr = new Transacao();
     try {
       tr.begin();
         MensagemData adata = new MensagemData();
         adata.enviar(mensagem, tr);
       tr.commit();
       return true;
       
     } catch(Exception e) {
         tr.rollback();
         System.out.println("erro ao enviar");
         e.printStackTrace();
     }
     return false;
  } // incluir


   public boolean excluir(MensagemDO mensagem) throws Exception {
     Transacao tr = new Transacao();
	 try{
	   // inserir validacoes de regras de negocio
	   tr.begin();
  	     MensagemData adata = new MensagemData();
	     adata.excluirMsg(mensagem, tr);
	   tr.commit();
	   return true;
	 } catch (Exception e) {
	   tr.rollback();
	   System.out.println("erro ao excluir" );
	   e.printStackTrace();
	 }
	 return false;
  } // excluir
  
  public MensagemDO buscar(int data) throws Exception{
     Transacao tr = new Transacao();
	 try{
	   tr.beginReadOnly();
  	     MensagemData adata = new MensagemData();
	     MensagemDO a = adata.buscar(data, tr);
	   tr.commit();
	   return a;
	 } catch (Exception e) {
	   tr.rollback();
	   System.out.println("erro ao buscar");
	   e.printStackTrace();
	 }
	 return null;
  } // buscar

  public Vector pesquisarInbox(int id_recebe) {

     Transacao tr = new Transacao();
     try {
	   tr.beginReadOnly();
           MensagemData adata = new MensagemData();
           Vector v = adata.pesquisarInbox(id_recebe, tr);
		 tr.commit();
		 return v;
     } catch(Exception e) {
         System.out.println("erro ao pesquisar " + id_recebe);
         e.printStackTrace();
     }
     return null;
  } // pesquisar
  
public Vector pesquisarOutbox(int id_envia) {

     Transacao tr = new Transacao();
     try {
	   tr.beginReadOnly();
           MensagemData adata = new MensagemData();
           Vector v = adata.pesquisarInbox(id_envia, tr);
		 tr.commit();
		 return v;
     } catch(Exception e) {
         System.out.println("erro ao pesquisar " + id_envia);
         e.printStackTrace();
     }
     return null;
  } // pesquisar

  public static void main(String[] args) {
      /*Mensagem a = new Mensagem();
      MensagemDO mensagem = new MensagemDO();
      try {
	    mensagem = a.buscar(6);
            System.out.println(mensagem.getNusp());
      } catch(Exception e) {
            e.printStackTrace();
      } */
  } // main
} // Mensagem