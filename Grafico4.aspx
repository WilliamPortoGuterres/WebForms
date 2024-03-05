<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Grafico4.aspx.cs" Inherits="WebForms.Grafico4" %>

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
                    data: [50, 50],
                    backgroundColor: ['green', 'lightgrey']
                }]
            },
            options: {
                rotation: 1 * Math.PI,
                circumference: 1 * Math.PI,
                cutoutPercentage: 60,
                tooltips: { enabled: false },
                hover: { mode: null },
                animation: {
                    animateRotate: true,
                    animateScale: false
                },
                plugins: {
                    datalabels: {
                        display: true,
                        formatter: (value, ctx) => {
                            let sum = 0;
                            let dataArr = ctx.chart.data.datasets[0].data;
                            dataArr.map(data => {
                                sum += data;
                            });
                            let percentage = (value*100 / sum).toFixed(2)+"%";
                            return percentage;
                        },
                        color: 'black',
                    }
                }
            }
        });
    </script>
        </div>
    </form>
</body>
</html>
