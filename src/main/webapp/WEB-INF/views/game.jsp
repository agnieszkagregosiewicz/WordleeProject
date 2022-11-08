<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Game</title>

    <!-- Custom fonts for this template-->
    <link href="<c:url value="/theme/vendor/fontawesome-free/css/all.min.css"/>" rel="stylesheet" type="text/css">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="<c:url value="/theme/css/sb-admin-2.min.css"/>" rel="stylesheet">

</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

        <!-- Sidebar - Brand -->
        <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/">
            <div class="sidebar-brand-icon rotate-n-15">
                <i class="fas fa-laugh-wink"></i>
            </div>
            <div class="sidebar-brand-text mx-3">Zgadnij hasło <sup></sup></div>
        </a>

        <!-- Divider -->
        <hr class="sidebar-divider my-0">

        <!-- Nav Item - Dashboard -->
        <li class="nav-item">
            <a class="nav-link" href="/">
                <i class="fas fa-fw fa-tachometer-alt"></i>
                <span>Strona główna</span></a>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider">
        <li class="nav-item" style="color: white">
            <div class="nav-link">
            <svg xmlns="http://www.w3.org/2000/svg" style="margin-left: 10px; margin-right: 5px" width="16" height="16" fill="currentColor" class="bi bi-puzzle" viewBox="0 0 16 16">
                <path d="M3.112 3.645A1.5 1.5 0 0 1 4.605 2H7a.5.5 0 0 1 .5.5v.382c0 .696-.497 1.182-.872 1.469a.459.459 0 0 0-.115.118.113.113 0 0 0-.012.025L6.5 4.5v.003l.003.01c.004.01.014.028.036.053a.86.86 0 0 0 .27.194C7.09 4.9 7.51 5 8 5c.492 0 .912-.1 1.19-.24a.86.86 0 0 0 .271-.194.213.213 0 0 0 .039-.063v-.009a.112.112 0 0 0-.012-.025.459.459 0 0 0-.115-.118c-.375-.287-.872-.773-.872-1.469V2.5A.5.5 0 0 1 9 2h2.395a1.5 1.5 0 0 1 1.493 1.645L12.645 6.5h.237c.195 0 .42-.147.675-.48.21-.274.528-.52.943-.52.568 0 .947.447 1.154.862C15.877 6.807 16 7.387 16 8s-.123 1.193-.346 1.638c-.207.415-.586.862-1.154.862-.415 0-.733-.246-.943-.52-.255-.333-.48-.48-.675-.48h-.237l.243 2.855A1.5 1.5 0 0 1 11.395 14H9a.5.5 0 0 1-.5-.5v-.382c0-.696.497-1.182.872-1.469a.459.459 0 0 0 .115-.118.113.113 0 0 0 .012-.025L9.5 11.5v-.003a.214.214 0 0 0-.039-.064.859.859 0 0 0-.27-.193C8.91 11.1 8.49 11 8 11c-.491 0-.912.1-1.19.24a.859.859 0 0 0-.271.194.214.214 0 0 0-.039.063v.003l.001.006a.113.113 0 0 0 .012.025c.016.027.05.068.115.118.375.287.872.773.872 1.469v.382a.5.5 0 0 1-.5.5H4.605a1.5 1.5 0 0 1-1.493-1.645L3.356 9.5h-.238c-.195 0-.42.147-.675.48-.21.274-.528.52-.943.52-.568 0-.947-.447-1.154-.862C.123 9.193 0 8.613 0 8s.123-1.193.346-1.638C.553 5.947.932 5.5 1.5 5.5c.415 0 .733.246.943.52.255.333.48.48.675.48h.238l-.244-2.855zM4.605 3a.5.5 0 0 0-.498.55l.001.007.29 3.4A.5.5 0 0 1 3.9 7.5h-.782c-.696 0-1.182-.497-1.469-.872a.459.459 0 0 0-.118-.115.112.112 0 0 0-.025-.012L1.5 6.5h-.003a.213.213 0 0 0-.064.039.86.86 0 0 0-.193.27C1.1 7.09 1 7.51 1 8c0 .491.1.912.24 1.19.07.14.14.225.194.271a.213.213 0 0 0 .063.039H1.5l.006-.001a.112.112 0 0 0 .025-.012.459.459 0 0 0 .118-.115c.287-.375.773-.872 1.469-.872H3.9a.5.5 0 0 1 .498.542l-.29 3.408a.5.5 0 0 0 .497.55h1.878c-.048-.166-.195-.352-.463-.557-.274-.21-.52-.528-.52-.943 0-.568.447-.947.862-1.154C6.807 10.123 7.387 10 8 10s1.193.123 1.638.346c.415.207.862.586.862 1.154 0 .415-.246.733-.52.943-.268.205-.415.39-.463.557h1.878a.5.5 0 0 0 .498-.55l-.001-.007-.29-3.4A.5.5 0 0 1 12.1 8.5h.782c.696 0 1.182.497 1.469.872.05.065.091.099.118.115.013.008.021.01.025.012a.02.02 0 0 0 .006.001h.003a.214.214 0 0 0 .064-.039.86.86 0 0 0 .193-.27c.14-.28.24-.7.24-1.191 0-.492-.1-.912-.24-1.19a.86.86 0 0 0-.194-.271.215.215 0 0 0-.063-.039H14.5l-.006.001a.113.113 0 0 0-.025.012.459.459 0 0 0-.118.115c-.287.375-.773.872-1.469.872H12.1a.5.5 0 0 1-.498-.543l.29-3.407a.5.5 0 0 0-.497-.55H9.517c.048.166.195.352.463.557.274.21.52.528.52.943 0 .568-.447.947-.862 1.154C9.193 5.877 8.613 6 8 6s-1.193-.123-1.638-.346C5.947 5.447 5.5 5.068 5.5 4.5c0-.415.246-.733.52-.943.268-.205.415-.39.463-.557H4.605z"/>
            </svg>
                <span>Liczba gier: ${user.gamesPlayedQ}</span></div>
        </li>
        <li class="nav-item" style="color: white">
            <div class="nav-link">
            <svg xmlns="http://www.w3.org/2000/svg" style="margin-left: 10px; margin-right: 5px" width="16" height="16" fill="currentColor" class="bi bi-dice-4" viewBox="0 0 16 16">
                <path d="M13 1a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h10zM3 0a3 3 0 0 0-3 3v10a3 3 0 0 0 3 3h10a3 3 0 0 0 3-3V3a3 3 0 0 0-3-3H3z"/>
                <path d="M5.5 4a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm8 0a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm0 8a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm-8 0a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
            </svg>
                <span>Twój wynik to: ${user.score}</span></div>
        </li>
        <li class="nav-item" style="color: white">
            <div class="nav-link">
                <svg xmlns="http://www.w3.org/2000/svg" style="margin-left: 10px; margin-right: 5px" width="16" height="16" fill="currentColor" class="bi bi-award" viewBox="0 0 16 16">
                    <path d="M9.669.864 8 0 6.331.864l-1.858.282-.842 1.68-1.337 1.32L2.6 6l-.306 1.854 1.337 1.32.842 1.68 1.858.282L8 12l1.669-.864 1.858-.282.842-1.68 1.337-1.32L13.4 6l.306-1.854-1.337-1.32-.842-1.68L9.669.864zm1.196 1.193.684 1.365 1.086 1.072L12.387 6l.248 1.506-1.086 1.072-.684 1.365-1.51.229L8 10.874l-1.355-.702-1.51-.229-.684-1.365-1.086-1.072L3.614 6l-.25-1.506 1.087-1.072.684-1.365 1.51-.229L8 1.126l1.356.702 1.509.229z"/>
                    <path d="M4 11.794V16l4-1 4 1v-4.206l-2.018.306L8 13.126 6.018 12.1 4 11.794z"/>
                </svg>
                <span>Masz miejse w rankingu.</span></div>
        </li>
        <!-- Sidebar Toggler (Sidebar) -->
        <div class="text-center d-none d-md-inline">
            <button class="rounded-circle border-0" id="sidebarToggle"></button>
        </div>

    </ul>
    <!-- End of sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <!-- Topbar -->
            <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                <!-- Sidebar Toggle (Topbar) -->
                <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                    <i class="fa fa-bars"></i>
                </button>

                <!-- Topbar Navbar -->
                <ul class="navbar-nav ml-auto">

                    <div class="topbar-divider d-none d-sm-block"></div>

                    <!-- Nav Item - User Information -->
                    <li class="nav-item dropdown no-arrow">
                        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="mr-2 d-none d-lg-inline text-gray-600 small">${user.login}</span>
                            <img class="img-profile rounded-circle"
                                 src="/theme/img/undraw_profile.svg">
                        </a>
                        <!-- Dropdown - User Information -->
                        <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                             aria-labelledby="userDropdown">
                            <a class="dropdown-item" href="/user/">
                                <i class=" fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                Moje konto
                            </a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="/user/logout" data-toggle="modal" data-target="#logoutModal">
                                <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                Wyloguj
                            </a>
                        </div>
                    </li>

                </ul>

            </nav>
            <!-- End of Topbar -->

            <!-- Begin Page Content -->
            <div class="container-fluid1">

                <!-- Page Heading -->
                <div style="margin-bottom: 10px">
                    <h4 class="m-0 font-weight-bold text-primary">Zgadnij słowo w sześciu próbach.</h4>
                </div>
                <div style="height: 50px">
                    <span hidden id=success class="badge badge-pilll badge-success"></span>
                    <span hidden id=warning class="badge badge-pilll badge-warning"></span>
                    <span hidden id=showWord class="badge badge-pilll badge-secondary"></span>
                </div>
                <div class="gactive">
                    <div>
                        <div class="gcell" data-col="0">&nbsp;</div>
                        <div class="gcell" data-col="0">&nbsp;</div>
                        <div class="gcell" data-col="0">&nbsp;</div>
                        <div class="gcell" data-col="0">&nbsp;</div>
                        <div class="gcell" data-col="0">&nbsp;</div>
                    </div>
                    <%--                    <div class="wrmsg">X</div>--%>
                </div>
                <div>
                    <div>
                        <div class="gcell" data-col="0">&nbsp;</div>
                        <div class="gcell" data-col="0">&nbsp;</div>
                        <div class="gcell" data-col="0">&nbsp;</div>
                        <div class="gcell" data-col="0">&nbsp;</div>
                        <div class="gcell" data-col="0">&nbsp;</div>
                    </div>
                    <%--                    <div class="wrmsg">X</div>--%>
                </div>
                <div>
                    <div>
                        <div class="gcell" data-col="0">&nbsp;</div>
                        <div class="gcell" data-col="0">&nbsp;</div>
                        <div class="gcell" data-col="0">&nbsp;</div>
                        <div class="gcell" data-col="0">&nbsp;</div>
                        <div class="gcell" data-col="0">&nbsp;</div>
                    </div>
                    <%--                    <div class="wrmsg">X</div>--%>
                </div>
                <div>
                    <div>
                        <div class="gcell" data-col="0">&nbsp;</div>
                        <div class="gcell" data-col="0">&nbsp;</div>
                        <div class="gcell" data-col="0">&nbsp;</div>
                        <div class="gcell" data-col="0">&nbsp;</div>
                        <div class="gcell" data-col="0">&nbsp;</div>
                    </div>
                    <%--                    <div class="wrmsg">X</div>--%>
                </div>
                <div>
                    <div>
                        <div class="gcell" data-col="0">&nbsp;</div>
                        <div class="gcell" data-col="0">&nbsp;</div>
                        <div class="gcell" data-col="0">&nbsp;</div>
                        <div class="gcell" data-col="0">&nbsp;</div>
                        <div class="gcell" data-col="0">&nbsp;</div>
                    </div>
                    <%--                    <div class="wrmsg">X</div>--%>
                </div>
                <div>
                    <div>
                        <div class="gcell" data-col="0">&nbsp;</div>
                        <div class="gcell" data-col="0">&nbsp;</div>
                        <div class="gcell" data-col="0">&nbsp;</div>
                        <div class="gcell" data-col="0">&nbsp;</div>
                        <div class="gcell" data-col="0">&nbsp;</div>
                    </div>
                    <%--                    <div class="wrmsg">X</div>--%>

                </div>
                <div style="margin-top: 10px">
                    <button class="btkey" data-let="Q" data-col="0">Q</button>
                    <button class="btkey" data-let="W" data-col="0">W</button>
                    <button class="btkey" data-let="E" data-col="0">E</button>
                    <button class="btkey" data-let="R" data-col="0">R</button>
                    <button class="btkey" data-let="T" data-col="0">T</button>
                    <button class="btkey" data-let="Y" data-col="0">Y</button>
                    <button class="btkey" data-let="U" data-col="0">U</button>
                    <button class="btkey" data-let="I" data-col="0">I</button>
                    <button class="btkey" data-let="O" data-col="0">O</button>
                    <button class="btkey" data-let="P" data-col="0">P</button>
                </div>
                <div>
                    <button class="btkey" data-let="A" data-col="0">A</button>
                    <button class="btkey" data-let="S" data-col="0">S</button>
                    <button class="btkey" data-let="D" data-col="0">D</button>
                    <button class="btkey" data-let="F" data-col="0">F</button>
                    <button class="btkey" data-let="G" data-col="0">G</button>
                    <button class="btkey" data-let="H" data-col="0">H</button>
                    <button class="btkey" data-let="J" data-col="0">J</button>
                    <button class="btkey" data-let="K" data-col="0">K</button>
                    <button class="btkey" data-let="L" data-col="0">L</button>
                </div>
                <div>
                    <button class="btkey" data-let="-" data-col="0" style="width: 1.5%; opacity: 0;">-</button>
                    <button class="btkey" data-let="Z" data-col="0">Z</button>
                    <button class="btkey" data-let="X" data-col="0">X</button>
                    <button class="btkey" data-let="C" data-col="0">C</button>
                    <button class="btkey" data-let="V" data-col="0">V</button>
                    <button class="btkey" data-let="B" data-col="0">B</button>
                    <button class="btkey" data-let="N" data-col="0">N</button>
                    <button class="btkey" data-let="M" data-col="0">M</button>
                    <button class="bkspc klight" data-let="<" data-col="0" style="width: 4.5%; opacity: 1;">
                        &lt;
                    </button>
                </div>
                <div>
                    <button class="btkey" data-let="Ą" data-col="0">Ą</button>
                    <button class="btkey" data-let="Ś" data-col="0">Ś</button>
                    <button class="btkey" data-let="Ę" data-col="0">Ę</button>
                    <button class="btkey" data-let="Ć" data-col="0">Ć</button>
                    <button class="btkey" data-let="Ż" data-col="0">Ż</button>
                    <button class="btkey" data-let="Ź" data-col="0">Ź</button>
                    <button class="btkey" data-let="Ń" data-col="0">Ń</button>
                    <button class="btkey" data-let="Ó" data-col="0">Ó</button>
                    <button class="btkey" data-let="Ł" data-col="0">Ł</button>
                </div>
                <div class="col-lg-61">
                    <h6 hidden id="playAgain" class="m-0 font-weight-bold text-primary">
                        <a href="/user/game"
                           class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i>

                            <img class="sidebar-card-illustration mb-2" src="/theme/img/undraw_rocket.svg"
                                 alt="Rocket" width="20" height="20"></i> Losuj następne! </a>
                    </h6>

                    <!-- Basic Card Example -->
                    <div class="card shadow mb-4" style="margin-top: 20px">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Zasady</h6>
                        </div>
                        <div class="card-body1">
                            <span class="badge badge-pilll badge-success">X</span>
                            - literka w dobrym miejscu,
                            <span class="badge badge-pilll badge-warning">Y</span>
                            - literka w złym miejscu,
                            <span class="badge badge-pilll badge-secondary">Z</span>
                            - nie ma tej literki w szukanym słowie.
                        </div>
                    </div>

                </div>

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- End of Main Content -->

        <!-- Footer -->
        <footer class="sticky-footer bg-white">
            <div class="container my-auto">
                <div class="copyright text-center my-auto">
                    <span>Copyright &copy; Wordlee Project 2022</span>
                </div>
            </div>
        </footer>
        <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Gotowy do wyjścia?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Wybierz 'wyloguj' jeśli chcesz zakończyć sesję.</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Wróć</button>
                    <form action="<c:url value="/logout"/>" method="post">
                        <input type="submit" value="Wyloguj">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    </form>

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
<script src="/theme/js/game.js"></script>

</body>

</html>
