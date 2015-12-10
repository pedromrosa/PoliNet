<%-- <%--
    Document   : editarPerfil
    Created on : 09/12/2015, 03:16:44
    Author     : Bruno
--%>




<%@ page import="transacoes.Professor" %>
<%@ page import="data.ProfessorDO" %>
<%@ page import="data.ProfessorData" %>
<%@ page import="transacoes.Aluno" %>
<%@ page import="data.AlunoDO" %>
<%@ page import="data.AlunoData" %>
<%@ page import="transacoes.Usuario" %>
<%@ page import="data.UsuarioDO" %>
<%@ page import="data.UsuarioData" %>
<%@ page import="utils.Transacao" %>


<html>
    <head>
        <link rel="stylesheet" href="CSS/styles.css" type="text/css" />
        <meta http-equiv="Content-Type" content="text/htm l;charset=UTF-8">
        <title>Apagar Perfil</title>
            
    </head>
    
    <body>

<%
    // Verificacao do usuario logado
    String nusp_logado = (String)session.getAttribute("nusp_logado");

    
    // Processa apagar
    if ( "Editar".equals(request.getParameter("Editar"))) {
        
        
        transacoes.Usuario tu = new transacoes.Usuario();
        data.UsuarioDO usuario = tu.buscarNusp(nusp_logado);
        
        String nome = request.getParameter("nome");
        String sobrenome = request.getParameter("sobrenome");
        String login = request.getParameter("login");
        String senha = request.getParameter("senha");
        String instituicao = request.getParameter("instituicao");
        String departamento = request.getParameter("departamento");
        String laboratiorio = request.getParameter("laboratiorio");
        String linkLattes = request.getParameter("linkLattes");
        String codCV = request.getParameter("codCV");
        String codHist = request.getParameter("codHist");
        


        
        
        if (usuario == null) {
        %>
            <script type="text/JavaScript"> alert("Usuário inexistente");</script>
        <%
        
        }
        

             else {    // checa se é professor ou aluno
                
                                %>
                        <script type="text/JavaScript"> alert("Aluno!"); </script>
                    <%
                String vinculo = usuario.getVinculo();
               
                // Verifica o vinculo do usuario
                if ("aluno".equals(vinculo)) {
                    
                    transacoes.Aluno ta = new transacoes.Aluno();
                    data.AlunoDO aluno = ta.buscar(usuario.getId());
                    
                    usuario.setNome(nome);
                    usuario.setSobrenome(sobrenome);
                    usuario.setSenha(senha);
                    
                    aluno.setNome(nome);
                    aluno.setSobrenome(sobrenome);
                    aluno.setSenha(senha);
                    aluno.setLattes(linkLattes);
                    aluno.setHist(codHist);
                    aluno.setCv(codCV);
                                        
                    
                    if (tu.atualizar(usuario)&&ta.atualizar(aluno)) {
          // avisar usuario que transacao foi feita com sucesso
%>
          Atualização realizada com sucesso!

          <form action="./editarPerfil.jsp" method="post">
             <input type="submit" name="voltar" value="Voltar" />
          </form>
<%     } else  {
%>
          Erro ao atualizar perfil            
          <form action="./editarPerfil.jsp" method="post">
             <input type="submit" name="retry" value="Repetir" />
          </form>
    <%     }
                    


                }
                
                else { if ("professor".equals(vinculo)) {
                    
                    transacoes.Professor tp = new transacoes.Professor();
                    data.UsuarioDO professor = tp.buscarNusp(nusp_logado);
                    
                    if (tu.atualizar(usuario)&&tp.atualizar(professor)) {
          // avisar usuario que transacao foi feita com sucesso
%>
          Atualização realizada com sucesso!

          <form action="./editarPerfil.jsp" method="post">
             <input type="submit" name="voltar" value="Voltar" />
          </form>
<%     } else  {
%>
          Erro ao atualizar perfil            
          <form action="./editarPerfil.jsp" method="post">
             <input type="submit" name="retry" value="Repetir" />
          </form>
    <%     }

                    }
                }
            }
        }
    
%>
    
<section id="body" class="width">
            <aside id="sidebar" class="column-left">

                <header>
                    <h1><a href="#">PoliNet</a></h1>
                    <h2>Seja bem vindo!!!
 
                     </h2>
                    
                </header>

                <nav id="mainnav"> <ul>
                        <li><a href="index.jsp">Home</a></li>
                        <li class="selected-item"><a href="login.jsp">Login</a></li>
                        <li><a href="sobreNos.jsp">Sobre n&oacute;s</a></li>
                </ul> </nav>
                
            </aside>
            <section id="content" class="column-right">

                <article>
        
                <h1>Tela de atualização de perfil</h1>&nbsp;&nbsp; 
			  
                <fieldset>
                    <legend>Informe seus dados que deseja atualizar</legend>
                    <FORM method="post">

                        <p><label for="text">Nome</label>
                        <input type="text" name="nome" id="nome" value=""/><br /></p>
			
                        <p><label for="text">Sobrenome</label>
                        <input type="text" name="sobrenome" id="sobrenome" value=""/><br /></p>
			
                        
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
			
                        <p><INPUT type="submit" class="formbutton" value="Editar">
                        <INPUT type="hidden" name = "Editar" value="Editar"></p>

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
    
    


