<%-- 
    Document   : logout
    Created on : 09/12/2015, 02:13:57
    Author     : Humberto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<script type="text/JavaScript"> alert("Você saiu da sessão!"); </script>

<% session.invalidate();    %>

<% response.sendRedirect("index.jsp"); %>