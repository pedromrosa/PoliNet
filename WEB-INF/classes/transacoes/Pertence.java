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
public class Pertence{
    
    public boolean incluir(PertenceDO pertence) throws Exception{
        
        // validacao das regras de negocio
        if ( pertence.getIdAssis() == 0 || pertence.getIdLab() == 0 ) {
            return false;
        }
        
        // efetuando a trasacao
        Transacao tr = new Transacao();
        try {
            tr.begin();
            PertenceData data = new PertenceData();
            data.incluir(pertence, tr);
            tr.commit();
            return true;
        } catch(Exception e) {
            tr.rollback();
            System.out.println("erro ao incluir");
            e.printStackTrace();
        }
        return false;
    }
 
    public boolean excluirPertence(PertenceDO pertence) throws Exception {
        Transacao tr = new Transacao();
        try {
            // inserir validacoes de regras de negocio
            tr.begin();
            PertenceData data = new PertenceData();
            data.excluirPertence(pertence.getIdLab(), pertence.getIdAssis(), tr);
            tr.commit();
            return true;
        } catch (Exception e) {
            tr.rollback();
            System.out.println("erro ao excluir");
            e.printStackTrace();
        }
        return false;
    }

    public Vector pesquisar_labs(int id_professor) {
    if (id_professor == 0)
        return null;

     Transacao tr = new Transacao();
     try {
             tr.beginReadOnly();
             PertenceData data = new PertenceData();
             Vector v = data.procurar_labs(id_professor, tr);
             tr.commit();
             return v;
     } catch(Exception e) {
         System.out.println("erro ao pesquisar");
         e.printStackTrace();
     }
     return null;
  } // pesquisar

  public Vector pesquisar_assistentes(int id_projeto) {
    if (id_projeto == 0)
        return null;

     Transacao tr = new Transacao();
     try {
             tr.beginReadOnly();
             PertenceData data = new PertenceData();
             Vector v = data.procurar_assistentes(id_projeto, tr);
             tr.commit();
             return v;
     } catch(Exception e) {
         System.out.println("erro ao pesquisar");
         e.printStackTrace();
     }
     return null;
  } // pesquisar
    
  public static void main(String[] args) {
  } // main
}
