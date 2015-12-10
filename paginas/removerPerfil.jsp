<%--
    Document   : removerPerfil
    Created on : 08/12/2015, 20:35:08
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
    if (null == nusp_logado) {
        %>
        <script type="text/JavaScript">
            alert("Sessão expirada!"); 
        </script>
        <%
        pageContext.forward("login.jsp");
    }
    
    // Processa apagar
    if ( request.getParameter("apagar") != null ) {
        
        String senha   = (String)request.getParameter("senha");
        
        transacoes.Usuario tu = new transacoes.Usuario();
        data.UsuarioDO usuario = tu.buscarNusp(nusp_logado);
        
        if (usuario == null) {
        %>
            <script type="text/JavaScript"> alert("Usuário inexistente");</script>
        <%
        
        }
        
        else {
            
            // Caso da senha nao corresponder nusp entrado
            if(!senha.equals(usuario.getSenha())) {
            %>
            <script type="text/JavaScript"> alert("Senha incorreta!"); </script>
            <%
            }
            
             else {    // Caso senha seja valida, checa se é professor ou aluno
                
                String vinculo = usuario.getVinculo();
               
                // Verifica o vinculo do usuario
                if ("aluno".equals(vinculo)) {
                    
                    transacoes.Aluno ta = new transacoes.Aluno();
                    data.UsuarioDO aluno = ta.buscarNusp(nusp_logado);
                    ta.excluir(aluno);
                    tu.excluir(usuario);
                    
                                   if (tu.excluir(usuario)&&ta.excluir(aluno)) {
          // avisar usuario que transacao foi feita com sucesso
%>
          Transação realizada com sucesso!

          <form action="./login.jsp" method="post">
             <input type="submit" name="voltar" value="Voltar" />
          </form>
<%              } else {
%>
          Erro ao excluir perfil            
          <form action="./removerPerfil.jsp" method="post">
             <input type="submit" name="retry" value="Repetir" />
          </form>
    <%     }
                    
                }
                else { if ("professor".equals(vinculo)) {
                    transacoes.Professor tp = new transacoes.Professor();
                    data.ProfessorDO professor = tp.buscar(usuario.getId());
                    
                    tu.excluir(usuario);
                    tp.excluir(professor);
                    if (tp.excluir(professor)&&tu.excluir(usuario)) {
          // avisar usuario que transacao foi feita com sucesso
            %>
                Transação realizada com sucesso!

                        <form action="./login.jsp" method="post">
                            <input type="submit" name="voltar" value="Voltar" />
                        </form>
            <%
            } else  {
                %>
                    Erro ao excluir perfil            
                    <form action="./removerPerfil.jsp" method="post">
                        <input type="submit" name="retry" value="Repetir" />
                     </form>
                <%    
                    }

                    }
                }
            }
        }
    }
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

                    <h1>Remover Perfil</h1>&nbsp;&nbsp; 

                    <fieldset>
                        <FORM method="post" action="login.jsp">
                            
                        <legend>Para remover seu perfil, confirme sua senha:</legend>
                        
                            <p><label for="text">Senha:</label>
                            <input type="password" name="senha" value=""/><br /></p>

                            <p><INPUT type="submit" class="formbutton" value="Confirmar"></p>

                            
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
    
    

