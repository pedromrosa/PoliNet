<%-- 
    Document   : pesquisa
    Created on : 10/12/2015, 15:40:33
    Author     : Pedro
--%>

<%@ page import="data.ProjetoDO" %>
<%@ page import="data.LaboratorioDO" %>
<%@ page import="java.util.Vector" %>
<%@ page import="transacoes.Usuario" %>
<%@ page import="data.UsuarioDO" %>
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
        
                    <h1>Tela de pesquisa</h1>&nbsp;
                    <p> Entre com o campo de pesquisa</p>&nbsp;
			  
                    <fieldset>
                        <legend>Diret&oacute;rio de Projetos e Laboratórios</legend>
                        <FORM action="" method="post">
				
                        <p>Selecione o campo a ser pesquisado:<label for="text"></label>
                            <select name="campoPesquisa">
                                <option value="vazio" selected="selected" />
                                <option value="perfil">Nome do perfil</option>
                                <option value="laboratorio nome">Nome do laborat&oacute;rio</option>
                                <option value="laboratorio departamento">Departamento (laborat&oacute;rio)</option>
                                <option value="titulo projeto">T&iacute;tulo do projeto</option>
                                <option value="keyword">Palavra-chave do projeto</option>
                            </select></p>
  
                        <p><label for="text">Pesquisa:</label>
                        <input type="text" name="pesquisa" id="pesquisa" value="" size="80" /><br /></p>
				  
                        <p><INPUT type="submit" class="formbutton" value="Pesquisar">
                        <INPUT type="reset" class="formbutton" value="Limpar pesquisa"></p>
