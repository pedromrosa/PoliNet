<%-- 
    Document   : pesquisa
    Created on : 29/11/2015, 12:33:40
    Author     : Humberto
--%>

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
                    <li><a href="login.jsp">Logout</a></li>
                    <li><a href="sobreNos.jsp">Sobre n&oacute;s</a></li>
                </ul> </nav>
            </aside>
	
            <section id="content" class="column-right">
                  		
        	<article>
        
                    <h1>Tela de pesquisa</h1>&nbsp;
                    <p> Entre com o campo de pesquisa</p>&nbsp;
			  
                    <fieldset>
                        <legend>Formul&aacute;rio de pesquisa</legend>
                        <FORM action="usuario.jsp" method="post">
				
                        <p>Selecione o campo a ser pesquisado:<label for="text"></label>
                            <select name="campoPesquisa">
                                <option value="" selected="selected" />
                                <option value="1">por perfil</option>
                                <option value="2">por laborat&oacute;rio</option>
                                <option value="3">por palavra-chave</option>
                            </select></p>
				  
                        <p><label for="text">Pesquisa:</label>
                        <input type="text" name="pesquisa" id="pesquisa" value="" size="80" /><br /></p>
				  
                        <p><INPUT type="submit" class="formbutton" value="Pesquisar">
                        <INPUT type="reset" class="formbutton" value="Limpar pesquisa"></p>
				  
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
