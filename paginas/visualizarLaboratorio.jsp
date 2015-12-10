<%--   
    Document   : visualizarLaboratorio
    Created on : Dec 9, 2015, 4:25:21 AM
    Author     : HeitorCarvalho
--%>

<%@ page import="transacoes.Laboratorio" %>
<%@ page import="data.LaboratorioDO" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="CSS/styles.css" type="text/css" />
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
        <title>Página do Laboratório</title>
    </head>
    <body>
<%  
            // pega o nusp do usuario logado
            String nusp_logado = (String)session.getAttribute("nusp_logado");

            // pega o Id do projeto
            int labID = Integer.parseInt(request.getParameter("UserId"));
            
                transacoes.Laboratorio tu = new transacoes.Laboratorio();
                data.LaboratorioDO lab = tu.pesquisa_id_lab(labID);
                
                String nome = lab.getNome(); 
                String descricao = lab.getDescricao();
                String departamento = lab.getDepartamento();  
                String link_site = lab.getSite();
%>
        <section id="body" class="width">
            <aside id="sidebar" class="column-left">

                <header>
                    <h1><a href="#">PoliNet</a></h1>
                    <h2>Seja bem vindo!</h2>
                </header>
			
                <h1 align="right">Laborat&oacute;rio</h1>

                <nav id="mainnav"> <ul>
                    <li><a href="index.jsp">Home</a></li>
                    <li class="selected-item"><a href="#">Perfil</a></li>
                    <li><a href="pesquisa.jsp">Pesquisa</a></li>
                    <li><a href="logout.jsp">Logout</a></li>
                    <li><a href="sobreNos.jsp">Sobre n&oacute;s</a></li>
                </ul> </nav>
            </aside>
	
	    <section id="content" class="column-right">
                  		
        	<article>
        	    
                    <p id="paginaURL"></p>
				
                    <h1>Laborat&oacute;rio <%= nome %></h1>
                    <p>
                    <p2>Descri&ccedil;&atilde;o do projeto: <%= descricao %> <br /></p2>
                    <p2>Departamento: <%= departamento %> <br /></p2>
                    <p2>Link Site: <%= link_site %> <br /></p2>
                    </p>		

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