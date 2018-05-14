<%-- 
    Document   : questionario
    Created on : 13/05/2018, 20:45:17
    Author     : Bran
--%>

<%@page import="br.com.grupo6.Question"%>
<%@page import="br.com.grupo6.Quiz"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/navbar.jspf" %>
        <%if(session.getAttribute("nomeSessao") == null || session.getAttribute("nomeSessao").equals("")) {
            response.sendRedirect("home.jsp?user=deslogado");
        }%>
        <h1 align="center">Quiz</h1>
        <form action="pontos.jsp">
            <center>
                <table border="1">
            <%for(int i = 0; i < Quiz.getTest().size(); i++){%>
            <%Question q = Quiz.getTest().get(i);%>
            <tr align="center"><th colspan="3"><%=q.getQuestion()%></th></tr>
            <tr><td>
                    <input type="radio" name="<%=q.getQuestion()%>" value="<%=q.getAlternatives()[0]%>"/><%=q.getAlternatives()[0]%>            
                </td>
                <td>
                    <input type="radio" name="<%=q.getQuestion()%>" value="<%=q.getAlternatives()[1]%>"/><%=q.getAlternatives()[1]%>            
                </td>
                <td>
                    <input type="radio" name="<%=q.getQuestion()%>" value="<%=q.getAlternatives()[2]%>"/><%=q.getAlternatives()[2]%>            
                </td>
            </tr>
            <%}%>
            </table>
            <br>
            <input type="submit" name="tested" value="Enviar">
            
            </center>
        </form>
    </body>
</html>
