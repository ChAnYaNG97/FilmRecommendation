<!doctype html>
<html lang="en">

<head>
    <title>MovieFM</title>

    <!-- Required meta tags -->
    <meta charset="utf-8"></meta>

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"></meta>

    <!-- Bootstrap CSS -->

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb"
        crossorigin="anonymous"></link>

    <link rel="stylesheet" href="./css/login.css"></link>
</head>

<body>
    <canvas id="canvas"></canvas>

    <div class="card border-light text-center" id="login-card">
    

        <div class="card-body">

            <div id="emailMtd" class="pill-pane fade show active">
                <img id="login-img" src="./images/brand.png">
                <form  method="post" accept-charset="utf-8" action="/web/login">
                <input id="username" class="form-control form-control-sm" name="username" type="text" placeholder="Username">
                <input id="password" class="form-control form-control-sm" name="password" type="password" placeholder="Password">
                <div class="buttons" role="group" aria-label="Basic example">
                    <button type="submit" class="btn btn-outline-primary btn-sm " >Login</button>
                </div>
                </form>
                
            </div>

            

            
        </div>
        </div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->

    <script>
        //定义画布宽高和生成点的个数
        var WIDTH = window.innerWidth,
            HEIGHT = window.innerHeight,
            POINT = 20;

        var canvas = document.getElementById('canvas');
        canvas.width = WIDTH,
        canvas.height = HEIGHT;
        var context = canvas.getContext('2d');

            context.strokeStyle = 'rgba(255,255,255,0.02)',
            context.strokeWidth = 1,
            context.fillStyle = 'rgba(255,255,255,0.05)';
        var circleArr = [];

        //线条：开始xy坐标，结束xy坐标，线条透明度
        function Line(x, y, _x, _y, o) {
            this.beginX = x,
                this.beginY = y,
                this.closeX = _x,
                this.closeY = _y,
                this.o = o;
        }
        //点：圆心xy坐标，半径，每帧移动xy的距离
        function Circle(x, y, r, moveX, moveY) {
            this.x = x,
                this.y = y,
                this.r = r,
                this.moveX = moveX,
                this.moveY = moveY;
        }
        //生成max和min之间的随机数
        function num(max, _min) {
            var min = arguments[1] || 0;
            return Math.floor(Math.random() * (max - min + 1) + min);
        }
        // 绘制原点
        function drawCricle(cxt, x, y, r, moveX, moveY) {
            var circle = new Circle(x, y, r, moveX, moveY)
            cxt.beginPath()
            cxt.arc(circle.x, circle.y, circle.r, 0, 2 * Math.PI)
            cxt.closePath()
            cxt.fill();
            return circle;
        }
        //绘制线条
        function drawLine(cxt, x, y, _x, _y, o) {
            var line = new Line(x, y, _x, _y, o)
            cxt.beginPath()
            cxt.strokeStyle = 'rgba(255,255,255,' + o + ')'
            cxt.moveTo(line.beginX, line.beginY)
            cxt.lineTo(line.closeX, line.closeY)
            cxt.closePath()
            cxt.stroke();

        }
        //初始化生成原点
        function init() {
            circleArr = [];
            for (var i = 0; i < POINT; i++) {
                circleArr.push(drawCricle(context, num(WIDTH), num(HEIGHT), num(15, 2), num(10, -10) / 40, num(10, -10) /
                    40));
            }
            draw();
        }

        //每帧绘制
        function draw() {
            context.fillStyle = 'rgba(0,0,0,0.1)'
            context.fillRect(0, 0, canvas.width, canvas.height);
            context.fillStyle = 'rgba(255,255,255,0.05)'
            for (var i = 0; i < POINT; i++) {
                drawCricle(context, circleArr[i].x, circleArr[i].y, circleArr[i].r);
            }
            for (var i = 0; i < POINT; i++) {
                for (var j = 0; j < POINT; j++) {
                    if (i + j < POINT) {
                        var A = Math.abs(circleArr[i + j].x - circleArr[i].x),
                            B = Math.abs(circleArr[i + j].y - circleArr[i].y);
                        var lineLength = Math.sqrt(A * A + B * B);
                        var C = 1 / lineLength * 7 - 0.009;
                        var lineOpacity = C > 0.03 ? 0.03 : C;
                        if (lineOpacity > 0) {
                            drawLine(context, circleArr[i].x, circleArr[i].y, circleArr[i + j].x, circleArr[i + j].y,
                                lineOpacity);
                        }
                    }
                }
            }
        }

        function funcemailMtd() {
            document.getElementById("emailMtd").setAttribute("style", "display:block");
            document.getElementById("wechatMtd").setAttribute("style", "display:none");
            document.getElementById("mobileMtd").setAttribute("style", "display:none");
        }

        function funcwechatMtd() {
            document.getElementById("emailMtd").setAttribute("style", "display:none");
            document.getElementById("wechatMtd").setAttribute("style", "display:block");
            document.getElementById("mobileMtd").setAttribute("style", "display:none");

        }

        function funcmobileMtd() {
            document.getElementById("emailMtd").setAttribute("style", "display:none");
            document.getElementById("wechatMtd").setAttribute("style", "display:none");
            document.getElementById("mobileMtd").setAttribute("style", "display:block");

        }

        var clock = '';
        var nums = 60;
        var btn;

        function sendCode(thisBtn) {
            btn = thisBtn;
            btn.disabled = true; //将按钮置为不可点击
            btn.value = "重新获取(" + nums + "s)";
            clock = setInterval(doLoop, 1000); //一秒执行一次
        }

        function doLoop() {
            nums--;
            if (nums > 0) {
                btn.value = "重新获取(" + nums + "s)";
            } else {
                clearInterval(clock); //清除js定时器
                btn.disabled = false;
                btn.value = '获取验证码';
                nums = 60; //重置时间
            }
        }
        //调用执行
        window.onload = function () {
            init();
            setInterval(function () {
                for (var i = 0; i < POINT; i++) {
                    var cir = circleArr[i];
                    cir.x += cir.moveX;
                    cir.y += cir.moveY;
                    if (cir.x > WIDTH) cir.x = 0;
                    else if (cir.x < 0) cir.x = WIDTH;
                    if (cir.y > HEIGHT) cir.y = 0;
                    else if (cir.y < 0) cir.y = HEIGHT;

                }
                draw();
            }, 16);
        }
    </script>

    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>

    <script src="https://cdn.bootcss.com/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
        crossorigin="anonymous"></script>

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ"
        crossorigin="anonymous"></script>
</body>

</html>