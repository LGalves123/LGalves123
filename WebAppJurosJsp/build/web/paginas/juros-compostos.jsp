<%-- 
    Document   : juros-compostos
    Created on : 23 de set. de 2023, 15:58:53
    Author     : LGBadures
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP - Juros Compostos</title>
    </head>
    <body>
        <%@include file="../WEB-INF/jspf/menu.jspf"%>
        <center><h1>Juros Compostos</h1>
        <% 
        if (request.getMethod().equals("POST")) {
            double montanteInicial = Double.parseDouble(request.getParameter("montanteInicial"));
            double taxaJuros = Double.parseDouble(request.getParameter("taxaJuros")) / 100;
            int quantidadeMeses = Integer.parseInt(request.getParameter("quantidadeMeses"));
            
            out.println("<h2>Resultado do Cálculo</h2>");
            out.println("<table border='1'>");
            out.println("<tr><th>Mês</th><th>Montante</th></tr>");

            for (int i = 1; i <= quantidadeMeses; i++) {
                double montanteFuturo = montanteInicial * Math.pow(1 + taxaJuros, i);
                out.println("<tr><td>" + i + "</td><td>" + montanteFuturo + "</td></tr>");
            }

            out.println("</table>");
            out.println("<br><a href=''>Calcular novamente</a>");
        } else {
    %>
    
    <form action="" method="post">
        Montante Inicial: R$<input type="number" min="0" name="montanteInicial" required><br>
        Taxa de Juros (%): <input type="number" min="0" name="taxaJuros" required><br>
        Quantidade de Meses: <input type="number" min="1" name="quantidadeMeses" required><br>
        <input type="submit" value="Calcular">
    </form>
    
    <% } %>
    </center>
    </body>
<</html>
