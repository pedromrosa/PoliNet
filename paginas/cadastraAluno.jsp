<%-- 
    Document   : cadastraAluno
    Created on : 29/11/2015, 11:44:48
    Author     : Humberto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="data.UsuarioDO"     %>
<%@ page import="transacoes.Usuario" %>
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
                    <FORM method="post">

                        <p><label for="text">Nome:</label>
                        <input type="text" name="nome" value=""/><br /></p>
                        
                        <p><label for="text">Sobrenome:</label>
                        <input type="text" name="sobrenome" value=""/><br /></p>
                        
                        <p><label for="text">E-mail:</label>
                        <input type="text" name="email" value=""/><br /></p>

                        <p><label for="text">Senha:</label>
			<input type="password" name="senha" value=""/><br /></p>
				  
                        <p><label for="text">Institui&ccedil;&atilde;o:</label>
                            <select name="instituicao">
                                <option value="" selected="selected" />
                                <option value="POLI">Escola Polit&eacute;cnica</option>
                                <option value="IF">Insituto de F&iacute;sica</option>
                            </select></p>
	
                        <p><label2 for="text">Link do curr&iacute;culo Lattes:</label2>
                        <input type="text" name="linkLattes" value="http://" size="80"/><br /></p>

                        <p><label2 for="text">C&oacute;digo do hist&oacute;rico:</label2>
                        <input type="text" name="codHist" value=""/><br /></p>
			
                        <p><INPUT type="submit" class="formbutton" value="Cadastrar">
                        <INPUT type="reset" class="formbutton" value="Limpar dados"></p>
                        <input type="hidden" name="cadastra" value="true" />

        	    </FORM>
                </fieldset>	

            </article>
        			
            <footer class="clear">
                <p>&copy; 2015 PoliNet. Desenvolvido para a disciplina PMR 2490 - Sistemas de Informa&ccedil;&atilde;o</p>
            </footer>

        </section>
        <div class="clear"></div>
    </section>
	
    <% 
        if ("true".equals(request.getParameter("cadastra"))) {
            
            String nusp        = request.getParameter("nusp");
            String nome        = request.getParameter("nome");
            String sobrenome   = request.getParameter("sobrenome");
            String email       = request.getParameter("email");
            String senha       = request.getParameter("senha");
            String instituicao = request.getParameter("instituicao");
            String lattes      = request.getParameter("linkLattes");
            String cod_hist    = request.getParameter("codHist");
            
            transacoes.Usuario tu = new transacoes.Usuario();
            data.UsuarioDO usuario = new data.UsuarioDO();
            
            usuario.setNusp(nusp);
            usuario.setNome(nome);
            usuario.setSobrenome(sobrenome);
            usuario.setEmail(email);
            usuario.setSenha(senha);
            usuario.setVinculo("aluno");
            
            if (tu.incluir(usuario)) {
                usuario = tu.buscarNusp(nusp);
                int id  = usuario.getId();
                
                transacoes.Aluno ta = new transacoes.Aluno();
                data.AlunoDO aluno = new data.AlunoDO();
                
                aluno.setId(id);
                aluno.setNusp(nusp);
                aluno.setEmail(email);
                aluno.setNome(nome);
                aluno.setSobrenome(sobrenome);
                aluno.setLattes(lattes);
                aluno.setInstituicao(instituicao);
                aluno.setHist(cod_hist);
                
                if (ta.incluir(aluno)) {
                    %>
                    <script type="text/JavaScript"> alert("Cadastro realizado com sucesso!"); </script>
                    <%
                    response.sendRedirect("login.jsp");
                } 
                else {  // caso de criar usuario e nao criar aluno
                    tu.excluir(usuario);
                %>
                <script type="text/JavaScript"> alert("Erro no cadastro: aluno!"); </script>
                <%
                }
            } else { // caso o cadastro nao for completado
            %>
            <script type="text/JavaScript"> alert("Erro no cadastro:usuario!"); </script>
            <%
            }
        }   // fim do cadastra
    %>
    </body>
</html>
