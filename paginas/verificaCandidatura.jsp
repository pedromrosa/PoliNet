<%-- 
    Document   : verificaCandidatura
    Created on : 10/12/2015, 14:23:16
    Author     : Humberto
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Vector" %>

<%@ page import="transacoes.Usuario"  %>
<%@ page import="data.UsuarioDO"      %>

<%@ page import="transacoes.Vinculo"  %>
<%@ page import="data.VinculoDO"      %>

<%@ page import="transacoes.Projeto"  %>
<%@ page import="data.ProjetoDO"      %>

<%@ page import="transacoes.Laboratorio"  %>
<%@ page import="data.LaboratorioDO"      %>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="CSS/styles.css" type="text/css" />
        <meta http-equiv="Content-Type" content="text/htm l;charset=UTF-8">
        <title>Perfil de assistente</title>
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

        // reconhece o usario logado
        transacoes.Usuario tn = new transacoes.Usuario();
        UsuarioDO usuario = tn.buscarNusp(nusp_logado);

        if ("aluno".equals(usuario.getVinculo())) {
            %>
            <script type="text/JavaScript">
                alert("Você não tem acesso a essa página!"); 
            </script>
            <%
        }
        
        // captura de informacoes do projeto
        int projetoId = Integer.parseInt(request.getParameter("ProjId"));

        transacoes.Projeto tp = new transacoes.Projeto();
        data.ProjetoDO projeto = tp.pesquisa_id(projetoId);

%>
        <section id="body" class="width">
            <aside id="sidebar" class="column-left">

                <header>
                    <h1><a href="#">PoliNet</a></h1>
                    <h2>Seja bem vindo!</h2>
                </header>
			
                <h1 align="right">Usu&aacute;rio</h1>

                <nav id="mainnav"> <ul>
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="visualizarPerfil.jsp">Perfil</a></li>
                    <li class="selected-item"><a href="#">Pesquisa</a></li>
                    <li><a href="mensagem.jsp">Correio</a></li>
                    <li><a href="logout.jsp">Logout</a></li>
                    <li><a href="sobreNos.jsp">Sobre n&oacute;s</a></li>
                </ul> </nav>
            </aside>
	
	    <section id="content" class="column-right">
                  		
        	<article>
        	    
                    <p> Nome do projeto: <%= projeto.getTitulo() %> </p>
                    <fieldset>
                        <legend>Alunos pendentes</legend>
                        <table>


                        </table>		
                    </fieldset>
                    
        	</article>

                
                <br/> 
                <img src="images/usp_relogio_red.jpg" class="resize" alt="" />
        	
                <footer class="clear">
                    <p>&copy; 2015 PoliNet. Desenvolvido para a disciplina PMR 2490 - Sistemas de Informa&ccedil;&atilde;o</p>
        	</footer>

            </section> <!-- fim do section:content -->
		<div class="clear"></div>
	</section>  <!-- fim do section:body -->
	
    </body>
</html>