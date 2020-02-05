<%@taglib prefix="j" uri="http://java.sun.com/jsp/jstl/core"%>
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
                                <li>Tags</li>
                            </ul>
                            <h1>Tags</h1>
                        </div>
                    </div>
                </div>
            </div>
        </header>

        <div class="section">
            <div class="container">
                <div class="col-md-9">
                    <table class="table">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col">Nome</th>
                            </tr>
                        </thead>
                        <tbody>
                            <j:forEach var="t" items="${lista}">
                                <tr>
                                    <td>${t.nome}</td>
                                    <td>
                                        <a href="tagjstl?editar=${t.id}">
                                            <button class="btn btn-primary">Editar</button>
                                        </a>
                                        <a href="tagjstl?excluir=${t.id}">
                                            <button class="btn btn-danger">Excluir</button>
                                        </a>
                                    </td>
                                </tr>
                              </j:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="col-md-3">
                    <form method="POST" action="tagjstl">
                        <input name="id" type="hidden" value="${tag.id}"/>
                        <div class="form-group">
                            <label id="labelNome" for="nome">Nome:</label>
                            <input id="nome" class="form-control" name="nome" type="text" required  value="${tag.nome}"/>
                        </div>
                        <button id="sbutton" type="submit" class="btn btn-primary">Salvar</button>
                    </form>
                </div>
            </div>
        </div>

        <footer id="footer"></footer>

        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
