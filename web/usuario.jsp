<%@page import="java.util.List"%>
<%@page import="entidades.Usuario"%>
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
                            <a href="usuario"><i class="fa fa-user"></i></a>
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
                                <li>Usuários</li>
                            </ul>
                            <h1>Usuários</h1>
                        </div>
                    </div>
                </div>
            </div>
        </header>

        <div class="section">
            <div class="container">
                <%
                    int id = 0;
                    String nome = "";
                    String usuario = "";
                    String senha = "";
                    String cSenha = "";
                    int nivelAcesso = 0;
                    if (request.getAttribute("usuario") != null) {
                        Usuario ed = (Usuario) request.getAttribute("usuario");
                        id = ed.getId();
                        nome = ed.getNome();
                        usuario = ed.getUsuario();
                        senha = ed.getSenha();
                        nivelAcesso = ed.getNivelAcesso();
                    }
                %>        
                <div class="col-md-9">
                    <table class="table">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col">Nome</th>
                                <th scope="col">Usuário</th>
                                <th scope="col">Nível Acesso</th>
                                <th scope="col">Ações</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% List<Usuario> lista;
                                lista = (List<Usuario>) request.getAttribute("lista");
                            %>
                            <% for (Usuario u : lista) {%>
                            <tr>
                                <td><%= u.getNome()%></td>
                                <td><%= u.getUsuario()%></td>
                                <td><%= u.getNivelAcesso() == 1 ? "Admin" : "Editor"%></td>
                                <td>
                                    <a href="usuario?editar=<%= u.getId()%>">
                                        <button class="btn btn-primary">Editar</button>
                                    </a>
                                    <a href="usuario?excluir=<%= u.getId()%>">
                                        <button class="btn btn-danger">Excluir</button>
                                    </a>
                                </td>
                            </tr>
                            <%}%>
                        </tbody>
                    </table>
                </div>
                <div class="col-md-3">
                    <form method="POST" action="usuario">
                        <input name="id" type="hidden" value="<%= id%>"/>
                        <div class="form-group">
                            <label id="labelNome" for="nome">Nome:</label>
                            <input id="nome" class="form-control" name="nome" type="text" required  value="<%= nome%>"/>
                        </div>
                        <div class="form-group">
                            <label id="labelUsuario" for="usuario">Usuário:</label>
                            <input id="usuario" class="form-control" name="usuario" type="text" required value="<%= usuario%>"/>
                        </div>
                        <div class="form-group">
                            <label id="labelNivelAcesso" for="nivelAcesso">Nível Acesso:</label>
                            <select class="form-control" id="nivelAcesso" name="nivelAcesso" required>
                                <option value="0" hidden="">Selecione</option>
                                <option value="1" <%= nivelAcesso == 1 ? "selected" : null%>>Admin</option>
                                <option value="2" <%= nivelAcesso == 2 ? "selected" : null%>>Editor</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label id="labelSenha" for="senha">Senha:</label>
                            <input id="senha" class="form-control" name="senha" type="password" onkeyup="checkPasswords()" required value="<%= senha%>"/>
                        </div>
                        <div class="form-group">
                            <label id="labelSenha" for="csenha">Confirme a Senha:</label>
                            <input id="csenha" class="form-control" type="password" onkeyup="checkPasswords()" required value="<%= cSenha%>"/>
                        </div>
                        <button id="sbutton" type="submit" class="btn btn-primary" disabled >Salvar</button>
                    </form>
                </div>
            </div>
        </div>

        <footer id="footer"></footer>

        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>
        <script>
                                function checkPasswords() {
                                    const senha = document.getElementById("senha").value;
                                    const cSenha = document.getElementById("csenha").value;
                                    console.log(senha === cSenha);
                                    if (senha === cSenha) {
                                        document.getElementById("sbutton").removeAttribute("disabled");
                                    } else {
                                        document.getElementById("sbutton").setAttribute("disabled", "disabled");
                                    }
                                }
        </script>
    </body>
</html>