<%--
    Document   : mensagem
    Created on : 08/12/2015, 19:16:29
    Author     : Caio
--%> 


<!DOCTYPE html>
<html>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="transacoes.Mensagem" %>
<%@ page import="data.MensagemDO" %>

<head>
        <link rel="stylesheet" href="CSS/styles.css" type="text/css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Correio</title>
</head>
<body>       
	<section id="body" class="width">
            <aside id="sidebar" class="column-left">

                <header>
                    <h1><a href="#">PoliNet</a></h1>
                    <h2>Seja bem vindo!</h2>
                </header>
			
                <h1 align="right">Usu&aacute;rio</h1>

                <nav id="mainnav"> <ul>
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="usuario.jsp">Perfil</a></li>
                    <li><a href="pesquisa.jsp">Pesquisa</a></li>
                    <li class="selected-item"><a href="#">Correio</a></li>
                    <li><a href="login.jsp">Logout</a></li>
                    <li><a href="sobreNos.jsp">Sobre n&oacute;s</a></li>
                </ul> </nav>
            </aside>
            <section id="content" class="column-right">  
            <article>                
                <h1>Correio</h1>&nbsp;&nbsp;
		<fieldset>
                    <legend>Digite a mensagem</legend>
                    <form action="./mensagem.jsp" method="post">
				
                        <p><label for="text">Destinatário:</label>
                        <input type="text" name="destinatario" id="destinatario" value="" size="50" /><br /></p>
                        
                        <p><label for="text">Assunto:</label>
                        <input type="text" name="assunto" id="assunto" value="" size="50" /><br />
                        
                        <label for="text">Mensagem:</label>
                        <textarea name ="mensagem" rows="10" cols="49" maxlength="500"></textarea></p>
				  
                        <p><input type="submit" class="formbutton" value="Enviar">
                        <INPUT type="reset" class="formbutton" value="Limpar"></p>
                        <input type="hidden" name="envia" value="true" />
                    
                        <p><a href="caixaentrada.jsp">Caixa de entrada</a></p>
                    </form>
                </fieldset>
            </article>
        					
            <footer class="clear">
                <p>&copy; 2015 PoliNet. Desenvolvido para a disciplina PMR 2490 - Sistemas de Informa&ccedil;&atilde;o</p>
            </footer>
        </section>
        <div class="clear"></div>
    </section>
<%  if ("true".equals(request.getParameter("envia"))) {
            String titulo = request.getParameter("assunto");
            String receber = request.getParameter("destinatario");
            int id_recebe = Integer.parseInt(receber);
            String texto = request.getParameter("mensagem");
                          
        transacoes.Mensagem tn = new transacoes.Mensagem();
        data.MensagemDO msg = new data.MensagemDO();
        
        msg.setRecebe(id_recebe);
        msg.setTitulo(titulo);
        msg.setTexto(texto);
        
        if ( tn.incluir(msg)) {
          // avisar usuario que transacao foi feita com sucesso 
%>
          Mensagem enviada com sucesso!
          <form action="./main.jsp" method="post">
             <input type="submit" name="voltar" value="Voltar" />
          </form>
<%     
        } else {   
%>
          Erro no envio            
          <form action="./insert.jsp" method="post">
             <input type="submit" name="retry" value="Repetir" />
          </form>
 <%
       }
   }
%>
    </body>
</html>
