<%--
    Document   : login
    Created on : 29/11/2015, 11:08:37
    Author     : Humberto
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Vector"  %>
<%@ page import="transacoes.Usuario"%>
<%@ page import="transacoes.Aluno"%>
<%@ page import="transacoes.Professor"%>

<%@ page import="data.UsuarioDO"    %>
<%@ page import="data.AlunoDO"  %>
<%@ page import="data.ProfessorDO"  %>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="CSS/styles.css" type="text/css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tela de Login</title>
    </head>
    
    <body>
<%
    // Processa login
    if ( request.getParameter("logar") != null ) {
                
        String nusp    = (String)request.getParameter("nusp");
        String senha   = (String)request.getParameter("senha");

        transacoes.Usuario tu = new transacoes.Usuario();
        data.UsuarioDO usuario = tu.buscarNusp(nusp);
        
        // Caso de nao haver contatos com nusp entrado
        if (usuario == null) {
        %> 
            <script type="text/JavaScript"> alert("Usuário inexistente");</script>
        <%
        } else {
            
            // Caso da senha nao corresponder nusp entrado
            if(!senha.equals(usuario.getSenha())) {
            %>
            <script type="text/JavaScript"> alert("Senha incorreta!"); </script>
            <%
            } else {    // Caso login seja valido

                session.setAttribute("nusp_logado", nusp);
                response.sendRedirect("visualizarPerfil.jsp?UserId=" + usuario.getId());
//                if ("aluno".equals(usuario.getVinculo())) {
//                    response.sendRedirect("perfilAluno.jsp?UserId=" + usuario.getId());
//                } else { if ("professor".equals(usuario.getVinculo())) {
//                    response.sendRedirect("perfilProfessor.jsp?UserId=" + usuario.getId());
//                }
////                pageContext.forward("sobreNos.jsp");    // caso nenhum dos outros
//                } // fim - else 
            }
        }
    }
    // show login form
%>     
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

                    <h1>Tela de Login</h1>&nbsp;&nbsp; 

                    <fieldset>
                        <legend>Fa&ccedil;a seu login</legend>
                        <FORM method="post" action="login.jsp">

                            <p><label for="text">Número USP:</label>
                            <input type="text" name="nusp" value=""/><br /></p>

                            <p><label for="text">Senha:</label>
                            <input type="password" name="senha" value=""/><br /></p>

                            <p><INPUT type="submit" class="formbutton" value="Entrar">
                            <INPUT type="reset" class="formbutton" value="Limpar dados"></p>

                            <p><a href="selecionaCadastro.jsp">Cadastrar novo usu&aacute;rio</a>
                                <br />
                            <a href="esqueciSenha.html">Esqueci a senha</a></p>
                            <input type="hidden" name="logar" />
                            
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
    </body>
</html>