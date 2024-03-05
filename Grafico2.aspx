<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Grafico2.aspx.cs" Inherits="WebForms.Grafico2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
   
    
  <title>Gráfico Donut para Completude de Projeto</title>
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <style>
    canvas {
      max-width: 300px;
      margin: 0 auto;
      border: 2px solid #333; /* Borda fina */
      border-radius: 50%; /* Formato de donut */
    }
    #chart-container {
      position: relative;
      text-align: center;
    }
    #chart-value {
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      font-size: 36px;
      font-weight: bold;
      color: #333;
    }
  </style>


</head>
<body>
    <form id="form1" runat="server">
        <div>

             <div id="chart-container">
    <canvas id="myChart"></canvas>
    <div id="chart-value">50%</div>
  </div>

  <script>
    // Dados para o gráfico
    var data = {
      datasets: [{
        data: [80, 90],
        backgroundColor: ['#5cb85c', '#e6e6e6'], // Verde para completude e cinza para incompletude
        borderWidth: 0 // Sem borda
      }]
    };

    // Opções do gráfico
    var options = {
      cutoutPercentage: 75, // Define o tamanho do buraco no centro para o formato de donut
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

    // Obtém o elemento canvas
    var ctx = document.getElementById('myChart').getContext('2d');

    // Cria o gráfico de rosca (donut)
    var myChart = new Chart(ctx, {
      type: 'pie',
      data: data,
      options: options
    });
  </script>

        </div>
    </form>
</body>
</html>
