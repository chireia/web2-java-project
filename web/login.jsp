<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Tec Niws</title>

        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />

        <link
            href="https://fonts.googleapis.com/css?family=Nunito+Sans:700%7CNunito:300,600"
            rel="stylesheet"
            />
        <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />
        <link rel="stylesheet" href="css/font-awesome.min.css" />
        <link type="text/css" rel="stylesheet" href="css/style.css" />
    </head>
    <body>
        <header id="header">
            <div id="nav">
                <div id="nav-fixed">
                    <div class="container">
                        <div class="nav-logo">
                            <a href="index.html" class="logo"
                               ><img src="./img/logo.png" alt=""
                                  /></a>
                        </div>

                        <ul class="nav-menu nav navbar-nav">
                            <li><a href="">News</a></li>
                            <li><a href="">Popular</a></li>
                            <li class="cat-1"><a href="">Web Design</a></li>
                            <li class="cat-2"><a href="">JavaScript</a></li>
                            <li class="cat-3"><a href="">Css</a></li>
                            <li class="cat-4"><a href="">Jquery</a></li>
                        </ul>

                        <div class="nav-btns">
                            <a href="login"><i class="fa fa-user"></i></a>
                            <button class="aside-btn"><i class="fa fa-bars"></i></button>
                        </div>
                    </div>
                </div>

                <div id="nav-aside">
                    <div class="section-row">
                        <ul class="nav-aside-menu">
                            <li><a href="index.html">Home</a></li>
                            <li><a href="usuario">Usuários</a></li>
                        </ul>
                    </div>

                    <button class="nav-aside-close"><i class="fa fa-times"></i></button>
                </div>
            </div>
            <div class="page-header">
                <div class="container">
                    <div class="row">
                        <div class="col-md-10">
                            <ul class="page-header-breadcrumb">
                                <li><a href="index.html">Home</a></li>
                                <li>Login</li>
                            </ul>
                            <h1>Login</h1>
                        </div>
                    </div>
                </div>
            </div>
        </header>

        <div class="section">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-md-offset-3">
                        ${teste}
                        <form method="POST" action="login">
                            <div class="form-group">
                                <label id="labelUsuario" for="usuario">Usuário:</label>
                                <input id="usuario" class="form-control" name="usuario" type="text" required />
                            </div>
                            <div class="form-group">
                                <label id="labelSenha" for="senha">Senha:</label>
                                <input id="senha" class="form-control" name="senha" type="password" required/>
                            </div>
                            <button id="sbutton" type="submit" class="btn btn-primary" >Login</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <footer id="footer"></footer>

        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
