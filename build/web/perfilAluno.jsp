<%-- 
    Document   : aluno
    Created on : Dec 3, 2015, 2:57:13 PM
    Author     : Gregorio
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="transacoes.Aluno"  %>
<%@ page import="data.AlunoDO"      %>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="CSS/styles.css" type="text/css" />
        <meta http-equiv="Content-Type" content="text/htm l;charset=UTF-8">
        <title>Perfil de aluno</title>
    </head>
    
    <body>
<%
    // Verificacao do usuario logado
    String nusp_logado = (String)session.getAttribute("nusp_logado");
    if (null == nusp_logado) {
        %>
        <script type="text/JavaScript">
            alert("Sessão expirada!"); 
        </script>
        <%
        pageContext.forward("login.jsp");
    }
        
    // Busca usuario por ID
    String userId = request.getParameter("UserId");
    int id = Integer.parseInt(userId);

    transacoes.Aluno al = new transacoes.Aluno();
    data.AlunoDO aluno = al.buscar(id);
    
    // atualiza atributos do aluno de id UserID
    String nusp         = aluno.getNusp(); 
    String email        = aluno.getEmail();
    String nome         = aluno.getNome();  
    String sobrenome    = aluno.getSobrenome();
    String link_lattes  = aluno.getLattes();
    String instituicao  = aluno.getInstituicao();
    String codigo_CV    = aluno.getCv();
    String codigo_Hist  = aluno.getHist();
    
%>
        <section id="body" class="width">
            <aside id="sidebar" class="column-left">

                <header>
                    <h1><a href="#">PoliNet</a></h1>
                    <h2>Seja bem vindo!</h2>
                </header>
			
                <h1 align="right">Usu&aacute;rio</h1>

                <nav id="mainnav"> <ul>
                    <li><a href="index.jsp">Home</a></li>
                    <li class="selected-item"><a href="#">Perfil</a></li>
                    <li><a href="pesquisa.jsp">Pesquisa</a></li>
                    <li><a href="login.jsp?UserId=<%=userId%>&acao=logout">Logout</a></li>
                    <li><a href="sobreNos.jsp">Sobre n&oacute;s</a></li>
                </ul> </nav>
            </aside>
	
	    <section id="content" class="column-right">
                  		
        	<article>
        	    
                    <p id="paginaURL"></p>
				
                    <h1>Nome completo: <%= nome +" "+ sobrenome %></h1>
                    <p>
                    <p2>Institui&ccedil;&atilde;o: <%= instituicao %> <br /></p2>
                    <p2>Descri&ccedil;&atilde;o do usu&aacute;rio: atolado de trabalhos <br />
                    <p2>N&uacute;mero USP: <%= nusp %> <br /></p2>
                    <p2>Link Currículo Lattes: <%= link_lattes %> <br /></p2>
<!--                    <p2>Código CV: <%= codigo_CV %> Código Histórico: <%= codigo_Hist %> <br /></p2>-->
                    <p2>E-mail: <%= email %> <br /></p2>   
                    </p>		

        	</article>

                <fieldset>
                    <legend>Pesquisas</legend>
                    <table border="1" >
                       <tr>
                            <td width="80px">T&iacute;tulo: Oportunidade de pesquisa 1</td>
                            <td>Descri&ccedil;&atilde;o: desc1 </td>
                       </tr>
                       <tr>
                            <td>T&iacute;tulo: Oportunidade de pesquisa 2</td>
                            <td>Descri&ccedil;&atilde;o: desc2 </td>
                       </tr>
                    </table>

                   <!--ALTERADO-->
                    <%  if(nusp.equals(nusp_logado)){
                        
                        %>
                        <!--BOTÃO DE EDITAR PERFIL-->
                    <form><INPUT type="submit" class="formbutton" formaction="editPerfilAluno.jsp" value="Editar Perfil"></form>
                    <% } 
                    	%>

                </fieldset>
                    <br/>

                    <img src="images/usp_relogio_red.jpg" class="resize" alt="" />
        	
                <footer class="clear">
                    <p>&copy; 2015 PoliNet. Desenvolvido para a disciplina PMR 2490 - Sistemas de Informa&ccedil;&atilde;o</p>
        	</footer>

            </section> <!-- fim do section:content -->
		<div class="clear"></div>
	</section>  <!-- fim do section:body -->
	
        <%
    // Acao dar logout      FALTA implementar
//    String acao = request.getParameter("acao");
//    if (acao.equals("logout")) {
//        request.getSession().invalidate();
//        response.sendRedirect("index.jsp");
//        
//    }
    %>
        
    </body>
</html>
