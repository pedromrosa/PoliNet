<html>
<header>
  <title>Atualizar Contato</title>
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

	  <form action="./update.jsp" method="post">
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
		   <td><a href=update.jsp?action=showEditForm&id=<%= usuario.getId()%>>Editar</a>
                </tr>        
<%           } // for i      
%>        </table>            
<%     } // contatos retornados

     } // pesquisar

%>
<! ------------------------------------------------------------------->
<!--   mostra formulario para atualizacao                           -->
<%     if (action.equals("showEditForm")) {
          int id = Integer.parseInt(request.getParameter("id"));
	  transacoes.Usuario tn = new transacoes.Usuario();
          data.UsuarioDO usuario = tn.buscar(id);
%>        
          <form action="./update.jsp" method="post">
             <table>
               <tr>
                  <td>Nusp</td>
                  <td><%= usuario.getNusp() %> </td>
               </tr>
               <tr>
                  <td>E-mail</td>
                  <td><input type="text" name="email" value=<%= usuario.getEmail() %> />
               </tr>
               <tr>
                  <td>Nome</td>
                  <td><input type="text" name="nome" value=<%= usuario.getNome() %> />
               </tr>
               <tr>
                  <td>Sobrenome</td>
                  <td><input type="text" name="sobrenome" value=<%= usuario.getSobrenome() %> />
               </tr>
               <tr>
                  <td>Vinculo</td>
                  <td><input type="text" name="vinculo" value=<%= usuario.getVinculo() %> />
               </tr>
             </table>
             <input type="submit" name="atualizar" value="atualizar" />
	     <a href="main.jsp">Voltar</a>
	     <input type="hidden" name="id" value=<%= id %> />
	     <input type="hidden" name="action" value="updateValues" />
	     <input type="hidden" name="nusp" value=<%= usuario.getNusp() %> />
           </form>
<%         
       } // showEditForm
%>

<! ------------------------------------------------------------------->
<!--   atualizar valores -->
<%     
     if (action.equals("updateValues")) {
       String nusp = request.getParameter("nusp");
       String email = request.getParameter("email");
       String nome = request.getParameter("nome");
       String sobrenome = request.getParameter("sobrenome");
       String vinculo = request.getParameter("vinculo");
       int id = Integer.parseInt(request.getParameter("id"));
       transacoes.Usuario tn = new transacoes.Usuario();
       data.UsuarioDO usuario = new data.UsuarioDO();
       usuario.setId(id);
       usuario.setNusp(nusp);
       usuario.setEmail(email);
       usuario.setNome(nome);
       usuario.setSobrenome(sobrenome);
       usuario.setVinculo(vinculo); 
       boolean result = false;
       try {
          result = tn.atualizar(usuario);
       } catch (Exception e) {
%>           <%= e.toString() %>
<%
       }
       if ( result ) {
         // avisar usuario que transacao foi feita com sucesso
%>
          Transação realizada com sucesso!
          <form action="./main.jsp" method="post">
             <input type="submit" name="voltar" value="Voltar" />
          </form>
<%     } else {
%>
          Erro ao atualizar dados do contato
          <form action="./update.jsp" method="post">
             <input type="submit" name="retry" value="Repetir" />
          </form>
<%     }
     } // updateValues
%>

</body>
</html>
