<%-- 
    Document   : pesquisaLab
    Created on : 29/11/2015, 12:33:40
    Author     : Pedro
--%>
<%@ page import="data.ProjetoDO" %>
<%@ page import="data.LaboratorioDO" %>
<%@ page import="java.util.Vector" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="CSS/styles.css" type="text/css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Diretório</title>
    </head>
    <body>
	<section id="body" class="width">
            <aside id="sidebar" class="column-left">
                <header>
                    <h1><a href="#">PoliNet</a></h1>
                    <h2>Seja bem vindo!</h2>
                </header>
                <h1 align="right">Usu&aacute;rio</h1>
                <nav id="mainnav"> <ul>
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="visualizarPerfil.jsp">Perfil</a></li>
                    <li><a href="pesquisa.jsp">Pesquisa</a></li>
                    <li class="selected-item"><a href="#">Diret&oacute;rio</a></li>
                    <li><a href="mensagem.jsp">Correio</a></li>
                    <li><a href="logout.jsp">Logout</a></li>
                    <li><a href="sobreNos.jsp">Sobre n&oacute;s</a></li>
                </ul> </nav>
            </aside>
	
            <section id="content" class="column-right">
                  		
        	<article>
        
                    <h1>Diret&oacute;rio</h1>&nbsp;
                    <p> Escolha o campo de pesquisa</p>&nbsp;
			  
                    <fieldset>
                        <legend>Diret&oacute;rio de Projetos e Laboratórios</legend>
                        <FORM action="" method="post">
				
                        <p>Selecione o que pesquisar:<label for="text"></label>
                            <select name="campoPesquisa">
                                <option value="vazio" selected="selected" />
                                <option value="labor">Laborat&oacute;rios</option>
                                <option value="proje">Projetos</option>
                            </select></p>                    
                            
                        <p><INPUT type="submit" class="formbutton" value="Pesquisar"></p>
                        <input type="hidden" name="pesquisa" value="true"/>
                        
<%                  if ( null != request.getParameter("pesquisa")){
                        if ("vazio".equals(request.getParameter("campoPesquisa"))){
%>       
                        <script type="text/JavaScript"> alert("Selecione um campo!");</script>
<%                      }
                        if ("labor".equals(request.getParameter("campoPesquisa"))){
                            Vector deplist = new Vector();
                            deplist.add("PME");
                            deplist.add("PMR");
                                
                            for (int j = 0; j < deplist.size(); j++) {
%>
                        <fieldset>
                        <legend> Departamento: <%=deplist.elementAt(j) %></legend>
<%                              transacoes.Laboratorio tn = new transacoes.Laboratorio();
                                Vector laboratorios = tn.buscarDepartamento((String) deplist.elementAt(j));
                                if ( (laboratorios == null) || (laboratorios.size() == 0)){
%>				  
                        <p> Nenhum laborat&oacute;rio neste departamento!</p>
<%                              } else {           
%>
                        <table>
                        <tr>
                           <td>Nome</td>
                           <td>Descri&ccedil;&atilde;o</td>
                           <td>Link Site</td>
                        </tr>
<%                                  for(int i = 0; i < laboratorios.size(); i++) {
                                        LaboratorioDO laboratorio = (LaboratorioDO)laboratorios.elementAt(i);
%>                      <tr>
                            <td><%= laboratorio.getNome() %></td>
                            <td><%= laboratorio.getDescricao() %></td>
                            <td><%= laboratorio.getSite() %></td>
                            <td><a href=pesquisa.jsp?visualizar=laboratorio&id=<%= laboratorio.getId()%>>Visualizar Laboratorio</a></td>
                        </tr>        
<%                                      }
%>
                      </table>
                      </fieldset>
<%                                  }
                                }
                        }
                        if ("proje".equals(request.getParameter("campoPesquisa"))){
                            Vector deplist = new Vector();
                            deplist.add("PME");
                            deplist.add("PMR");
                            
                            for (int k = 0; k < deplist.size(); k++) {
                                %>
                            <fieldset>
                            <legend> Departamento: <%=deplist.elementAt(k) %></legend>
                                <%
                                transacoes.Laboratorio tl = new transacoes.Laboratorio();
                                Vector laboratorios = tl.buscarDepartamento((String) deplist.elementAt(k));
                                if ( (laboratorios == null) || (laboratorios.size() == 0)){
%>				  
                        <p> Nenhum laborat&oacute;rio neste departamento!</p>
<%                              } else {           
                                for (int j = 0; j < laboratorios.size(); j++) {
                                    LaboratorioDO labor = (LaboratorioDO)laboratorios.elementAt(j);
%>
                            <legend> Laborat&oacute;rio: <%=labor.getNome() %></legend>
<%                              transacoes.Projeto tp = new transacoes.Projeto();
                                Vector projetos = tp.pesquisa_id_lab(labor.getId());
                                if ( (projetos == null) || (projetos.size() == 0) ) {
%>				  
                            <p> Nenhum projeto neste laborat&oacute;rio!</p>
<%                              } else {
%>
                            <table>
                            <tr>
                                <td><b>T&iacute;tulo</b></td>
                                <td><b>Descri&ccedil;&atilde;o</b></td>
                                <td><b>Palavra-Chave 1</b></td>
                                <td><b>Palavra-Chave 2</b></td>
                                <td><b>Palavra-Chave 3</b></td>
                                <td><b>Semestre de In&iacute;cio</b></td>
                                <td><b>Semestre de Término</b></td>
                                <td><b>Patrocinador</b></td>
                            </tr>
<%                      
                                for(int i = 0; i < projetos.size(); i++) {
                                        ProjetoDO projeto = (ProjetoDO)projetos.elementAt(i);
%>
                            <tr>
                                <td><%= projeto.getTitulo() %></td>
                                <td><%= projeto.getDescricao() %></td>
                                <td><%= projeto.getKW1() %></td>
                                <td><%= projeto.getKW2() %></td>
                                <td><%= projeto.getKW3() %></td>
                                <td><%= projeto.getInicio() %></td>
                                <td><%= projeto.getFim() %></td>
                                <td><%= projeto.getPatrocinador() %></td>
                                <td><a href=pesquisa.jsp?visualizar=projeto&id=<%= projeto.getId()%>>Visualizar Projeto</a></td>
                            </tr>        
<%                                      }
%>
                        </table>
                        </fieldset>
<%                                  }
                                }
                            }
                        }
                    }
            }
%>
                        </FORM>
                    </fieldset>	
                    <fieldset>
       <!-- Direcionar a partir da hiperlink "vizualizar" -->                        
<%                      if ("perfil".equals(request.getParameter("visualizar"))) {
                            String ID = request.getParameter("id");
                            response.sendRedirect("visualizarPerfil.jsp?UserId=" + ID);
}
                        if ("laboratorio".equals(request.getParameter("visualizar"))) {
                            String ID = request.getParameter("id");
                            response.sendRedirect("visualizarLaboratorio.jsp?UserId=" + ID);
}
                        if ("projeto".equals(request.getParameter("visualizar"))) {
                            String ID = request.getParameter("id");
                            response.sendRedirect("visualizarProjeto.jsp?UserId=" + ID);
}
%>
                    </fieldset>
        	</article>
        			
                <img src="images/usp_relogio_red.jpg" class="resize" alt="" />
			
        	<footer class="clear">
                    <p>&copy; 2015 PoliNet. Desenvolvido para a disciplina PMR 2490 - Sistemas de Informa&ccedil;&atilde;o</p>
        	</footer>

            </section>
	</section>
    </body>
</html>
