<%--   
    Document   : visualizarProjeto
    Created on : Dec 9, 2015, 4:25:21 AM
    Author     : HeitorCarvalho
--%>
<%@page import="data.CandidataDO"%>
<%@page import="java.util.Vector"%>
<%@page import="data.VinculoDO"%>
<%@page import="data.UsuarioDO"%>
<%@ page import="transacoes.Projeto" %>
<%@ page import="data.ProjetoDO" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="CSS/styles.css" type="text/css" />
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
        <title>Página do Projeto</title>
    </head>
    <body>
<%  
            // reconhece acao
            String acao = request.getParameter("acao");

            // pega o nusp do usuario logado
            String nusp_logado = (String)session.getAttribute("nusp_logado");
            transacoes.Usuario tn = new transacoes.Usuario();
            UsuarioDO usuario = tn.buscarNusp(nusp_logado);
            
                // pega o Id do projeto
                int projetoID = Integer.parseInt(request.getParameter("UserId"));        
                transacoes.Projeto tu = new transacoes.Projeto();
                data.ProjetoDO projeto = tu.pesquisa_id(projetoID);
                
                String titulo = projeto.getTitulo(); 
                String descricao = projeto.getDescricao();
                String palavrachave1 = projeto.getKW1();  
                String palavrachave2 = projeto.getKW2();
                String palavrachave3 = projeto.getKW3();
                int inicio = projeto.getInicio();
                int fim = projeto.getFim();
                int laboratorio = projeto.getLab();
                String patrocinador = projeto.getPatrocinador();
%>
        <section id="body" class="width">
            <aside id="sidebar" class="column-left">
                <header>
                    <h1><a href="#">PoliNet</a></h1>
                    <h2>Seja bem vindo!</h2>
                </header>
			
                <h1 align="right">Projeto</h1>
                <nav id="mainnav"> <ul>
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="visualizarPerfil.jsp">Perfil</a></li>
                    <li class="selected-item"><a href="#">Pesquisa</a></li>
                    <li><a href="logout.jsp">Logout</a></li>
                    <li><a href="sobreNos.jsp">Sobre n&oacute;s</a></li>
                </ul> </nav>
            </aside>
	
	    <section id="content" class="column-right">
                  		
        	<article>
        	    
                    <p id="paginaURL"></p>
				
                    <h1>Projeto <%= titulo %></h1>
                    <p>
                    <p2>Descri&ccedil;&atilde;o do projeto: <%= descricao %> <br /></p2>
                    <p2>Palavras-chave: <%= palavrachave1 + ", " + palavrachave2 + ", " + palavrachave3 %> <br /></p2>
                    <p2>Semestre In&iacute;cio: <%= inicio %> <br /></p2>
                    <p2>Semestre Fim: <%= fim %> <br /></p2>
                    <p2>Laborat&oacute;rio Vinculado (ID): <%= laboratorio %> <br /></p2>
                    <p2>Patrocinador: <%= patrocinador %> <br /></p2>
                    </p>
<%                                   
                    // Verificacao do tipo de usuario logado
                    if ((usuario.getVinculo()).equals("aluno") && acao == null) {
                        transacoes.Candidata tc = new transacoes.Candidata();
                        if (tc.compara(usuario.getId(), projetoID) == false) {
                        %>
                            <a class="button" href="visualizarProjeto.jsp?acao=candidatar&ProjId=<%= projetoID %>&UserId=<%= usuario.getId()%>">Candidatar-se ao Projeto</a>
                        <%   
                        }
                    }

                    if ("professor".equals(usuario.getVinculo())) {
                        transacoes.Cria tc = new transacoes.Cria();
                        if (tc.compara(usuario.getId(), projetoID)) {
                        %>
                            <a class="button" href="verificaCandidatura.jsp?ProjId=<%=projetoID%>&UserId=<%=usuario.getId()%>">Avaliar candidatura(s)</a>
                        <% 
                        }
                    }
                    
                    // Vericacao da acao
                     if ("candidatar".equals(acao)) {
                           
                        CandidataDO candidato = new CandidataDO();
                        
                        // relaciona o id do usuario e do lab
                        candidato.setIdAluno(usuario.getId());
                        candidato.setIdProjeto(projetoID);
                        
                        transacoes.Candidata t1 = new transacoes.Candidata();
                        t1.incluir(candidato);
%>
                    <script type="text/JavaScript"> alert("Candidatura realizada com êxito!");</script>
<%
                        }
%>
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