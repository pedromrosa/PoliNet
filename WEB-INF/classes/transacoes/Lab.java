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
public class Lab {
    
    //----------------PESQUISAR POR NOME DO LAB---------------
    public Vector pesquisa_nome (String lab_nome) throws Exception{

     // validacao das regras de negocio
     // efetuando a transacao
     Transacao tr = new Transacao();
     try {
       tr.begin();
         LabData ldata = new LabData();
         Vector l = ldata.pesquisarPorNome(lab_nome, tr);
       tr.commit();
       return l;
       
     } catch(Exception e) {
         tr.rollback();
         System.out.println("erro ao buscar nome");
         e.printStackTrace();
     }
     return null;
  } // incluir

    
 //--------------------PESQUISAR POR ID DO PROJETO---------------
  public LabDO pesquisa_id(int id_lab) throws Exception {
     Transacao tr = new Transacao();
	 try{
	   // inserir validacoes de regras de negocio
	   tr.begin();
  	     LabData ldata = new LabData();
	     LabDO l = ldata.buscar(id_lab, tr);
	   tr.commit();
	   return l;
	 } catch (Exception e) {
	   tr.rollback();
	   System.out.println("erro ao buscar id");
	   e.printStackTrace();
	 }
	 return null;
  } // atualizar
    
    //-------------------PESQUISAR POR DEPARTAMENTO-------------
    public Vector pesquisa_dep (String dep_lab) throws Exception{
     Transacao tr = new Transacao();
     try {

       tr.begin();
         LabData ldata = new LabData();
	 Vector l = ldata.pesquisarPorDep(dep_lab, tr);
       tr.commit();
       return l;
       
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