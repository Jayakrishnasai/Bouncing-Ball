<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Bouncing Ball Game for Children</title>
    <style>
        body {
            text-align: center;
            font-family: Arial, sans-serif;
        }
        canvas {
            border: 3px solid #000;
            background-color: #e0f7fa;
        }
        h1 {
            color: #00796b;
        }
    </style>
</head>
<body>
    <h1>Bouncing Ball Game</h1>
    <canvas id="gameCanvas" width="500" height="400"></canvas>

    <script>
        const canvas = document.getElementById("gameCanvas");
        const ctx = canvas.getContext("2d");

        let x = canvas.width / 2;
        let y = canvas.height / 2;
        let dx = 2;
        let dy = 3;
        let radius = 20;

        function drawBall() {
            ctx.clearRect(0, 0, canvas.width, canvas.height);
            ctx.beginPath();
            ctx.arc(x, y, radius, 0, Math.PI * 2);
            ctx.fillStyle = "#ff4081";
            ctx.fill();
            ctx.closePath();

            if (x + dx > canvas.width - radius || x + dx < radius) {
                dx = -dx;
            }
            if (y + dy > canvas.height - radius || y + dy < radius) {
                dy = -dy;
            }

            x += dx;
            y += dy;
        }

        setInterval(drawBall, 20);
    </script>
</body>
</html>
