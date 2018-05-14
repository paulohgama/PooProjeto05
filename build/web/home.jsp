<%-- 
    Document   : home
    Created on : 07/05/2018, 21:34:54
    Author     : PauloHGama
--%>

<%@page import="br.com.grupo6.BD"%>
<%@page import="br.com.grupo6.Rankings"%>
<%@page import="br.com.grupo6.Question"%>
<%@page import="br.com.grupo6.Quiz"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    int cont = 0;
    String user = BD.user;
    boolean legitimo;
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Web Quiz</title>
        <%@include file="WEB-INF/jspf/link.jspf" %>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/navbar.jspf" %>
        <h1>Web Quiz</h1>
        <%if(BD.user != "") {%>
               
           <p>Olá, <%=user%></p>
        <br>
        <form action="login.jsp" name="form1" method="post">
        <input type="hidden" name="buttonName">
        <input type="button" value="Deslogar" onclick="button1()" class="btn">
        </form>
        
        
        <%if(Rankings.getMelhores().size() > 0){%>
        <h3>TOP 10 MELHORES PONTUAÇÕES</h3>
            <table border="1">
                <tr>
                <th>Porcentagem</th>
                <th>Nome</th>
                </tr>
            <% 
                for(int i = 0; i < Rankings.getMelhores().size(); i++){%>
                <tr>
                    <%
                        cont++;%>
                        <%
                    if(cont > 8)
                    {
                        i=Rankings.getMelhores().size();
                    }%>
                <td><%=Rankings.getMelhores().get(i).getResultadoTeste()%>%</td>
                </tr>
                <tr>
                    <td><%= Rankins.getMelhores().get(i).getNome()%></td>
                </tr>
            <%}%>
        </table>
        <%}%>
        <hr>
        <%if(Rankings.getUltimos().size() > 0){%>
        <h3>AS 10 ULTIMAS PONTUAÇÕES</h3>
        <table border="1">
                <tr>
                    <th>Nº</th>
                <th>Porcentagem</th>
                <th>Nome</th>
                </tr>
            <% 
                for(int i = 0; i < Rankings.getUltimos().size(); i++){%>
                <tr>
                    <%cont++;
                    if(cont > 8)
                    {
                        i=Rankings.getUltimos().size();
                    }
                    %>
                    <td><%=(cont+1)%>.</td>
                <td><%=Rankings.getUltimos().get(i).getResultadoTeste()%>%</td>
                    <td><%= Rankins.getUltimos().get(i).getNome()%></td>
                </tr>
            <%}%>
        </table>
        <%}}else{%>
        <form action="login.jsp" name="form2" method="post">
            <input type="hidden" name="deslogar" value="deslog">
        </form>
        <script language="JavaScript">
            form2.submit();
        </script>
        <%}%>
        <script language="JavaScript">
        function button1()
        {
            document.form1.buttonName.value = "yes";
            form1.submit();
        } 
        </script>
    </body>
</html>
