/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package transacoes;

import utils.*;
import data.*;
import data.ProjetoDO;
import data.ProjetoData;
import java.util.*;

/**
 *
 * @author Daniel
 */
public class Projeto {
    
    //----------------PESQUISAR POR PALAVRA-CHAVE---------------
    public Vector pesquisa_kw (String projeto_kw) throws Exception{

     // validacao das regras de negocio
     // efetuando a transacao
     Transacao tr = new Transacao();
     try {
       tr.begin();
         ProjetoData pdata = new ProjetoData();
         Vector p = pdata.pesquisarPorKeyword(projeto_kw, tr);
       tr.commit();
       return p;
       
     } catch(Exception e) {
         tr.rollback();
         System.out.println("erro ao buscar palavra-chave ");
         e.printStackTrace();
     }
     return null;
  } // incluir

    
 //--------------------PESQUISAR POR ID DO PROJETO---------------
  public ProjetoDO pesquisa_id(int id_proj) throws Exception {
     Transacao tr = new Transacao();
	 try{
	   // inserir validacoes de regras de negocio
	   tr.begin();
  	     ProjetoData pdata = new ProjetoData();
	     ProjetoDO p = pdata.buscar(id_proj, tr);
	   tr.commit();
	   return p;
	 } catch (Exception e) {
	   tr.rollback();
	   System.out.println("erro ao buscar id");
	   e.printStackTrace();
	 }
	 return null;
  } // atualizar

  //-------------------PESQUISAR POR ID DO LABORATÓRIO-------------
    public ProjetoDO pesquisa_id_lab(int id_lab) throws Exception {
     Transacao tr = new Transacao();
	 try{
	   // inserir validacoes de regras de negocio
	   tr.begin();
  	     ProjetoData pdata = new ProjetoData();
	     ProjetoDO p = pdata.buscarIdLab(id_lab, tr);
	   tr.commit();
	   return p;
	 } catch (Exception e) {
	   tr.rollback();
	   System.out.println("erro ao buscar id");
	   e.printStackTrace();
	 }
	 return null;
  } // atualizar
    
    //-------------------PESQUISAR POR TÍTULO DO PROJETO-------------
    public ProjetoDO pesquisa_titulo (String titulo_proj) throws Exception{
     Transacao tr = new Transacao();
     try {

       tr.begin();
         ProjetoData pdata = new ProjetoData();
	 ProjetoDO p= pdata.pesquisarPorTitulo(titulo_proj, tr);
       tr.commit();
       return p;
       
     } catch(Exception e) {
         tr.rollback();
         System.out.println("erro ao buscar título");
         e.printStackTrace();
     }
     return null;
  } // excluir
    
//-----------???----------
  public static void main(String[] args) {
//      Projeto p = new Projeto();
//      ProjetoDO projeto = new ProjetoDO();
//      try {
//	    projeto = p.buscar(6);
//            System.out.println(usuario.getNusp());
//      } catch(Exception e) {
//            e.printStackTrace();
//      }
  } // main
}