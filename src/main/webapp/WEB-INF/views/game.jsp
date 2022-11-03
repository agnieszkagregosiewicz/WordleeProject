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
                            <a class="dropdown-item" href="/user/${user.id}">
                                <i class=" fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                Moje konto
                            </a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="/logout" data-toggle="modal" data-target="#logoutModal">
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
                <h1 class="h3 mb-4 text-gray-800">Zgadnij słowo w sześciu próbach.</h1>
<%--                <button hidden class="btn-icon-split btn-warning" ></button>--%>
<%--                <button hidden class="btn-icon-split btn-success"></button>--%>
                <span hidden id=success class="badge badge-pilll badge-success"></span>
                <span hidden id=warning class="badge badge-pilll badge-warning"></span>
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
                <div>
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

                    <!-- Basic Card Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Zasady</h6>
                        </div>
                        <div class="card-body1">
                            <span class="badge badge-pilll badge-success">Z</span>
                            - literka w dobrym miejscu,
                            <span class="badge badge-pilll badge-warning">X</span>
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
                <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <a class="btn btn-primary" href="/logout">Logout</a>
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
