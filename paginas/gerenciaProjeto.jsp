<%-- 
    Document   : gerenciaProjeto
    Created on : 08/12/2015, 04:18:35
    Author     : Marcos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Vector"  %>
<%@ page import="transacoes.Projeto"%>
<%@ page import="transacoes.Professor"%>
    
<%@ page import="data.ProjetoDO"  %>
<%@ page import="data.ProfessorDO"  %>

<!DOCTYPE html>

<html>
    <head>
        <link rel="stylesheet" href="CSS/styles.css" type="text/css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gerencia Projeto</title>
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

                <h2>Na ger&ecirc;ncia do projeto</h2>&nbsp;&nbsp; 
                <p>Aqui pode ser feita a administra&ccedil;&atilde;o de seus projetos.</p>

                <fieldset>
                    <legend>Funcionalidades</legend>

                    <FORM name="form1" onsubmit="verificaEntrada()" method="post">
                        
                        <p><a href="cadastraProjeto.jsp">Cadastro de novos projetos</a>
                                <br />
                        <p><a href="editaProjeto.jsp">Edi&ccedil;&atilde;ode novos projetos</a>
                                <br />
                      
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