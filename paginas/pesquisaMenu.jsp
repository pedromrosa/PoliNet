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
        <title>Tela de pesquisa</title>
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
                    <li><a href="usuario.jsp">Perfil</a></li>
                    <li class="selected-item"><a href="#">Pesquisa</a></li>
                    <li><a href="mensagem.jsp">Correio</a></li>
                    <li><a href="logout.jsp">Logout</a></li>
                    <li><a href="sobreNos.jsp">Sobre n&oacute;s</a></li>
                </ul> </nav>
            </aside>
	
            <section id="content" class="column-right">
                  		
        	<article>
        
                    <h1>Tela de diret&oacute;rio</h1>&nbsp;
                    <p> Escolha o campo de pesquisa</p>&nbsp;
			  
                    <fieldset>
                        <legend>Diret&oacute;rio de Projetos e Laboratórios</legend>
                        <FORM action="usuario.jsp" method="post">
				
                        <p>Selecione o que pesquisar:<label for="text"></label>
                            <select name="campoPesquisa">
                                <option value="vazio" selected="selected" />
                                <option value="labor">Laborat&oacute;rios</option>
                                <option value="proje">Projetos</option>
                            </select></p>
				  				  
                        <p><INPUT type="submit" class="formbutton" value="Pesquisar">
                        <INPUT type="reset" class="formbutton" value="Limpar pesquisa"></p>
<%                      if ("vazio".equals(request.getParameter("campoPesquisa"))){
%>       
                        <script type="text/JavaScript"> alert("Selecione um campo!");</script>
<%                      }
                        if ("labor".equals(request.getParameter("campoPesquisa"))){
                            Vector deplist = new Vector();
                            deplist.add("PME");
                            deplist.add("PMR");
                                
                            for (int j = 0; j < deplist.size(); j++) {
%>
                        <p> Departamento:<%=deplist.elementAt(j) %></p>
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
<%                                      
                                        }
%>
                      </table>
<%                                  }
                                }
                        }
%>
                        </FORM>
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
