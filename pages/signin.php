<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/signin.css" type="text/css">
    <title>Регистрация</title>
</head>
<body>
    <div class="main">
        <div class="login_window">
            <h2 class="login_title">Вход в аккаунт</h2>
            <form class="login_form">
                <div class="login_email input_container">
                    <label for="email">Почта</label>
                    <input type="email" name="email" id="email">
                </div>
                <div class="login_password input_container">
                    <label for="password">Пароль</label>
                    <input type="password" name="password" id="password">
                </div>
                <div class="login_bottom">
                    <input class="submit_btn" type="submit" value="Войти">
                    <a href="./register.php" class="readress">Создать аккаунт</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>