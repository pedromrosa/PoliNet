<html>
<header>
  <title>Inserir Contato</title>
</header>

<body bgcolor="white">
<%@ page import="transacoes.Usuario" %>
<%@ page import="data.UsuarioDO" %>

<! ------------------------------------------------------------>
<!--   se for o request inicial, mostrar somente o formulario -->

<%     if ( null == request.getParameterValues("incluir") ) {
%>
       <form action="./insert.jsp" method="post">
<%
    // VERIFICACAO MANUAL DO LOGIN
    if ( session.getAttribute("user_name") == null) {
       pageContext.forward("index.jsp");
    }

    String nome = (String)session.getAttribute("user_name");
%>
    Bom dia <%= nome %> !!

           <table>
            <tr>
               <td>NUSP</td>
               <td><input type="text" name="nusp" />
            </tr>
            <tr>
               <td>Senha</td>
               <td><input type="text" name="password" />
            </tr>
            <tr>
               <td>E-mail</td>
               <td><input type="text" name="email" />
            </tr>
            <tr>
               <td>Nome</td>
               <td><input type="text" name="nome" />
            </tr>
            <tr>
               <td>Sobrenome</td>
               <td><input type="text" name="sobrenome" />
            </tr>
            <tr>
               <td>Vínculo</td>
               <td>
                    <label><input type="radio" name="vinculo" value="aluno" />Aluno</label>
                    <label><input type="radio" name="vinculo" value="professor" />Professor</label>
                    <label><input type="radio" name="vinculo" value="assistente" />Assistente</label>
               </td>
            </tr>
          </table>
          <input type="submit" name="incluir" value="incluir" />
        </form>

<%      } else { 
%>
<! ------------------------------------------------------------------->
<!--   se nao for o request inicial, acionar a transacao de negocio -->


<%      String nusp = request.getParameter("nusp");
        String senha = request.getParameter("password");
        String email = request.getParameter("email");
        String nome = request.getParameter("nome");
        String sobrenome = request.getParameter("sobrenome");
        String vinculo = request.getParameter("vinculo");
        
        transacoes.Usuario tn = new transacoes.Usuario();
        data.UsuarioDO usuario = new data.UsuarioDO();
        
        usuario.setNusp(nusp);
        usuario.setEmail(email);
        usuario.setNome(nome);
        usuario.setSobrenome(sobrenome);
        usuario.setVinculo(vinculo); 
        usuario.setSenha(senha);
        
        if ( tn.incluir(usuario)) {
          // avisar usuario que transacao foi feita com sucesso
%>
          Transação realizada com sucesso!
          Senha: <%= usuario.getSenha() %>
          <form action="./main.jsp" method="post">
             <input type="submit" name="voltar" value="Voltar" />
          </form>
<%     } else {
%>
          Erro ao incluir usuário            
          <form action="./insert.jsp" method="post">
             <input type="submit" name="retry" value="Repetir" />
          </form>
<%     }
       }
%>

</body>
</html>
