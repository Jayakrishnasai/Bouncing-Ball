<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Bouncing Ball Game</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; background: #eef; }
        canvas { border: 2px solid #444; background: #fff; display: block; margin: 20px auto; }
        #controls { margin-top: 10px; }
        button, input[type=range] {
            padding: 8px 15px;
            margin: 5px;
            font-size: 16px;
        }
    </style>
</head>
<body>

<h1>Bouncing Ball Game</h1>
<canvas id="ballCanvas" width="500" height="300"></canvas>

<div id="controls">
    <button onclick="startGame()">Start</button>
    <button onclick="pauseGame()">Pause</button>
    <button onclick="resetGame()">Reset</button>
    <label>
        Speed:
        <input type="range" id="speedControl" min="1" max="20" value="5" onchange="changeSpeed(this.value)">
    </label>
</div>

<p>Use arrow keys (↑ ↓ ← →) to control the ball manually</p>

<script>
    const canvas = document.getElementById('ballCanvas');
    const ctx = canvas.getContext('2d');

    let x = canvas.width / 2;
    let y = canvas.height / 2;
    let dx = 2;
    let dy = -2;
    let radius = 15;
    let interval = null;
    let speed = 5;
    let manualControl = false;

    function drawBall() {
        ctx.clearRect(0, 0, canvas.width, canvas.height);
        ctx.beginPath();
        ctx.arc(x, y, radius, 0, Math.PI * 2);
        ctx.fillStyle = "#0095DD";
        ctx.fill();
        ctx.closePath();

        if (!manualControl) {
            x += dx;
            y += dy;

            if (x + dx > canvas.width - radius || x + dx < radius) dx = -dx;
            if (y + dy > canvas.height - radius || y + dy < radius) dy = -dy;
        }
    }

    function startGame() {
        manualControl = false;
        if (!interval) {
            interval = setInterval(drawBall, 1000 / speed);
        }
    }

    function pauseGame() {
        clearInterval(interval);
        interval = null;
    }

    function resetGame() {
        pauseGame();
        x = canvas.width / 2;
        y = canvas.height / 2;
        dx = 2;
        dy = -2;
        manualControl = false;
        drawBall();
    }

    function changeSpeed(val) {
        speed = parseInt(val);
        if (interval) {
            pauseGame();
            startGame();
        }
    }

    // Manual control with arrow keys
    document.addEventListener('keydown', (e) => {
        manualControl = true;
        switch (e.key) {
            case 'ArrowUp': y -= 10; break;
            case 'ArrowDown': y += 10; break;
            case 'ArrowLeft': x -= 10; break;
            case 'ArrowRight': x += 10; break;
        }
        drawBall();
    });

    // Initial draw
    drawBall();
</script>

</body>
</html>
