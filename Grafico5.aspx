<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Grafico5.aspx.cs" Inherits="WebForms.Grafico5" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
     <title>Gráfico de Rosca Simples</title>
    <style>
        .donut-hole {
            fill: white;
            stroke-width: 3;
            stroke: #fff;
        }

        .donut-ring {
            fill: transparent;
            stroke-width: 30;
            stroke: lightgrey;
        }

        .donut-segment {
            fill: transparent;
            stroke-width: 30;
            stroke: green;
            stroke-dasharray: 157 157;
            stroke-dashoffset: 78.5;
            transition: stroke-dasharray 0.3s;
        }

        .chart-text {
            font-size: 30px;
            fill: #333;
            text-anchor: middle;
            alignment-baseline: middle;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
              <svg width="200" height="200" viewBox="0 0 200 200">
        <circle class="donut-hole" cx="100" cy="100" r="70"></circle>
        <circle class="donut-ring" cx="100" cy="100" r="85"></circle>
        <circle class="donut-segment" cx="100" cy="100" r="85" transform="rotate(-90 100 100)"></circle>
        <text x="100" y="100" class="chart-text">50%</text>
    </svg>

    <script>
        const setDonutChartValue = (value) => {
            const circle = document.querySelector('.donut-segment');
            const circumference = 2 * Math.PI * 85; // Calculate the circumference of the circle
            const offset = circumference - (value / 100 * circumference);
            circle.style.strokeDasharray = `${circumference} ${circumference}`;
            circle.style.strokeDashoffset = offset;
        };

        setDonutChartValue(50); // Set the value here
    </script>
        </div>
    </form>
</body>
</html>
