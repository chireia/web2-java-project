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
            <%@include file="navbar.html"%>
            <div class="page-header">
                <div class="container">
                    <div class="row">
                        <div class="col-md-10">
                            <ul class="page-header-breadcrumb">
                                <li><a href="index.jsp">Home</a></li>
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
