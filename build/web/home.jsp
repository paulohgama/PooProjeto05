<%-- 
    Document   : home
    Created on : 11/05/2018, 20:40:43
    Author     : Bran
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.com.grupo6.BD"%>
<%@page import="br.com.grupo6.Usuario"%>
<%@page import="br.com.grupo6.Question"%>
<html>
    <head>
            <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Login</title>

       <!-- Bootstrap core CSS -->
    

    <!-- Custom fonts for this template -->
    <link href="https://fonts.googleapis.com/css?family=Do+Hyeon" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Do+Hyeon" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/business-casual.min.css" rel="stylesheet">

    </head>
    <body>
        <%@ include file="WEB-INF/jspf/navbar.jspf" %>
        
        <%String name="";
        if (request.getParameter("user") == "deslogado"){%><script language="JavaScript">alert("Para acessar o questionário é necessário estar logado!");</script><%}%>
       
       <%try {
           if(request.getParameter("btnUsuario") != null){
               String nomeUsuario = request.getParameter("inputUsuario");
               Usuario usuario = new Usuario();
               usuario.setNome(nomeUsuario);
               BD.getUsuarios().add (usuario);
               session.setAttribute("nomeSessao", nomeUsuario);
           }
           else 
           {             
           }
       } catch(Exception ex) {
           %><script language="JavaScript">alert("Digite um valor válido!");</script><%
       }      
       %>
       
       <%if(session.getAttribute("nomeSessao") == null || session.getAttribute("nomeSessao").equals("")) {%>
            <section class="page-section cta">
        <center>
            <form>
            Login:
            <input type="email" id="inputEmail" placeholder="Usuario@email.com" name="inputUsuario" required>
            <button type="submit" name="btnUsuario" class="btn">Logar</button>
            

        <%} else {
        name=(String)session.getAttribute("nomeSessao"); %>
               
           <p>Olá, <%=name%></p>
        <br>
        <form name="form1" method="post">
        <input type="hidden" name="buttonName">
        <input type="button" value="Deslogar" onclick="button1()" class="btn">
        </form>
        
        <%}%>
            
            <% 
        if(request.getParameter("buttonName") != null) {
               session.invalidate();
               response.sendRedirect("home.jsp");
        }
    %>

    

    <script language="JavaScript">
        
        function button1()
        {
            document.form1.buttonName.value = "yes";
            form1.submit();
        } 
        
    </script>
            </center>
    </section>
     </body>
</html>
