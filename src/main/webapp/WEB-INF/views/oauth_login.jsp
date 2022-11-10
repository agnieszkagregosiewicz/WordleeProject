<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "c" uri ="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <%@ include file="/WEB-INF/fragments/meta.jsp" %>

    <title>Login</title>

    <!-- Custom fonts for this template-->
    <link href="/theme/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/theme/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body class="bg-gradient-primary">

<div class="container">
    <!-- Outer Row -->
    <div class="row justify-content-center">
        <div class="col-xl-10 col-lg-12 col-md-9">
            <div class="card o-hidden border-0 shadow-lg my-5">
                <div class="card-body p-0">
                    <!-- Nested Row within Card Body -->
                    <div class="row">
                        <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                        <div class="col-lg-6">
                            <div class="p-5">
                                <div class="text-center">
                                    <h1 class="h4 text-gray-900 mb-4">Zaloguj się</h1>
                                </div>
                                <form class="user/add" method="post">
                                    <div class="form-group">
                                        <input name="username" class="form-control form-control-user"
                                                    placeholder="Wpisz email"/>
                                    </div>
                                        <div class="form-group">
                                            <input name="password" type="password"
                                                        class="form-control form-control-user"
                                                        placeholder="Wpisz hasło"/>
                                        </div>
                                    <div class="text-center" style="height: 40px">
                                    <c:if test="${param.error != null && param.error.equals('')}">
                                    <h4 class="h6 text-gray-900 mb-4">Nieprawidłowe dane logowania</h4>
                                    </c:if>
                                    </div>
                                    <input class="btn btn-primary btn-user btn-block" type="submit" value="Zaloguj się"/>
                                    <hr>

                                    <a href="https://accounts.google.com/o/oauth2/v2/auth" class="btn btn-google btn-user btn-block">
                                        <i class="fab fa-google fa-fw"></i> Zaloguj za pomocą Google
                                    </a>
                                    <a href="www.facebook.com/v15.0/dialog/oauth?" class="btn btn-facebook btn-user btn-block">
                                        <i class="fab fa-facebook-f fa-fw"></i> Zaloguj za pomocą Facebook'a
                                    </a>

                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                </form>
                                <hr>
                                <%--                                <div class="text-center">--%>
                                <%--                                    <a class="small" href="forgot-password.html">Nie pamiętasz hasła?</a>--%>
                                <%--                                </div>--%>
                                <div class="text-center">
                                    <a class="small" href="/add">Nie masz jeszcze konta? Zarejestruj się!</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Bootstrap core JavaScript-->
<script src="/theme/vendor/jquery/jquery.min.js"></script>
<script src="/theme/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="/theme/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="/theme/js/sb-admin-2.min.js"></script>

</body>

</html>
