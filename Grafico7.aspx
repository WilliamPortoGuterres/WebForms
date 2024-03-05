<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Grafico7.aspx.cs" Inherits="WebForms.Grafico7" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
     <title>Gráfico de Rosca</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
              <div style="width: 300px;">
            <canvas id="myChart"></canvas>
        </div>

        <script>
            var ctx = document.getElementById('myChart').getContext('2d');
            var myChart = new Chart(ctx, {
                type: 'doughnut',
                data: {
                    datasets: [{
                        data: [50, 50], // 50% ocupado, 50% vazio
                        backgroundColor: ['green', 'lightgrey']
                    }]
                },
                options: {
                    rotation: -Math.PI, // Iniciar do topo
                    circumference: Math.PI, // Metade do círculo
                    cutout: '60%', // Espessura do donut
                    tooltips: {enabled: false},
                    hover: {mode: null},
                    animation: {
                        animateRotate: true,
                        animateScale: false
                    },
                    // Plugins como datalabels devem ser adicionados somente se você os incluiu
                }
            });
        </script>
        </div>
    </form>
</body>
</html>
