<%-- 
    Document   : cadastraAluno
    Created on : 29/11/2015, 11:44:48
    Author     : Humberto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="CSS/styles.css" type="text/css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Aluno</title>
    </head>
    
    <body>
	<section id="body" class="width">
            <aside id="sidebar" class="column-left">

            <header>
                <h1><a href="#">PoliNet</a></h1>
                <h2>Seja bem vindo!</h2>
            </header>

            <nav id="mainnav"> <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="login.jsp">Login</a></li>
                <li><a href="sobreNos.jsp">Sobre n&oacute;s</a></li>
            </ul> </nav>
                
            </aside>
    	<section id="content" class="column-right">
                  		
            <article>
        
                <h1>Tela de cadastro de aluno</h1>&nbsp;&nbsp; 
			  
                <fieldset>
                    <legend>Informe seus dados cadastrais</legend>
                    <FORM action="usuario.jsp" method="post">

                        <p><label for="text">Nome completo:</label>
                        <input type="text" name="nome" id="nome" value=""/><br /></p>
				  
                        <p><label for="text">Login:</label>
                        <input type="text" name="login" id="login" value=""/><br /></p>
				  
                        <p><label for="text">Senha:</label>
    			<input type="password" name="senha" id="senha" value=""/><br /></p>
				  
                        <p><label for="text">Institui&ccedil;&atilde;o:</label>
                            <select name="instituicao">
                                <option value="" selected="selected" />
                                <option value="1">Escola Polit&eacute;cnica</option>
                                <option value="2">Insituto de F&iacute;sica</option>
                            </select></p>
	
                        <p><label for="text">Departamento:</label>
                            <select name="departamento">
                                  <option value="" selected="selected" />
                                  <option value="1">PMR</option>
                                  <option value="2">PME</option>
                            </select></p>

                        <p><label for="text">Laborat&oacute;rio:</label>
                        <input type="text" name="laboratiorio" id="laboratorio" value=""/><br /></p>
				    
                        <p><label2 for="text">Link do curr&iacute;culo Lattes:</label2>
                        <input type="text" name="linkLattes" id="linkLattes" value="http://" size="80"/><br /></p>
				  
                        <p><label2 for="text">C&oacute;digo CV:</label2>
                        <input type="text" name="codCV" id="codCV" value=""/><br /></p>
				  
                        <p><label2 for="text">C&oacute;digo do hist&oacute;rico:</label2>
                        <input type="text" name="codHist" id="codHist" value=""/><br /></p>
			
                        <p><INPUT type="submit" class="formbutton" value="Cadastrar">
                        <INPUT type="reset" class="formbutton" value="Limpar dados"></p>

        	    </FORM>
                </fieldset>	

            </article>
        			
            <footer class="clear">
                <p>&copy; 2015 PoliNet. Desenvolvido para a disciplina PMR 2490 - Sistemas de Informa&ccedil;&atilde;o</p>
            </footer>

        </section>
        <div class="clear"></div>
    </section>
	
    </body>
</html>
