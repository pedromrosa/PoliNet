<%-- 
    Document   : index
    Created on : 01/10/2009, 18:29:29
    Author     : 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <link rel="stylesheet" href="CSS/styles.css" type="text/css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tela inicial</title>
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
                    <li class="selected-item"><a href="index.jsp">Home</a></li>
                    <li><a href="login.jsp">Login</a></li>
                    <li><a href="sobreNos.jsp">Sobre n&oacute;s</a></li>
                </ul> </nav>
                <%  // Barra lateral para logado
                    } else {
                %>
                <nav id="mainnav"> <ul>
                    <li class="selected-item"><a href="#">Home</a></li>
                    <li><a href="visualizarPerfil.jsp">Perfil</a></li>
                    <li><a href="pesquisa.jsp">Pesquisa</a></li>
                    <li><a href="mensagem.jsp">Correio</a></li>
                    <li><a href="logout.jsp">Logout</a></li>
                    <li><a href="sobreNos.jsp">Sobre n&oacute;s</a></li>
                </ul> </nav>
                <%
                    }
                %>
                
            </aside>
            <section id="content" class="column-right">
                  		
        	<article>
        
                    <h1>Seja bem vindo!!</h1>
                    <p>Essa &eacute; a <strong>PoliNet</strong>, onde voc&ecirc; encontra a oportunidade de pesquisa mais adequada a voc&ecirc;.</p>		
                    
                    
                    <fieldset>
                        <br/>
                        <p>Nós da <b>PoliNet</b> entendemos como encontrar o projeto perfeito ou o melhor aluno para seu projeto de pesquisa podem ser tarefas difíceis.
                           Pensando nisso, criamos um espaço onde alunos e professores podem se conectar e compartilhar informações sobre as diversas oportunidades dentro da Escola.</p>
                        <br/>
                        <br/>
                        <p>Faça já o seu cadastro e entre nessa nova rede que veio para te ajudar!</p>
                    </fieldset>
                    
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
