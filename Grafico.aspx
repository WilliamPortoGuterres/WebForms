<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Grafico.aspx.cs" Inherits="WebForms.Grafico" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <title>Gráfico Donut com porcentagem</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        canvas {
            max-width: 400px;
            margin: 0 auto;
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
            font-size: 24px;
            font-weight: bold;
        }
    </style>
</head>





<form id="form2" runat="server">
    <div>
        <div id="chart-container">
            <canvas id="myChart"></canvas>
            <div id="chart-value"></div>
        </div>

        <script>
            // Dados para o gráfico
            var data = {
                labels: ['Red', 'Blue', 'Yellow'],
                datasets: [{
                    data: [30, 20, 50],
                    backgroundColor: ['#FF6384', '#36A2EB', '#FFCE56'],
                    hoverBackgroundColor: ['#FF6384', '#36A2EB', '#FFCE56']
                }]
            };

            // Opções do gráfico
            var options = {
                cutoutPercentage: 80, // Define o tamanho do buraco no centro para o formato de rosca (donut)
                animation: {
                    animateScale: true,
                    animateRotate: true
                },
                legend: {
                    display: false
                }
            };

            // Obtém o elemento canvas
            var ctx = document.getElementById('myChart').getContext('2d');

            // Cria o gráfico de rosca (donut)
            var myChart = new Chart(ctx, {
                type: 'doughnut',
                data: data,
                options: options
            });

            // Exibir a porcentagem no centro
            var total = data.datasets[0].data.reduce((a, b) => a + b, 0);
            var centerText = (ctx) => {
                var sum = data.datasets[0].data.reduce((a, b) => a + b, 0);
                var text = total + '%';
                var textX = Math.round((ctx.chart.width - ctx.measureText(text).width) / 2);
                var textY = ctx.chart.height / 2 + 10;

                ctx.fillText(text, textX, textY);
            };

            centerText(ctx);
        </script>


    </div>
</form>

</html>
