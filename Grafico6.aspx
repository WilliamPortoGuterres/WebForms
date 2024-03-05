<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Grafico6.aspx.cs" Inherits="WebForms.Grafico6" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
   <title>Gráfico de Rosca em Canvas</title>

</head>
<body>
    <form id="form1" runat="server">
        <div>
             <canvas id="donutCanvas" width="200" height="200"></canvas>
    <script>
        const canvas = document.getElementById('donutCanvas');
        const ctx = canvas.getContext('2d');
        const centerX = canvas.width / 2;
        const centerY = canvas.height / 2;
        const radius = 70;
        const thickness = 30;

        // Desenha o fundo cinza
        ctx.beginPath();
        ctx.arc(centerX, centerY, radius, 0, Math.PI * 2);
        ctx.lineWidth = thickness;
        ctx.strokeStyle = '#eee';
        ctx.stroke();

        // Desenha a parte preenchida do gráfico
        ctx.beginPath();
        ctx.arc(centerX, centerY, radius, -Math.PI / 2, (Math.PI * 2 * 50 / 100) - Math.PI / 2);
        ctx.lineWidth = thickness;
        ctx.strokeStyle = 'green';
        ctx.stroke();

        // Adiciona texto no centro
        ctx.fillStyle = 'black';
        ctx.font = '24px Arial';
        ctx.textAlign = 'center';
        ctx.textBaseline = 'middle';
        ctx.fillText('50%', centerX, centerY);
    </script>
        </div>
    </form>
</body>
</html>
