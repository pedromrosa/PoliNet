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
public class Candidata{
    
    public boolean incluir(CandidataDO candidata) throws Exception{
        
        // validacao das regras de negocio
        if ( candidata.getIdAluno() == 0 || candidata.getIdProjeto() == 0 ) {
            return false;
        }
        
        // efetuando a trasacao
        Transacao tr = new Transacao();
        try {
            tr.begin();
            CandidataData data = new CandidataData();
            data.incluir(candidata, tr);
            tr.commit();
            return true;
        } catch(Exception e) {
            tr.rollback();
            System.out.println("erro ao incluir");
            e.printStackTrace();
        }
        return false;
    }
 
    public boolean excluir(CandidataDO candidata) throws Exception {
        Transacao tr = new Transacao();
        try {
            // inserir validacoes de regras de negocio
            tr.begin();
            CandidataData data = new CandidataData();
            data.excluir(candidata.getIdAluno(), tr);
            tr.commit();
            return true;
        } catch (Exception e) {
            tr.rollback();
            System.out.println("erro ao excluir");
            e.printStackTrace();
        }
        return false;
    }

    public boolean compara(int id_aluno, int id_projeto) throws Exception {
        Transacao tr = new Transacao();
        try {
            tr.beginReadOnly();
            CandidataData cdata = new CandidataData();
            CandidataDO candidata = cdata.verifica_aluno(id_aluno, id_projeto, tr);
            tr.commit();
            if (null != candidata) {
                return true;
            }
        } catch (Exception e) {
            System.out.println("erro ao comparar");
            e.printStackTrace();
        }
        return false;
    }    
    
    public Vector pesquisar_projetos(int id_aluno) {
    if (id_aluno == 0)
        return null;

     Transacao tr = new Transacao();
     try {
             tr.beginReadOnly();
             CandidataData data = new CandidataData();
             Vector v = data.procurar_projetos(id_aluno, tr);
             tr.commit();
             return v;
     } catch(Exception e) {
         System.out.println("erro ao pesquisar");
         e.printStackTrace();
     }
     return null;
  } // pesquisar

  public Vector pesquisar_alunos(int id_projeto) {
    if (id_projeto == 0)
        return null;

     Transacao tr = new Transacao();
     try {
             tr.beginReadOnly();
             CandidataData data = new CandidataData();
             Vector v = data.procurar_alunos(id_projeto, tr);
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
