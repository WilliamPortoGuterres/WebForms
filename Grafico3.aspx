<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Grafico3.aspx.cs" Inherits="WebForms.Grafico3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Gráficos Pie e Donut para Completude de Projeto</title>
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <style>
    canvas {
      max-width: 300px;
      margin: 20px;
      border: 2px solid #333; /* Borda fina */
      border-radius: 50%; /* Formato de donut */
    }
    #chart-container {
      display: flex;
      justify-content: center;
    }
  </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div id="chart-container">
    <canvas id="pieChart"></canvas>
    <canvas id="donutChart"></canvas>
  </div>

  <script>
    // Dados para o gráfico de pizza (pie chart)
    var pieData = {
      labels: ['Completado', 'Restante'],
      datasets: [{
        data: [75, 25], // Exemplo: 75% completado e 25% restante
        backgroundColor: ['#5cb85c', '#e6e6e6'], // Verde para completude e cinza para incompletude
        borderWidth: 0 // Sem borda
      }]
    };

    // Opções para o gráfico de pizza (pie chart)
    var pieOptions = {
      cutoutPercentage: 50, // Define o tamanho do buraco no centro
      legend: {
        display: false
      },
      tooltips: {
        enabled: false
      }
    };

    // Dados para o gráfico de donut
    var donutData = {
      datasets: [{
        data: [75, 25], // Exemplo: 75% completado e 25% restante
        backgroundColor: ['#5cb85c', '#e6e6e6'], // Verde para completude e cinza para incompletude
        borderWidth: 0 // Sem borda
      }]
    };

    // Opções para o gráfico de donut
    var donutOptions = {
      cutoutPercentage: 75, // Define o tamanho do buraco no centro
      rotation: Math.PI, // Gira o gráfico para começar do topo
      circumference: Math.PI, // Limita o gráfico a meio círculo
      legend: {
        display: false
      },
      tooltips: {
        enabled: false
      },
      animation: {
        animateRotate: false, // Desativa a animação de rotação
        animateScale: false // Desativa a animação de escala
      }
    };

    // Obtém os elementos canvas
    var pieCtx = document.getElementById('pieChart').getContext('2d');
    var donutCtx = document.getElementById('donutChart').getContext('2d');

    // Cria o gráfico de pizza (pie chart)
    var pieChart = new Chart(pieCtx, {
      type: 'pie',
      data: pieData,
      options: pieOptions
    });

    // Cria o gráfico de rosca (donut)
    var donutChart = new Chart(donutCtx, {
      type: 'doughnut',
      data: donutData,
      options: donutOptions
    });
  </script>
        </div>
    </form>
</body>
</html>
