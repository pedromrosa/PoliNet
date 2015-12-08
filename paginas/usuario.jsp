<%-- 
    Document   : usuario
    Created on : 29/11/2015, 11:32:17
    Author     : Humberto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="CSS/styles.css" type="text/css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tela do usuário</title>
    </head>
    
    <body>
<%
    // VERIFICACAO MANUAL DO LOGIN
    if ( session.getAttribute("user_name") == null) {
       pageContext.forward("index.jsp");
    }
    
    String nusp = (String)session.getAttribute("nusp");
    // procura no BD com base no NUSP (?)
    String nome         = (String)session.getAttribute("user_name");
    String email        = (String)session.getAttribute("email");
    String instituicao  = (String)session.getAttribute("insituicao");
    String link_lattes  = (String)session.getAttribute("link_lattes");
    String codigo_CV    = (String)session.getAttribute("codigo_CV");
    String codigo_Hist  = (String)session.getAttribute("codigo_hist");
    
    // if-else para verificar Aluno e professor
    
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
                    <li class="selected-item"><a href="#">Perfil</a></li>
                    <li><a href="pesquisa.jsp">Pesquisa</a></li>
                    <li><a href="login.jsp">Logout</a></li>
                    <li><a href="sobreNos.jsp">Sobre n&oacute;s</a></li>
                </ul> </nav>
            </aside>
	
	    <section id="content" class="column-right">
                  		
        	<article>
        	    
                    <p id="paginaURL"></p>                 
				
                    <h1>Perfil do usu&aacute;rio</h1>
                    <p>
                    <p2>Nome: <%= nome %>
                        _____Aluno frustrado  <br /></p2>
                    <p2>Institui&ccedil;&atilde;o: POLI <br /></p2>
                    <p2>Descri&ccedil;&atilde;o do usu&aacute;rio: atolado de trabalhos <br />
                    <p2>N&uacute;mero USP: xxxxxxxx <br /></p2>
                    <p2>Link: aqui <br /></p2>
                    <p2>e-mail: zzzzzzz <br /></p2>   
                    </p>		

        	</article>

                <fieldset>
                    <legend>Oportunidades de pesquisa</legend>
                    <table border="1" >
                       <tr>
                            <td width="80px">T&iacute;tulo: Oportunidade de pesquisa 1</td>
                            <td>Descri&ccedil;&atilde;o: desc1 </td>
                       </tr>
                       <tr>
                            <td>T&iacute;tulo: Oportunidade de pesquisa 2</td>
                            <td>Descri&ccedil;&atilde;o: desc2 </td>
                       </tr>
                    </table>

                </fieldset>

                    <img src="images/usp_relogio_red.jpg" class="resize" alt="" />
        	
                <footer class="clear">
                    <p>&copy; 2015 PoliNet. Desenvolvido para a disciplina PMR 2490 - Sistemas de Informa&ccedil;&atilde;o</p>
        	</footer>

            </section> <!-- fim do section:content -->
		<div class="clear"></div>
	</section>  <!-- fim do section:body -->
	
        <!-- FALTA IMPLEMENTAR -->
	<script type="text/javascript"> 

/* 	  function pegarpagina() {
	    var x = document.URL;
		document.getElementById("paginaURL").innerHTML = x;
	  } */
	  
	  window.onload = function() {	// window.location.pathname  '<?=$_GET['nusp']'?>'
	    var nusp = window.location.href;
	    document.getElementById("paginaURL").innerHTML = nusp;
	  }
	
      function getQueryVariable(variable) {
         var query = window.location.search.substring(1);
         var vars = query.split("&");
         for (var i=0;i<vars.length;i++) {
            var pair = vars[i].split("=");
            if(pair[0] == variable){return pair[1];}
            }
         return(false);
      }
	</script>
    </body>
</html>
