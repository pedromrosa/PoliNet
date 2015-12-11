<%-- 
    Document   : esqueciSenha
    Created on : 09/12/2015, 01:36:45
    Author     : Heitor
--%>

<%@page import="data.UsuarioDO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="CSS/styles.css" type="text/css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Esqueci a senha</title>
    </head
    
    <body>
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
        
                    <h1>&iquest;&iquest;Esqueci a senha??</h1>&nbsp;&nbsp; 
                    <p>Entre com seu login cadastrado e n&uacute;mero USP para verifica&ccedil;&atilde;o no banco de dados.</p>
			  
                    <fieldset>
                        <legend>Recuperar senha</legend>
                        <FORM method="post">
				
                            <p><label for="text">E-mail:</label>
                            <input type="text" name="email" id="email" value=""/><br /></p>
				  
                            <p><label for="text">N&uacute;mero USP:</label>
                            <input type="text" name="nusp" id="nusp" value=""/><br /></p>
				  
                            <p><INPUT type="submit" class="formbutton" value="Recuperar Senha">
                                <INPUT type="reset" class="formbutton" value="Limpar dados"></p>
                            <INPUT type="hidden" name="acao" value="esqueceuSenha">

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
	
        
<%
            if (null != request.getParameter("acao")){
                String Email = request.getParameter("email");
                String NUSP = request.getParameter("nusp");
                transacoes.Usuario tn = new transacoes.Usuario();
                UsuarioDO usuario = tn.buscarEmail(Email);
                UsuarioDO usuario2 = tn.buscarNusp(NUSP);
                if (usuario == null) {
%>
            <script type="text/JavaScript"> alert("O e-mail digitado não foi encontrado!");</script>
<%              } else { 
                    if (usuario2 == null){
%>
            <script type="text/JavaScript"> alert("O número USP digitado não foi encontrado!");</script>
<%                  }
                    else {
                        if (usuario.getNusp().equals(usuario2.getNusp())){
%>
<a class="button" href="mailto:<%=usuario.getEmail()%>&subject=Recuperar%20senha&body=Senha%20cadastrada:%20<%=usuario.getSenha()%>">Clique aqui para enviar a senha cadastrada para o seu e-mail</a>
<!--<script type="text/JavaScript"> alert("A senha procurada é: <%= usuario.getSenha() %>");</script>-->
<%
                        }
                        else{
%>
            <script type="text/JavaScript"> alert("O e-mail e número USP não conferem!");</script>
<%                      }
                    }
                  }
            }
%>   
    </body>
</html>