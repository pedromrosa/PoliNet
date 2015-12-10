<%-- 
    Document   : sobreNos
    Created on : 29/11/2015, 12:01:55
    Author     : Humberto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="CSS/styles.css" type="text/css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sobre nós</title>
    </head>
    
    <body>
<%
    // Verificacao do usuario logado
    String nusp_logado = (String)session.getAttribute("nusp_logado");
    
    %>
        <section id="body" class="width">
            <aside id="sidebar" class="column-left">

                <header>
                    <h1><a href="#">PoliNet</a></h1>
                    <h2>Seja bem vindo!</h2>
                </header>

                <%  // Barra lateral para nao logado
                    if (null == nusp_logado) {
                %>
                <nav id="mainnav"> <ul>
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="login.jsp">Login</a></li>
                    <li class="selected-item"><a href="#">Sobre n&oacute;s</a></li>
                </ul> </nav>
                <%  // Barra lateral para logado
                    } else {
                %>
                <nav id="mainnav"> <ul>
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="visualizarPerfil.jsp">Perfil</a></li>
                    <li><a href="pesquisa.jsp">Pesquisa</a></li>
                    <li><a href="mensagem.jsp">Correio</a></li>
                    <li><a href="logout.jsp">Logout</a></li>
                    <li class="selected-item"><a href="#">Sobre n&oacute;s</a></li>
                </ul> </nav>
                <%
                    }
                %>
            </aside>
            <section id="content" class="column-right">
                  		
        	<article>
        
                    <h1>Sobre n&oacute;s</h1>
                    <p>Essa é a <b>PoliNet</b>, uma rede que conecta alunos e professores para a divulgação de oportunidades de pesquisa dentro da Escola Politécnica.</p>
                    <p>A <b>PoliNet</b> foi desenvolvida por um grupo de alunos da Engenharia Mecatrônica para a disciplina de Sistemas de Informação</p>
                    <br/>
                    <br/>
                    <br/>
                    <br/>
                    <img src="images/usp_relogio_red.jpg" class="resize" alt="" />
        
        	</article>
               
        			
        	<footer class="clear">
                    <p>&copy; 2015 PoliNet. Desenvolvido para a disciplina PMR 2490 - Sistemas de Informa&ccedil;&atilde;o</p>
        	</footer>

            </section>
            <div class="clear"></div>
	</section>
	
    </body>
</html>
