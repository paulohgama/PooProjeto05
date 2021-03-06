<%-- 
    Document   : home
    Created on : 07/05/2018, 21:34:54
    Author     : PauloHGama
--%>

<%@page import="br.com.grupo6.Usuario"%>
<%@page import="br.com.grupo6.ManipulandoArquivos"%>
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
    if(Rankings.getMelhores().isEmpty())
    {
        ManipulandoArquivos ma = new ManipulandoArquivos();
        String[] sa = ma.leitor("melhores.txt");
        for(int i = 0; i < sa.length; i++)
        {
            int nome = sa[i].indexOf("Nome:") + 5;
            int parada1 = sa[i].indexOf(";", nome);
            int grade = sa[i].indexOf("Grande:") + 6;
            int parada2 = sa[i].indexOf("Nome:", grade);
            String pedaco;
            pedaco = sa[i].substring(nome, parada1);
            Usuario u = new Usuario();
            u.setNome(pedaco);
            pedaco = sa[i].substring(grade, parada2);
            u.setResultadoTeste(Double.parseDouble(pedaco));
            Rankings.getMelhores().add(u);
        }
    }
    if(Rankings.getUltimos().isEmpty())
    {
        ManipulandoArquivos ma = new ManipulandoArquivos();
        String[] sa = ma.leitor("ultimos.txt");
        for(int i = 0; i < sa.length; i++)
        {
            int nome = sa[i].indexOf("Nome:") + 5;
            int parada1 = sa[i].indexOf(";", nome);
            int grade = sa[i].indexOf("Grande:") + 6;
            int parada2 = sa[i].indexOf("Nome:", grade);
            String pedaco;
            pedaco = sa[i].substring(nome, parada1);
            Usuario u = new Usuario();
            u.setNome(pedaco);
            pedaco = sa[i].substring(grade, parada2);
            u.setResultadoTeste(Double.parseDouble(pedaco));
            Rankings.getUltimos().add(u);
        }
    }
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
                    <th>Nº</th>
                <th>Porcentagem</th>
                <th>Nome</th>
                </tr>
            <% 
                for(int i = 0; i < Rankings.getMelhores().size(); i++){%>
                <tr>
                    <%
                        cont++;
                    
                    %>
                    <td><%=(cont)%>.</td>
                <td><%=Rankings.getMelhores().get(i).getResultadoTeste()%>%</td>
                    <td><%= Rankings.getMelhores().get(i).getNome()%></td>
                </tr>
                
            <%if(cont == 10)
                    {
                        i=Rankings.getMelhores().size();
                    } }%>
            
        </table>
        <%}%>
        <hr>
        <%cont=0;
            if(Rankings.getUltimos().size() > 0){%>
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
 
                    %>
                    <td><%=(cont)%>.</td>
                <td><%=Rankings.getUltimos().get(i).getResultadoTeste()%>%</td>
                    <td><%= Rankings.getUltimos().get(i).getNome()%></td>
                </tr>
                
            <%                  if(cont == 10)
                    {
                        i=Rankings.getUltimos().size();
                    } }%>
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
