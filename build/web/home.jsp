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
        <%if(BD.user != null || BD.user != "") {%>
               
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
                <%
                    for(int j = 0; j < Quiz.getTest().size(); j++){
                    Question q = Quiz.getTest().get(j);%>
                    <th>Pergunta: <%= q.getQuestion() %></th>
                <%}%>
                <th>Porcentagem</th>
                
            </tr>
            <% 
                for(int i = 0; i < Rankings.getMelhores().size(); i++){%>
                <tr>
                    <%
                        legitimo = (user == Rankings.getMelhores().get(i).getNome());
                        for(int j = 0; j < Rankings.getMelhores().get(i).getResposta().length; j++){%>
                        <%if(legitimo){
                            
                         if(j==0) cont++;%>
                        <td>Resposta: <%=(String)Rankings.getMelhores().get(i).getResposta()[j]%></td>
                        <%}
                    if(cont > 8)
                    {
                        i=Rankings.getMelhores().size();
                    }%>
                        <%}%>
                <%if(legitimo){%>
                <td><%=Rankings.getMelhores().get(i).getResultadoTeste()%>%</td>
                </tr>
            <%}}%>
        </table>
        <%}%>
        <hr>
        <%if(Rankings.getUltimos().size() > 0){%>
        <h3>AS 10 ULTIMAS PONTUAÇÕES</h3>
        <table border="1">
            <tr>
                <%for(int j = 0; j < Quiz.getTest().size(); j++){
                    Question q = Quiz.getTest().get(j);%>
                    <th>Pergunta: <%= q.getQuestion() %></th>
                <%}%>
                    <th>Porcentagem</th>
            </tr>
            <%for(int i = 0; i < Rankings.getUltimos().size();  i++){%>
                <tr>
                    <%for(int j = 0; j < Rankings.getUltimos().get(i).getResposta().length; j++){%>
                    <%if(Rankings.getUltimos().get(i).getNome()==user){%>
                    <td>Resposta: <%= Rankings.getUltimos().get(i).getResposta()[j]%></td>
                    <%}if(i == 9){
                        i = Rankings.getUltimos().size();}%>
                <%}%>
                <%if(Rankings.getUltimos().get(i).getNome()==(user)){%>
                    <td><%=Rankings.getUltimos().get(i).getResultadoTeste()%>%</td>
                </tr>
            <%}}%>
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
