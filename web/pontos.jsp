<%-- 
    Document   : pontos
    Created on : 13/05/2018, 15:57:13
    Author     : PauloHGama
--%>

<%@page import="br.com.grupo6.BD"%>
<%@page import="br.com.grupo6.User"%>
<%@page import="br.com.fatecpg.poo.teste.Ordenando"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.grupo6.Usuario"%>
<%@page import="br.com.grupo6.Rankings"%>
<%@page import="br.com.grupo6.Question"%>
<%@page import="br.com.grupo6.Quiz"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    boolean tested = false;
    double grade = 0;
    if(request.getParameter("tested") != null)
    {
        tested = true;
        int count = 0;
        for(int i = 0; i < Quiz.getTest().size(); i++)
        {
            Question q = Quiz.getTest().get(i);
            String p = request.getParameter(q.getQuestion());
            if(q.getAswer().equals(p))
            {
                count++;
            }
        }
        grade = 100.0 * ((double)(count) / Quiz.getTest().size());
        User user = new User();
        user.setPercent(grade);
        String[] resp = new String[Quiz.getTest().size()];
        for(int j = 0; j < Quiz.getTest().size(); j++)
        {
            Question q = Quiz.getTest().get(j);
            resp[j] = request.getParameter(q.getQuestion());
        }        
        user.setResposta(resp);
        user.setUser(BD.user);
        Rankings.getMelhores().add(user);
        Ordenando or = new Ordenando();
        or.Quick(0, Rankings.getMelhores().size()-1);
        or.OrdemInversa();
        
        user = new User();
        user.setPercent(grade);
        user.setResposta(resp);
        user.setUser(BD.user);
        Rankings.getUltimos().add(0, user);
    }  
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pontuação</title>
        <%@include file="WEB-INF/jspf/link.jspf" %>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/navbar.jspf" %>
        <h1>Pontuação</h1>
        <%if(tested){%>
        <h2>Voce acertou <%=grade%>% das questões</h2>
        <%}%>
    </body>
</html>
