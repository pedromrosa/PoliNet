<%-- 
    Document   : selecionaCadastro
    Created on : 29/11/2015, 11:39:50
    Author     : Humberto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="CSS/styles.css" type="text/css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Seleciona Cadastro</title>
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
                    <li class="selected-item"><a href="login.jsp">Login</a></li>
                    <li><a href="sobreNos.jsp">Sobre n&oacute;s</a></li>
                </ul> </nav>
            </aside>
    	<section id="content" class="column-right">
                  		
            <article>

                <h2>Sele&ccedil;&atilde;o de cadastro</h2>&nbsp;&nbsp; 
                <p>Entre com o seu n&uacute;mero USP para valida&ccedil;&atilde;o de cadastro no banco de dados. Depois, informe se &eacute; aluno ou professor.</p>

                <fieldset>
                    <legend>Escolha o tipo de cadastro</legend>

                    <FORM name="form1" onsubmit="verificaEntrada()" method="post">
                        <p><label for="text">N&uacute;mero USP:</label>
                        <input type="text" name="nusp" id="nusp" value=""/><br /></p>

                        <p><input name="selecao" type="radio" id="aluno" /> Aluno &nbsp; 
                        <input name="selecao" type="radio" id="professor" /> Professor<br/></p>

                        <p><INPUT type="submit" class="formbutton" value="Selecionar"></p>

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
            function verificaEntrada() {

               if (document.getElementById("aluno").checked) {
                      document.form1.action = "cadastraAluno.jsp";
                } else { 
                    if (document.getElementById("professor").checked) {
                      document.form1.action = "cadastraProfessor.jsp";
                      // alert("puff");
                    }
                }
            }
        </script>
    </body>
</html>
