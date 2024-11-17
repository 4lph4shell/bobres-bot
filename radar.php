<!DOCTYPE html>
<html lang="fa">

<head>
    <meta charset="UTF-8">
    <meta name="subject" content="رادار استرابری سرور">
    <meta name="copyright" content="رادار استرابری سرور">
    <meta name="author" content="A747iR, 4lph4-ir@gmail.com">
    <meta name="designer" content="A747ir">
    <meta name="owner" content="Strawberry server radar">
    <meta name="theme-color" content="#172B4D">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1">
    <meta http-equiv="Cache-Control" content="no-store" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
    <title>Strawberry Server Radar | رادار استرابری سرور</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Vazir&display=swap');

        .pos {
            margin: auto;
            width: 100%;
            padding: 0px;
        }

        body {
            font-family: 'Vazir', cursive;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            background-color: black;
            color: white;
            /* Ensure text is readable on a black background */
        }

        header,
        footer {
            background-color: #172B4D;
            text-align: center;
            padding: 1rem;
        }

        .logo {
            height: 100px;
        }

        .iframe-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            flex-grow: 1;
            padding: 20px;
        }

        .iframe-title {
            font-size: 1.4em;
            margin: 10px 0;
            color: #ffffff;
            background-color: #172B4D;
            text-decoration: none;
            font-weight: bold;
            border-radius: 10px;
            /* Add border-radius to make the corners rounded */
            padding: 10px;
            /* Optional: add some padding for better appearance */
        }

        iframe {
            width: 98%;
            height: 780px;
            border: none;
            margin-bottom: 20px;
        }

        .nav-buttons {
            margin-top: 10px;
        }

        .nav-buttons a {
            margin: 0 10px;
            padding: 10px 20px;
            text-decoration: none;
            color: white;
            background-color: #30363D;
            border-radius: 5px;
        }

        .menu {
            display: none;
            flex-direction: column;
            align-items: center;
        }

        .menu-title {
            font-size: 1.2em;
            margin: 10px 0;
            display: none;
        }

        .menu a {
            padding: 10px;
            text-decoration: none;
            color: #ffffff;
            display: block;
        }

        .hamburger {
            display: none;
            cursor: pointer;
        }

        @media (max-width: 600px) {
            .nav-buttons {
                display: none;
            }

            .hamburger {
                display: block;
            }

            .menu-title {
                display: block;
            }
        }
    </style>
    <script>
        function toggleMenu() {
            const menu = document.querySelector('.menu');
            menu.style.display = menu.style.display === 'flex' ? 'none' : 'flex';
        }
    </script>
</head>

<body onload="detectBrowser()">
    <header>
        <img src="https://strawberryvps.com/wp-content/uploads/2024/10/strawberryvps-bot-logo.png" alt="Logo" class="logo">
        <h1>Strawberry Server Radar<br>رادار استرابری سرور</h1>
        <div class="nav-buttons">
            <a href="https://strawberryvps.com/" target="_blank">Home / خانه</a>
            <a href="https://bot.strawberryvps.com/radar.php" target="_blank">Strawberry Radar / رادار استرابری سرور</a>
            <a href="https://bot.strawberryvps.com/io.php" target="_blank">Volume Service / مشاهده حجم و زمان سرویس</a>
            <a href="https://strawberryvps.com/contact" target="_blank">Contact Us / ارتباط با ما</a>
        </div>
        <div class="hamburger" onclick="toggleMenu()">
            ☰ Menu / منو
        </div>
        <div class="menu">
            <a href="https://strawberryvps.com/" target="_blank">Home / خانه</a>
            <a href="https://bot.strawberryvps.com/radar.php" target="_blank">Strawberry Radar / رادار استرابری سرور</a>
            <a href="https://bot.strawberryvps.com/io.php" target="_blank">Volume Service / مشاهده حجم و زمان سرویس</a>
            <a href="https://strawberryvps.com/contact" target="_blank">Contact Us / ارتباط با ما</a>
        </div>
    </header>
    <div class="pos">
        <div class="iframe-container">
            <div class="iframe-title">تست سرعت استرابری سرور</div>
            <iframe src="https://openspeedtest.com/Get-widget.php" width="755" scrolling="no" height="380" frameborder="0"></iframe>
            <br />
            <div style="text-align:center; width: 1000px;"></div>
        </div>
    </div>
    <div class="iframe-container">
        <div class="iframe-title">گزارش اختلالات اپراتوری داخل ایران</div>
        <iframe src="https://radar.parsico.org/"></iframe>
        <div class="iframe-title">گزارش دقیق مکان و سورس سرور شما</div>
        <iframe src="https://whoer.com/"></iframe>
        <div class="iframe-title">گزارش اختلالات جهانی نت بلاک</div>
        <iframe src="https://netblocks.org/"></iframe>
    </div>
    <footer>
        <div class="nav-buttons">
            <a href="https://strawberryvps.com/" target="_blank">Home</a>
            <a href="https://bot.strawberryvps.com/radar.php" target="_blank">Strawberry Radar</a>
            <a href="https://bot.strawberryvps.com/io.php" target="_blank">Volume Service</a>
            <a href="https://strawberryvps.com/contact" target="_blank">Contact Us</a>
        </div>
        <p>Strawberry Server &copy; 2024 | استرابری سرور</p>
    </footer>
    <script type="text/javascript">
        window.$crisp = [];
        window.CRISP_WEBSITE_ID = "c0641237-20a1-48b4-9580-09287a367a58";
        (function() {
            d = document;
            s = d.createElement("script");
            s.src = "https://client.crisp.chat/l.js";
            s.async = 1;
            d.getElementsByTagName("head")[0].appendChild(s);
        })();
    </script>
</body>

</html>