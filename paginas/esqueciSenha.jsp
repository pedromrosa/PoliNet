<%-- 
    Document   : esqueciSenha
    Created on : 29/11/2015, 11:59:06
    Author     : Humberto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="CSS/styles.css" type="text/css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Esqueci a senha</title>
    </head
    
    <body>
        <section id="body" class="width">
            <aside id="sidebar" class="column-left">

                <header>
                    <h1><a href="#">PoliNet</a></h1>
                    <h2>Seja bem vindo!</h2>
                </header>

                <nav id="mainnav"> <ul>
                    <li><a href="index.jsp">Home</a></li>
                    <li class="selected-item"><a href="login.jsp">Login</a></li>
                    <li><a href="sobreNos.jsp">Sobre n&oacute;s</a></li>
                </ul> </nav>
            </aside>
            <section id="content" class="column-right">
                  		
        	<article>
        
                    <h1>&iquest;&iquest;Esqueci a senha??</h1>&nbsp;&nbsp; 
                    <p>Entre com seu login cadastrado e n&uacute;mero USP para verifica&ccedil;&atilde;o no banco de dados.</p>
			  
                    <fieldset>
                        <legend>Recuperar senha</legend>
                        <FORM onsubmit="procuraSenha()" method="post">
				
                            <p><label for="text">Login:</label>
                            <input type="text" name="login" id="login" value=""/><br /></p>
				  
                            <p><label for="text">N&uacute;mero USP:</label>
                            <input type="text" name="nusp" id="nusp" value=""/><br /></p>
				  
                            <p><INPUT type="submit" class="formbutton" value="Recuperar Senha">
                            <INPUT type="reset" class="formbutton" value="Limpar dados"></p>

                        </FORM>
                    </fieldset>	
              
                    <img src="images/usp_relogio_red.jpg" class="resize" alt="" />
        
        	</article>
        			
        	<footer class="clear">
                    <p>&copy; 2015 PoliNet. Desenvolvido para a disciplina PMR 2490 - Sistemas de Informa&ccedil;&atilde;o</p>
        	</footer>

            </section>
            <div class="clear"></div>
	</section>
	
        <script type="text/javascript">
            function procuraSenha() {
                             // a implementar
            }
        </script>
    </body>
</html>
