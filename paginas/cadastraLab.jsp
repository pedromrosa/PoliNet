<%-- 
    Document   : gerenciaLab
    Created on : 05/12/2015
    Author     : Leonardo
--%>
<%@ page import="transacoes.Laboratorio" %>
<%@ page import="data.LaboratorioDO" %>
<%@ page import="java.util.Vector" %>

<html>
    <head>
        <link rel="stylesheet" href="CSS/styles.css" type="text/css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Laboratório</title>
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
        
                <h1>Tela de Cadastro de Laboratório</h1>&nbsp;&nbsp; 
			  
                <fieldset>
                    <legend>Informe os dados cadastrais</legend>
                    <FORM action="cadastraLab.jsp" method="post">

                        <p><label for="text">Nome:</label>
                        <input type="text" name="nome" id="nome" value=""/><br /></p>
				  
                        <p><label for="text">Descrição:</label>
                        <input type="text" name="descricao" id="descricao" value=""/><br /></p>
				  				  
                        <p><label for="text">Departamento:</label>
                            <select name="departamento">
                                <option value="" selected="selected" />
                                <option value="1">PMR</option>
                                <option value="2">PME</option>
                            </select></p>
	

                        <p><label for="text">Site:</label>
                        <input type="text" name="site" id="site" value=""/><br /></p>		    
			
                        <p><INPUT type="submit" class="formbutton" value="Cadastrar">
                        <INPUT type="reset" class="formbutton" value="Limpar dados"></p>
                        <input type="hidden" name="entrou" value="true"/>

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
     if("true".equals(request.getParameter("entrou"))) {
    
 
    String nome = request.getParameter("nome");
        String descricao = request.getParameter("descricao");
        String departamento = request.getParameter("departamento");
        String site = request.getParameter("site");
        
        transacoes.Laboratorio tl = new transacoes.Laboratorio();
        data.LaboratorioDO ldo = new data.LaboratorioDO();
        
        ldo.setNome(nome);
        ldo.setDescricao(descricao);
        ldo.setDepartamento(departamento);
        ldo.setSite(site);
        
        if ( tl.incluir(ldo)) {
          // avisar usuario que transacao foi feita com sucesso
%>
          Transação realizada com sucesso!
          Titulo: <%= ldo.getNome() %>
          <form action="./gerenciaLab.jsp" method="post">
             <input type="submit" name="voltar" value="Voltar" />
          </form>
<%     } else  {
%>
          Erro ao incluir projeto            
          <form action="./cadastraLab.jsp" method="post">
             <input type="submit" name="retry" value="Repetir" />
          </form>
<%     }
}
%>
        
    </body>
</html>