<%-- 
    Document   : VizualizarPerfil       CLASSE MORTA!!!!!!!!!
    Created on : Dec 6, 2015, 9:28:23 PM
    Author     : Gregorio
--%>

<%@ page import="transacoes.Usuario" %>
<%@ page import="data.UsuarioDO" %>
<%@ page import="utils.Transacao" %>


        <%  
            // pega o nusp do usuario logado
            String nusp_logado = (String)session.getAttribute("nusp_logado");

            // pega o Id do usuario
            String userId = (String)session.getAttribute("UserId");
            
            if (null == userId) { // nao obteve parametro userId - pegar perfil do nusp_logado
                
                transacoes.Usuario tu = new transacoes.Usuario();
                data.UsuarioDO usuario = tu.buscarNusp(nusp_logado);
                
                String vinculo = usuario.getVinculo();
                
                // Verifica o vinculo do usuario
                if ("aluno".equals(vinculo)) {
                    session.setAttribute("UserId", usuario.getId());
                    session.setAttribute("nusp_logado", nusp_logado);
                    pageContext.forward("perfilAluno.jsp");
                }          
                else { if ("professor".equals(vinculo)) {
                    session.setAttribute("UserId", usuario.getId());
                    session.setAttribute("nusp_logado", nusp_logado);
                    pageContext.forward("perfilProfessor.jsp");
                }
                else { if ("assistente".equals(vinculo)) {
                    session.setAttribute("nusp_logado", nusp_logado);
                    pageContext.forward("usuario.jsp");
                }
                else {  // se nao for nenhum deles
                    %>
                    <script type="text/JavaScript"> alert("Id inexistente"); </script>
                    <%
                    pageContext.forward("index.jsp");
                }
                } // fim - else assistente
                } // fim - else professor
                
            } else { // obteve parametro userId
                
                int id = Integer.parseInt(request.getParameter("UserID"));

                transacoes.Usuario ta = new transacoes.Usuario();
                data.UsuarioDO usuario = ta.buscar(id);

                String vinculo = usuario.getVinculo();               

                // Verifica o vinculo do usuario
                if ("aluno".equals(vinculo)) {
                    
                    session.setAttribute("UserId", id);
                    session.setAttribute("nusp_logado", nusp_logado);
                    pageContext.forward("aluno.jsp");
                }          
                else { if ("professor".equals(vinculo)) {
                   
                    session.setAttribute("nusp_logado", nusp_logado);
                    pageContext.setAttribute("userId", id);
                    pageContext.forward("perfilProfessor.jsp");
                }
                else { if ("assistente".equals(vinculo)) {
                    session.setAttribute("nusp_logado", nusp_logado);
                    pageContext.forward("usuario.jsp");
                }
                else {  // se nao for nenhum deles
                    %>
                    <script type="text/JavaScript"> alert("Id inexistente"); </script>
                    <%
                    pageContext.forward("index.jsp");
                }
                } // fim - else assistente
                } // fim - else professor
            }

%>



