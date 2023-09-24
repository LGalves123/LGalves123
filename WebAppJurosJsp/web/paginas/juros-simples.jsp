<%-- 
    Document   : juros-simples
    Created on : 23 de set. de 2023, 15:58:24
    Author     : LGBadures
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP - Juros Simples</title>
    </head>
    <body>
        <%@include file="../WEB-INF/jspf/menu.jspf"%>
        <center><h1>Juros Simples</h1>
        
        <%
        // Inicialize as variáveis
        double montante = 0;
        double taxa = 0;
        int meses = 0;
        double jurosSimples = 0;
        String resultado = "";
        
        // Verifique se o formulário foi enviado
        if (request.getMethod().equals("POST")) {
            String montanteStr = request.getParameter("montante");
            String taxaStr = request.getParameter("taxa");
            String mesesStr = request.getParameter("meses");
            
            try {
                montante = Double.parseDouble(montanteStr);
                taxa = Double.parseDouble(taxaStr);
                meses = Integer.parseInt(mesesStr);
                
                // Realize o cálculo do valor futuro
                jurosSimples = montante + (montante * taxa * (meses / 12.0));
                
                resultado = "Montante Inicial: R$ " + montante + "<br>";
                resultado += "Taxa de Juros: " + taxa + "%<br>";
                resultado += "Quantidade de Meses: " + meses + "<br>";
                resultado += "Valor Futuro: R$ " + jurosSimples;
            } catch (NumberFormatException e) {
                resultado = "Por favor, insira valores válidos.";
            }
        }
    %>
    
    <form method="post" action="juros-simples.jsp">
        Montante inicial: R$  <input type="text" min="0" name="montante" value="<%= montante %>"><br>
        Taxa de juros (%): <input type="text" min="0" name="taxa" value="<%= taxa %>"><br>
        Quantidade de meses: <input type="text" min="1" name="meses" value="<%= meses %>"><br>
        <input type="submit" value="Calcular">
        <br>
        <h3>Obs.: Valores após o ponto final significam centavos</h3>
        </br>
    </form>
    
    <div>
        <%= resultado %>
    </div>
    </body>
    </center>
</html>