<%                      if ( null != request.getParameter("pesquisa")){
                            if ("vazio".equals(request.getParameter("campoPesquisa"))){
%>       
                        <script type="text/JavaScript"> alert("Campo a ser pesquisado não foi selecionado!");</script>
<%                          }
                            if ("perfil".equals(request.getParameter("campoPesquisa"))){
                                String nome = request.getParameter("pesquisa");
                                transacoes.Usuario tn = new transacoes.Usuario();
                                Vector usuarios = tn.buscar(nome);
                                if ( (usuarios == null) || (usuarios.size() == 0)){
%>
                        <script type="text/JavaScript"> alert("Nenhum perfil foi encontrado!");</script>
<%                              } else {
%>
                        <table>
                        <tr>
                           <td><b>N&uacute;mero USP</b></td>
                           <td><b>E-mail</b></td>
                           <td><b>Nome</b></td>
                           <td><b>Sobrenome</b></td>
                           <td><b>V&iacute;nculo</b></td>
                        </tr>
<%                          for(int i = 0; i < usuarios.size(); i++) {
                                UsuarioDO usuario = (UsuarioDO)usuarios.elementAt(i);
%>                      <tr>
                            <td><%= usuario.getNusp() %></td>
                            <td><%= usuario.getEmail() %></td>
                            <td><%= usuario.getNome() %></td>
                            <td><%= usuario.getSobrenome() %></td>
                            <td><%= usuario.getVinculo() %></td>
                            <td><a href=pesquisa.jsp?visualizar=perfil&id=<%= usuario.getId()%>>Visualizar Usuário</a></td>
                        </tr>        
<%                      }   
%>                      </table>            
<%                                }
                            }
                            if ("laboratorio nome".equals(request.getParameter("campoPesquisa"))){
                                String nome = request.getParameter("pesquisa");
                                transacoes.Laboratorio tn = new transacoes.Laboratorio();
                                Vector laboratorios = tn.buscarNome(nome);
                                if ((laboratorios == null) || (laboratorios.size() == 0)){
%>
                        <script type="text/JavaScript"> alert("Nenhum laboratorio com este nome foi encontrado!");</script>
<%                              } else {
%>
                        <table>
                        <tr>
                           <td>Nome</td>
                           <td>Departamento</td>
                           <td>Descri&ccedil;&atilde;o</td>
                           <td>Link Site</td>
                        </tr>
<%                                  for(int i = 0; i < laboratorios.size(); i++) {
                                       LaboratorioDO laboratorio = (LaboratorioDO)laboratorios.elementAt(i);
%>                      <tr>
                            <td><%= laboratorio.getNome() %></td>
                            <td><%= laboratorio.getDepartamento() %></td>
                            <td><%= laboratorio.getDescricao() %></td>
                            <td><%= laboratorio.getSite() %></td>
                            <td><a href=pesquisa.jsp?visualizar=laboratorio&id=<%= laboratorio.getId()%>>Visualizar Laboratorio</a></td>
                        </tr>        
<%                                   }   
%>                      </table>
<%                              }
                            }
                            if ("laboratorio departamento".equals(request.getParameter("campoPesquisa"))){
                                String nome = request.getParameter("pesquisa");
                                transacoes.Laboratorio tn = new transacoes.Laboratorio();
                                Vector laboratorios = tn.buscarDepartamento(nome);
                                if ((laboratorios == null) || (laboratorios.size() == 0)){
%>
                        <script type="text/JavaScript"> alert("Nenhum laboratorio com este departamento foi encontrado!");</script>
<%                              } else {
%>
                        <table>
                        <tr>
                            <td><b>Nome</b></td>
                           <td><b>Departamento</b></td>
                           <td><b>Descri&ccedil;&atilde;o</b></td>
                           <td><b>Link Site</b></td>
                        </tr>
<%                                  for(int i = 0; i < laboratorios.size(); i++) {
                                       LaboratorioDO laboratorio = (LaboratorioDO)laboratorios.elementAt(i);
%>                      <tr>
                            <td><%= laboratorio.getNome() %></td>
                            <td><%= laboratorio.getDepartamento() %></td>
                            <td><%= laboratorio.getDescricao() %></td>
                            <td><%= laboratorio.getSite() %></td>
                            <td><a href=pesquisa.jsp?visualizar=laboratorio&id=<%= laboratorio.getId()%>>Visualizar Laboratorio</a></td>
                        </tr>        
<%                                   }   
%>                      </table>
<%                              }
                            }
                            if ("titulo projeto".equals(request.getParameter("campoPesquisa"))){
                                String nome = request.getParameter("pesquisa");
                                transacoes.Projeto tn = new transacoes.Projeto();
                                Vector projetos = tn.pesquisa_titulo(nome);
                                if ((projetos == null) || (projetos.size() == 0)){
%>
                        <script type="text/JavaScript"> alert("Nenhum projeto com este título foi encontrado!");</script>
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
                           <td><b>Laborat&aacute;rio</b></td>
                           <td><b>Patrocinador</b></td>
                        </tr>
<%                                  for(int i = 0; i < projetos.size(); i++) {
                                       ProjetoDO projeto = (ProjetoDO)projetos.elementAt(i);
%>                      <tr>
                            <td><%= projeto.getTitulo() %></td>
                            <td><%= projeto.getDescricao() %></td>
                            <td><%= projeto.getKW1() %></td>
                            <td><%= projeto.getKW2() %></td>
                            <td><%= projeto.getKW3() %></td>
                            <td><%= projeto.getInicio() %></td>
                            <td><%= projeto.getFim() %></td>
                            <td><%= projeto.getLab() %></td>
                            <td><%= projeto.getPatrocinador() %></td>
                            <td><a href=pesquisa.jsp?visualizar=projeto&id=<%= projeto.getId()%>>Visualizar Projeto</a></td>
                        </tr>        
<%                                   }   
%>                      </table>
<%                                }
                            }
                            if ("keyword".equals(request.getParameter("campoPesquisa"))){
                                String nome = request.getParameter("pesquisa");
                                transacoes.Projeto tn = new transacoes.Projeto();
                                Vector projetos = tn.pesquisa_kw(nome);
                                if ((projetos == null) || (projetos.size() == 0)){
%>
                        <script type="text/JavaScript"> alert("Nenhum projeto com esta palavra-chave foi encontrado!");</script>
<%                              } else{
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
                           <td><b>Laborat&aacute;rio</b></td>
                           <td><b>Patrocinador</b></td>
                        </tr>
<%                                  for(int i = 0; i < projetos.size(); i++) {
                                       ProjetoDO projeto = (ProjetoDO)projetos.elementAt(i);
%>                      <tr>
                            <td><%= projeto.getTitulo() %></td>
                            <td><%= projeto.getDescricao() %></td>
                            <td><%= projeto.getKW1() %></td>
                            <td><%= projeto.getKW2() %></td>
                            <td><%= projeto.getKW3() %></td>
                            <td><%= projeto.getInicio() %></td>
                            <td><%= projeto.getFim() %></td>
                            <td><%= projeto.getLab() %></td>
                            <td><%= projeto.getPatrocinador() %></td>
                            <td><a href=pesquisa.jsp?visualizar=projeto&id=<%= projeto.getId()%>>Visualizar Projeto</a></td>
                        </tr>        
<%                                   }   
%>                      </table>
<%                                }
                            }
                        }
%>		  
                        </FORM>
                    </fieldset>
                    <fieldset>
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