<%-- 
    Document   : cadastraProjeto
    Created on : 08/12/2015, 06:16:43
    Author     : Marcos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="transacoes.Projeto" %>
<%@ page import="data.ProjetoDO" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="CSS/styles.css" type="text/css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Projeto</title>
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
        
                <h1>Cadastro de Novo Projeto</h1>&nbsp;&nbsp; 
			  
                <fieldset>
                    <legend>Informe os dados de projeto</legend>
                    <FORM action="cadastraProjeto.jsp" method="post">

                        <p><label for="text">T&iacute;tulo do projeto:</label>
                        <input type="text" name="titulo" id="titulo" value=""/><br /></p>
				  
                        <p><label for="text">Descri&ccedil;&atilde;o (max. 250 palavras):</label>
                        <input type="text" name="descricao" id="descricao" value=""/><br /></p>
				  
                        <p><label for="text">Palavras chave (max 3):</label>
    			<input type="text" name="keyw1" id="keyw1" value=""/><br />
                        <input type="text" name="keyw2" id="keyw2" value=""/><br />
                        <input type="text" name="keyw3" id="keyw3" value=""/><br /></p>
				  
<!--                        <p><label for="text">Institui&ccedil;&atilde;o:</label>
                            <select name="instituicao">
                                <option value="" selected="selected" />
                                <option value="1">Escola Polit&eacute;cnica</option>
                                <option value="2">Insituto de F&iacute;sica</option>
                            </select></p>-->
	    
                        <p><label for="text">Semestre de In&iacute;cio:</label>
                        <input type="number" name="semInicio" id="semInicio" value=""/><br /></p>
				  
                        <p><label for="text">Semestre de Fim:</label>
                        <input type="number" name="semFim" id="semFim" value=""/><br /></p>

                        <p><label for="text">Patrocinador do Projeto (CNPQ, FAPESP etc):</label>
                        <input type="text" name="patrocinador" id="patrocinador" value=""/><br /></p>
			
                        <p><INPUT type="submit" class="formbutton" value="Cadastrar">
                        <INPUT type="reset" class="formbutton" value="Limpar dados"></p>
                        <input type="hidden" name="entrou" value="true" />
        	    </FORM>
                </fieldset>	

            </article>
        			
            <footer class="clear">
                <p>&copy; 2015 PoliNet. Desenvolvido para a disciplina PMR 2490 - Sistemas de Informa&ccedil;&atilde;o</p>
            </footer>

        </section>
        <div class="clear"></div>
    </section>
	
        <! ------------------------------------------------------------------->
<!--   se nao for o request inicial, acionar a transacao de negocio -->


<%  if("true".equals(request.getParameter("entrou"))) {
    
 
    String titulo = request.getParameter("titulo");
        String descricao = request.getParameter("descricao");
        String keyw1 = request.getParameter("keyw1");
        String keyw2 = request.getParameter("keyw2");
        String keyw3 = request.getParameter("keyw3");
        String strsemInicio = request.getParameter("semInicio");
        String strsemFim = request.getParameter("semFim");
        String patrocinador = request.getParameter("patrocinador");
        
//        try
//{
  // perform the string to int conversion here
        int semInicio = Integer.parseInt (strsemInicio);
        int semFim = Integer.parseInt (strsemFim);
//}
//catch (NumberFormatException nfe)
//{
//  // do something with the exception
//}

        
        transacoes.Projeto tn = new transacoes.Projeto();
        data.ProjetoDO projeto = new data.ProjetoDO();
        
        projeto.setTitulo(titulo);
        projeto.setDescricao(descricao);
        projeto.setKW1(keyw1);
        projeto.setKW2(keyw2);
        projeto.setKW3(keyw3);
        projeto.setInicio(semInicio);
        projeto.setFim(semFim);
        projeto.setPatrocinador(patrocinador);
        
        if ( tn.incluir(projeto)) {
          // avisar usuario que transacao foi feita com sucesso
%>
          Transação realizada com sucesso!
          Titulo: <%= projeto.getTitulo() %>
          <form action="./gerenciaProjeto.jsp" method="post">
             <input type="submit" name="voltar" value="Voltar" />
          </form>
<%     } else  {
%>
          Erro ao incluir projeto            
          <form action="./cadastraProjeto.jsp" method="post">
             <input type="submit" name="retry" value="Repetir" />
          </form>
<%     }
}
%>
        
    </body>
</html>

