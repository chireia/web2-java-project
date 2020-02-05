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
                                <li>Cursos</li>
                            </ul>
                            <h1>Cursos</h1>
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
                                <th scope="col">Titulo</th>
                                <th scope="col">Tag</th>
                                <th scope="col">Texto</th>
                            </tr>
                        </thead>
                        <tbody>
                            <j:forEach var="p" items="${lista}">
                                <tr>
                                    <td>${p.titulo}</td>
                                    <td>${p.tag}</td>
                                    <td>${p.descricao}</td>
                                    <td>${p.link}</td>
                                    <td>
                                        <a href="cursocdi?editar=${p.id}">
                                            <button class="btn btn-primary">Editar</button>
                                        </a>
                                        <a href="cursocdi?excluir=${p.id}">
                                            <button class="btn btn-danger">Excluir</button>
                                        </a>
                                    </td>
                                </tr>
                            </j:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="col-md-3">
                    <form method="POST" action="cursocdi">
                        <input name="id" type="hidden" value="${curso.id}"/>
                        <div class="form-group">
                            <label id="labelNome" for="titulo">Titulo:</label>
                            <input id="nome" class="form-control" name="titulo" type="text" required  value="${curso.titulo}"/>
                        </div>
                        <div class="form-group">
                            <label id="labelNome" for="tag">Tag:</label>
                            <input id="nome" class="form-control" name="tag" type="text" required  value="${curso.tag}"/>
                        </div>
                        <div class="form-group">
                            <label id="labelNome" for="descricao">Descrição:</label>
                            <input id="nome" class="form-control" name="descricao" type="text" required  value="${curso.descricao}"/>
                        </div>
                        <div class="form-group">
                            <label id="labelNome" for="link">Link:</label>
                            <input id="nome" class="form-control" name="link" type="text" required  value="${curso.link}"/>
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
