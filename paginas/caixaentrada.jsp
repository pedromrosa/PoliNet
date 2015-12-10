<%-- 
    Document   : caixaentrada
    Created on : 08/12/2015, 21:35:08
    Author     : Caio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Vector"  %>
<%@ page import="data.UsuarioDO"      %>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="CSS/styles.css" type="text/css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Caixa de entrada</title>
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
                    <li><a href="pesquisa.jsp">Pesquisa</a></li>
                    <li class="selected-item"><a href="#">Correio</a></li>
                    <li><a href="login.jsp">Logout</a></li>
                    <li><a href="sobreNos.jsp">Sobre n&oacute;s</a></li>
                </ul> </nav>
            </aside>
	
            <section id="content" class="column-right">
                  		
        	<article>
        
                    <h1>Caixa de entrada</h1>&nbsp;
			  
                    <fieldset>
                        <legend>Mensagens</legend>
                        <%   if ( null != request.getParameter("pesquisar")) {  
                        String nusp = request.getParameter("nusp");
                        transacoes.Usuario tn = new transacoes.Usuario();
                        Vector usuarios = tn.pesquisar(nusp);
                        if ( (usuarios == null) || (usuarios.size() == 0)) {
                        // avisar usuario que nao ha' contatos com este nusp
%>
          Nenhuma mensagem encontrada
          <form action="./main.jsp" method="post">
             <input type="submit" name="voltar" value="Voltar" />
          </form>
<%     } else {
%>
          <table>
             <tr>
                <td>NUSP</td>
                <td>E-mail</td>
                <td>Nome</td>
                <td>Sobrenome</td>
                <td>Vínculo</td>
             </tr>
<%           for(int i = 0; i < usuarios.size(); i++) {
                UsuarioDO usuario = (UsuarioDO)usuarios.elementAt(i);
%>              <tr>
                   <td><%= usuario.getNusp() %></td>
                   <td><%= usuario.getEmail() %></td>
                   <td><%= usuario.getNome() %></td>
                   <td><%= usuario.getSobrenome() %></td>
                   <td><%= usuario.getVinculo() %></td>
                </tr>        
<%           } // for i      
%>        </table>            
<%     } // contatos retornados
     } // pesquisar
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
