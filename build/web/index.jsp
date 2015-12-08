<%-- 
    Document   : index
    Created on : 01/10/2009, 18:29:29
    Author     : MB
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
    if ( request.getParameter("campo_controle") != null ) {
        // processa login
        String user = request.getParameter("usuario");
        String passwd = request.getParameter("senha");
        // metodo valida deve ser implementado
        //boolean v = valida(user, passwd);
        // simulacao: deve ser 123
        boolean v = "123".equals(passwd);
        if (v) {
           session.setAttribute("user_name", user);
           pageContext.forward("main.jsp");
        } else {
   %>
           Usuario ou Senha invalidos!
   <%
        }
    }
    // show login form
%> <!-- FIM DO MODELO DO TSUZUKI -->
        
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
                    <li><a href="index.jsp">Home</a></li>
                    <li class="selected-item"><a href="#">Perfil</a></li>
                    <li><a href="pesquisa.jsp">Pesquisa</a></li>
                    <li><a href="login.jsp?acao=logout">Logout</a></li>
                    <li><a href="sobreNos.jsp">Sobre n&oacute;s</a></li>
                </ul> </nav>
                <%
                    }
                %>
                
            </aside>
            <section id="content" class="column-right">
                  		
        	<article>
        
                    <h1>Seja bem vindo!!</h1>
                    <p>Essa &eacute; a <strong>PoliNet</strong>, onde voc&ecirc; encontra a oportunidade de pesquisa mais adequada &agrave; voc&ecirc;.</p>		
                    
                    <fieldset>
                        <legend>Faça Login</legend>
                        <form method="post" action=index.jsp>
                            <p><label for="text">USR</label>
                                <input type="text" name="usuario" /><br /></p>
                            <p><label for="text">PWD</label>
                                <input type="password" name="senha" /><br /></p>
                            <p><input type="submit" class="formbutton" name="enviar" value="Enviar" />
                                <input type="hidden" name="campo_controle" /></p>
                        </form>
                    </fieldset>

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
