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
                    <li><a href="pesquisaMenu.jsp">Diret&oacute;rio</a></li>
                    <li><a href="mensagem.jsp">Correio</a></li>
                    <li><a href="logout.jsp">Logout</a></li>
                    <li><a href="sobreNos.jsp">Sobre n&oacute;s</a></li>
                </ul> </nav>
            </aside>
	
	    <section id="content" class="column-right">
     <!-- se for request inicial, mostra somente o perfil do professor -->
    <%     
       String action = request.getParameter("action");
       if ( null == action || action.equals("Voltar") ) {
          action = "showPerfil";
    %>                 		
        	<article>
        	    
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
                    
                    <a class="button" href="gerenciarProjeto.jsp">Gerenciar Projeto</a>
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
<%
    }   
%>          </table>    
            </fieldset>
<%
    } //fecha vínculos

    if(nusp_logado.equals(nusp)){
%>

<a class="button" href="perfilProfessor.jsp?action=editarPerfil&UserId=<%= id%>"> Editar Perfil </a>

<%
    } //só mostra o botão de editar se o nusp logado corresponder ao do perfil
    %>

<%
       } //mostra perfil do professor
%>

<!-- edita o perfil do professor -->
<%          if(action.equals("editarPerfil")) {
   
%>
    <article>
        <h1>Editar</h1>
        <fieldset>
             <legend>Modifique seus dados cadastrais:</legend>
             <form method="post">
                 
                 <p><label for="text">Nome:</label>
                     <input type="text" name="nome" value="<%=nome%>"/><br /></p>
                 
                 <p><label for="text">Sobrenome:</label>
                     <input type="text" name="sobrenome" value="<%=sobrenome%>"/><br /></p>
                 
                 <p><label for="text">E-mail</label>
                     <input type ="text" name="email" value=<%=email%> /><br/></p>
                 
                 <p><label for="text">Institui&ccedil;&atilde;o:</label>
                     <select name="instituicao">
                        <option value="<%=instituicao%>" selected="selected" />
                        <option value="POLI">Escola Polit&eacute;cnica</option>
                        <option value="IF">Insituto de F&iacute;sica</option>
                     </select></p>
                     
                 <p><label for="text">Departamento:</label>
                     <select name="departamento">
                         <option value="<%=departamento%>" selected="selected" />
                         <option value="1">PMR</option>
                         <option value="2">PME</option>
                     </select></p>
                     
                 <p><label for="text">Laborat&oacute;rio:</label>
                     <input type="text" name="laboratiorio" id="laboratorio" value="<%=laboratorio%>"/><br /></p>
                 
                 <p><label2 for="text">Link do curr&iacute;culo Lattes:</label2>
                     <input type="text" name="linkLattes" value="<%=link_lattes%>" size="80"/><br /></p>
                            

                 <p><INPUT type="submit" class="formbutton" value="Atualizar">
                    <INPUT type="reset" class="formbutton" value="Resetar"></p>
                    <input type="hidden" name="atualiza" value="true" />
             </form>

        </fieldset>
    </article>

<%
    } // editarPerfil
%>

<!--   atualiza os valores -->
<%
    if ("true".equals(request.getParameter("atualiza")))  {
        
        String email2        = request.getParameter("email");
        String nome2         = request.getParameter("nome");  
        String sobrenome2    = request.getParameter("sobrenome");
        String link_lattes2  = request.getParameter("linkLattes");
        String instituicao2  = request.getParameter("instituicao");
        String departamento2 = request.getParameter("departamento");
        String laboratorio2  = request.getParameter("laboratorio");
        
        transacoes.Usuario tu = new transacoes.Usuario();
        data.UsuarioDO usuario = tu.buscar(id);
        
        usuario.setNome(nome2);
        usuario.setSobrenome(sobrenome2);
        usuario.setEmail(email2);
        
        if(tu.atualizar(usuario)) {
            
            professor.setEmail(email2);
            professor.setNome(nome2);
            professor.setSobrenome(sobrenome2);
            professor.setLattes(link_lattes2);
            professor.setInstituicao(instituicao2);
            professor.setLaboratorio(laboratorio2);
            professor.setDepartamento(departamento2);
            
            
            if (tp.atualizar(professor)){
                %>
                    <script type="text/JavaScript"> alert("Atualização dos dados realizada com sucesso!"); </script>
                    <%
            }
            else { //caso de não atualizar aluno
            %>
                <script type="text/JavaScript"> alert("Erro na atualização: professor!"); </script>
            <%
            }
        } else { // caso a atualização do usuario não seja completada
        %>
            <script type="text/JavaScript"> alert("Erro na atualização:usuario!"); </script>
        <%
        }
        response.sendRedirect("visualizarPerfil.jsp");
    } //fim da atualização
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
