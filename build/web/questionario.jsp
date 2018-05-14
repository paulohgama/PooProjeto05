<%-- 
    Document   : questionario
    Created on : 13/05/2018, 20:45:17
    Author     : Bran
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%if(session.getAttribute("nomeSessao") == null || session.getAttribute("nomeSessao").equals("")) {
            response.sendRedirect("home.jsp?user=deslogado");
        }%>
        <h1>Quiz</h1>
        <form action="pontos.jsp">
            <%for(int i = 0; i < Quiz.getTest().size(); i++){%>
            <%Questions q = Quiz.getTest().get(i);%>
            <h2><%=q.getQuestion()%></h2>
            <input type="radio" name="<%=q.getQuestion()%>" value="<%=q.getAlternatives()[0]%>"/><%=q.getAlternatives()[0]%>            
            <input type="radio" name="<%=q.getQuestion()%>" value="<%=q.getAlternatives()[1]%>"/><%=q.getAlternatives()[1]%>            
            <input type="radio" name="<%=q.getQuestion()%>" value="<%=q.getAlternatives()[2]%>"/><%=q.getAlternatives()[2]%>            
            <%}%>
            <hr>
            <input type="submit" name="tested" value="Enviar">
        </form>
    </body>
</html>
