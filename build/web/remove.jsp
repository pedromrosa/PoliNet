<html>
<header>
  <title>Remover Contato</title>
</header>

<body bgcolor="white">
<%@ page import="transacoes.Usuario" %>
<%@ page import="data.UsuarioDO" %>
<%@ page import="java.util.Vector" %>

<! ------------------------------------------------------------------------->
<!--   se for o request inicial, mostrar somente o formulario de pesquisa -->

<%     
       String action = request.getParameter("action");
       if ( null == action ) {
          action = "showSearchForm";
%>

	  <form action="./remove.jsp" method="post">
<%
    // VERIFICACAO MANUAL DO LOGIN
    if ( session.getAttribute("user_name") == null) {
       pageContext.forward("index.jsp");
    }

    String nome1 = (String)session.getAttribute("user_name");
%>
    Bom dia <%= nome1 %> !!
            <table>
              <tr>
                 <td>NUSP para pesquisar </td>
                 <td><input type="text" name="nusp" />
              </tr>
            </table>
            <input type="submit" name="pesquisar" value="pesquisar" />
	    <input type="hidden" name="action" value="showSearchResults" />
          </form>

<%        
       } 

%>
<! ------------------------------------------------------------------------->
<!--   faz a pesquisa e mostra os resultados                              -->
<%
     if (action.equals("showSearchResults")) {
       String nusp = request.getParameter("nusp");
       transacoes.Usuario tn = new transacoes.Usuario();
       Vector usuarios = tn.pesquisar(nusp);
       if ( (usuarios == null) || (usuarios.size() == 0)) {
         // avisar usuario que nao ha' contatos com este nusp
%>
          Nenhum contato com este NUSP foi encontrado!
          <form action="./main.jsp" method="post">
             <input type="submit" name="voltar" value="Voltar" />
          </form>
<%     } else {
%>
          <table>
             <tr>
                <td>NUSP</td>
                <td>E-mail</td>
                <td>Nome</td>
                <td>Sobrenome</td>
                <td>Vínculo</td>
             </tr>
<%           for(int i = 0; i < usuarios.size(); i++) {
                UsuarioDO usuario = (UsuarioDO)usuarios.elementAt(i);
%>              <tr>
                   <td><%= usuario.getNusp() %></td>
                   <td><%= usuario.getEmail() %></td>
                   <td><%= usuario.getNome() %></td>
                   <td><%= usuario.getSobrenome() %></td>
                   <td><%= usuario.getVinculo() %></td>
		   <td><a href=remove.jsp?action=removeFromForm&id=<%= usuario.getId()%>>Remover</a>
                </tr>        
<%           } // for i      
%>        </table>            
<%     } // contatos retornados

     } // pesquisar

%>
<! ------------------------------------------------------------------->
<!--   mostra formulario para excluir                           -->
<%     if (action.equals("removeFromForm")) {
          int id = Integer.parseInt(request.getParameter("id"));
%>        
          <form action="./remove.jsp" method="post">
             Está certo disso?
             <input type="submit" name="Sim" value="excluir" />
	     <a href="main.jsp">Não</a>
	     <input type="hidden" name="id" value=<%= id %> />
	     <input type="hidden" name="action" value="removeValue" />
           </form>
<%         
       } // removeFromForm
%>

<! ------------------------------------------------------------------->
<!--   remover de fato -->
<%     
     if (action.equals("removeValue")) {
       int id = Integer.parseInt(request.getParameter("id"));
       transacoes.Usuario tn = new transacoes.Usuario();
       data.UsuarioDO usuario = new data.UsuarioDO();
       usuario.setId(id);
       if ( tn.excluir(usuario)) {
         // avisar usuario que transacao foi feita com sucesso
%>
          Transação realizada com sucesso!
          <form action="./main.jsp" method="post">
             <input type="submit" name="voltar" value="Voltar" />
          </form>
<%     } else {
%>
          Erro ao remover dados do contato
          <form action="./remove.jsp" method="post">
             <input type="submit" name="retry" value="Repetir" />
          </form>
<%     }
     } // removeValue
%>
</body>
</html>
