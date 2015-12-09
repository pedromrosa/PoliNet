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
public class Mantem{
    
    public boolean incluir(MantemDO mantem) throws Exception{
        
        // validacao das regras de negocio
        if ( mantem.getIdProf() == 0 || mantem.getIdLab() == 0 ) {
            return false;
        }
        
        // efetuando a trasacao
        Transacao tr = new Transacao();
        try {
            tr.begin();
            MantemData data = new MantemData();
            data.incluir(mantem, tr);
            tr.commit();
            return true;
        } catch(Exception e) {
            tr.rollback();
            System.out.println("erro ao incluir");
            e.printStackTrace();
        }
        return false;
    }
 
    public boolean excluirMantem(MantemDO mantem) throws Exception {
        Transacao tr = new Transacao();
        try {
            // inserir validacoes de regras de negocio
            tr.begin();
            MantemData data = new MantemData();
            data.excluirMantem(mantem.getIdLab(), mantem.getIdProf(), tr);
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
             MantemData data = new MantemData();
             Vector v = data.procurar_labs(id_professor, tr);
             tr.commit();
             return v;
     } catch(Exception e) {
         System.out.println("erro ao pesquisar");
         e.printStackTrace();
     }
     return null;
  } // pesquisar

  public Vector pesquisar_professores(int id_projeto) {
    if (id_projeto == 0)
        return null;

     Transacao tr = new Transacao();
     try {
             tr.beginReadOnly();
             MantemData data = new MantemData();
             Vector v = data.procurar_professores(id_projeto, tr);
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
