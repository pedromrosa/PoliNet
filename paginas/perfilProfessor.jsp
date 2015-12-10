<%-- 
    Document   : perfilProfessor
    Created on : 06/12/2015, 15:45:29
    Author     : Humberto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Vector" %>

<%@ page import="transacoes.Professor"  %>
<%@ page import="data.ProfessorDO"      %>

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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Perfil de professor</title>
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
    
    // Busca usuario por ID
    String userId = request.getParameter("UserId");
    int id = Integer.parseInt(userId);

    Professor tp = new Professor();
    ProfessorDO professor = tp.buscar(id);
    
    // atualiza atributos do aluno de id UserID
    String nusp         = professor.getNusp(); 
    String email        = professor.getEmail();
    String nome         = professor.getNome();  
    String sobrenome    = professor.getSobrenome();
    String link_lattes  = professor.getLattes();
    String instituicao  = professor.getInstituicao();
    String departamento = professor.getDepartamento();
    String laboratorio  = professor.getLaboratorio();
    
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
                    <li><a href="mensagem.jsp">Correio</a></li>
                    <li><a href="logout.jsp">Logout</a></li>
                    <li><a href="sobreNos.jsp">Sobre n&oacute;s</a></li>
                </ul> </nav>
            </aside>
	
	    <section id="content" class="column-right">
                  		
        	<article>
        	    
                    <p id="paginaURL"></p>
				
                    <h1><%= nome +" "+ sobrenome %></h1>
                    <p>
                    <p2>E-mail: <%= email %> <br /></p2>   
                    <p2>Institui&ccedil;&atilde;o: <%= instituicao %> <br /></p2>
                    <p2>Descri&ccedil;&atilde;o do usu&aacute;rio: Professor titular e coordenador de laboratório <br />
                    <p2>N&uacute;mero USP: <%= nusp %> <br /></p2>
                    <p2>Link Currículo Lattes: <%= link_lattes %> <br /></p2>
                    <p2>Instituição: <%= instituicao %> <br /></p2>
                    <p2>Departamento: <%= departamento %> <br /></p2>   
                    <p2>Laboratório: <%= laboratorio %> <br /></p2>   
                    </p>		

        	</article>
                    

<%  
    Vinculo v = new Vinculo();
    Vector vinculos = v.buscarPorUserId(id);
    
    if ( (vinculos != null) && (vinculos.size() != 0)){
        
        %>
                    <fieldset>
            <legend>Pesquisas de <%=nome%></legend>
            <table border="1">
                <tr>
                    <td><b>Pesquisa</b></td>
                    <td><b>Laboratório</b></td>
                    <td><b>Link</b></td>
                </tr>
        <%
    for(int i = 0; i < vinculos.size(); i++) {
        VinculoDO vinculo = (VinculoDO)vinculos.elementAt(i);
        
        Projeto p = new Projeto();
        ProjetoDO projeto = p.pesquisa_id(vinculo.getIdProjeto());
        
        Laboratorio l = new Laboratorio();
        LaboratorioDO lab = l.buscar(vinculo.getIdLab());
        
%>                  
                    <tr>
                         <td><%= projeto.getTitulo() %></td>
                         <td><%= lab.getNome()%></td>
                         <td><a href=pesquisa.jsp?visualizar=projeto&id=<%= projeto.getId()%>>Visualizar Projeto</a></td>
      
                    </tr>        
<%                      }   
%>          </table>    
            </fieldset>
<% }
%>

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
