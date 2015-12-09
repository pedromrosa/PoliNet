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
public class Cria{
    
    public boolean incluir(CriaDO cria) throws Exception{
        
        // validacao das regras de negocio
        if ( cria.getIdProf() == 0 || cria.getIdProjeto() == 0 ) {
            return false;
        }
        
        // efetuando a trasacao
        Transacao tr = new Transacao();
        try {
            tr.begin();
            CriaData data = new CriaData();
            data.incluir(cria, tr);
            tr.commit();
            return true;
        } catch(Exception e) {
            tr.rollback();
            System.out.println("erro ao incluir");
            e.printStackTrace();
        }
        return false;
    }
 
    public boolean excluirCria(CriaDO cria) throws Exception {
        Transacao tr = new Transacao();
        try {
            // inserir validacoes de regras de negocio
            tr.begin();
            CriaData data = new CriaData();
            data.excluirCria(cria.getIdProjeto(), cria.getIdProf(), tr);
            tr.commit();
            return true;
        } catch (Exception e) {
            tr.rollback();
            System.out.println("erro ao excluir");
            e.printStackTrace();
        }
        return false;
    }

    public Vector pesquisar_projetos(int id_professor) {
    if (id_professor == 0)
        return null;

     Transacao tr = new Transacao();
     try {
             tr.beginReadOnly();
             CriaData data = new CriaData();
             Vector v = data.procurar_projetos(id_professor, tr);
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
             CriaData data = new CriaData();
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
