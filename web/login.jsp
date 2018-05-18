<%-- 
    Document   : home
    Created on : 11/05/2018, 20:40:43
    Author     : Bran
--%>

<%@page import="br.com.grupo6.ManipulandoArquivos"%>
<%@page import="br.com.grupo6.Usuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.com.grupo6.BD"%>
<%@page import="br.com.grupo6.Usuario"%>
<%@page import="br.com.grupo6.Question"%>
<%
    if(request.getParameter("buttonName") != null) {
               session.invalidate();
               BD.user = "";
    }
%>
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
        <%@ include file="WEB-INF/jspf/navbarlogin.jspf" %>
        
        <%String name="";
        if (request.getParameter("user") == "deslogado"){%><script language="JavaScript">alert("Para acessar o questionário é necessário estar logado!");</script><%}%>
       
       <%try {
           if(request.getParameter("btnUsuario") != null){
               
               String nomeUsuario = request.getParameter("inputUsuario");
               ManipulandoArquivos ma = new ManipulandoArquivos();
               String[] nome = ma.leitor("usuarios.txt");
               for(int i = 0; i < nome.length; i++)
               {
                   Usuarios u = new Usuarios();
                   u.setNome(nome[i]);
                   BD.getUsuarios().add(u);
               }
               boolean existe = false;
               for(int i = 0; i < BD.getUsuarios().size(); i++)
               {
                   if(BD.getUsuarios().get(i).getNome().equals(nomeUsuario))
                   {
                       i = BD.getUsuarios().size();
                       existe = true;
                   }
               }
               if(!existe)
               {
                    session.setAttribute("nomeSessao", nomeUsuario);
                    BD.user = (String) session.getAttribute("nomeSessao");
               }
               else
               {
                    Usuarios usuario = new Usuarios();
                    usuario.setNome(nomeUsuario);
                    BD.getUsuarios().add (usuario);
                    session.setAttribute("nomeSessao", nomeUsuario);
                    BD.user = (String) session.getAttribute("nomeSessao");
               }
           }
           else 
           {             
           }
       } catch(Exception ex) {
           %><script language="JavaScript">alert("Digite um valor válido!");</script><%
       }      
       %>
       
       <%if(BD.user == "") {%>
            <section class="page-section cta">
                <br>
            <center>
                <form>
                Login:
                <input type="text" id="inputEmail" name="inputUsuario" required>
            <button type="submit" name="btnUsuario" class="btn">Logar</button>
                </form>
            </center>
            </section>
            

            <%} else{%>
               
        <form action="home.jsp" name="form1" method="post">
            <input type="hidden" name="logado" value="logado">
        </form>
        <script language="JavaScript">

            form1.submit();
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
