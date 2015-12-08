<html>
<header>
  <title>Pesquisar Contato</title>
</header>

<body bgcolor="white">
<%@ page import="java.util.Vector" %>
<%@ page import="transacoes.Usuario" %>
<%@ page import="data.UsuarioDO" %>

<! ------------------------------------------------------------------->
<!--   sempre mostrar o formulario de busca, ateh acao ser "voltar" -->

<%     if ( null != request.getParameter("voltar")) {
%>        <jsp:forward page="./main.jsp" />
<%        return;
       }
%>

         <form action="./search.jsp" method="post">
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
               <td>NUSP para pesquisar: </td>
               <td><input type="text" name="nusp" />
             </tr>
           </table>
           <input type="submit" name="pesquisar" value="pesquisar" />
           <input type="submit" name="voltar" value="voltar" />
         </form>

<! ------------------------------------------------------------------->
<!--   se nao for o request inicial, acionar a transacao de negocio -->


<%   if ( null != request.getParameter("pesquisar")) {  
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
                </tr>        
<%           } // for i      
%>        </table>            
<%     } // contatos retornados
     } // pesquisar
%>

</body>
</html>
