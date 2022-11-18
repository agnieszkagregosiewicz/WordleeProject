<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<head>

    <%@ include file="/WEB-INF/fragments/meta.jsp" %>

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
        <a class="sidebar-brand d-flex align-items-center justify-content-center" href="<c:url value="/"/>">
            <div class="sidebar-brand-icon rotate-n-15">
                <i class="fas fa-laugh-wink"></i>
            </div>
            <div class="sidebar-brand-text mx-3">Zgadnij hasło <sup></sup></div>
        </a>

        <!-- Divider -->
        <hr class="sidebar-divider my-0">

        <!-- Nav Item - Dashboard -->
        <li class="nav-item">
            <a class="nav-link" href="<c:url value="/"/>">
                <i class="fas fa-fw fa-tachometer-alt"></i>
                <span>Strona główna</span></a>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider">

        <li class="nav-item" style="color: white">
            <div class="nav-link">
            <svg xmlns="http://www.w3.org/2000/svg" style="margin-left: 10px; margin-right: 5px" width="16" height="16" fill="currentColor" class="bi bi-dice-4" viewBox="0 0 16 16">
                <path d="M13 1a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h10zM3 0a3 3 0 0 0-3 3v10a3 3 0 0 0 3 3h10a3 3 0 0 0 3-3V3a3 3 0 0 0-3-3H3z"/>
                <path d="M5.5 4a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm8 0a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm0 8a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm-8 0a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
            </svg>
                <span>Zarejestruj się, żeby zacząć zdobywać punkty!</span></div>
        </li>

        <li class="nav-item">
            <a class="nav-link" href="<c:url value="/ranking"/>">
                <svg xmlns="http://www.w3.org/2000/svg" style="margin-left: 10px; margin-right: 5px" width="16" height="16" fill="currentColor" class="bi bi-award" viewBox="0 0 16 16">
                    <path d="M9.669.864 8 0 6.331.864l-1.858.282-.842 1.68-1.337 1.32L2.6 6l-.306 1.854 1.337 1.32.842 1.68 1.858.282L8 12l1.669-.864 1.858-.282.842-1.68 1.337-1.32L13.4 6l.306-1.854-1.337-1.32-.842-1.68L9.669.864zm1.196 1.193.684 1.365 1.086 1.072L12.387 6l.248 1.506-1.086 1.072-.684 1.365-1.51.229L8 10.874l-1.355-.702-1.51-.229-.684-1.365-1.086-1.072L3.614 6l-.25-1.506 1.087-1.072.684-1.365 1.51-.229L8 1.126l1.356.702 1.509.229z"/>
                    <path d="M4 11.794V16l4-1 4 1v-4.206l-2.018.306L8 13.126 6.018 12.1 4 11.794z"/>
                </svg>
                <span>Sprawdź listę rankingową</span></a>

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
                            <span class="mr-2 d-none d-lg-inline text-gray-600 small">Tryb gościa</span>
                            <img class="img-profile rounded-circle"
                                 src="${pageContext.request.contextPath}/theme/img/undraw_profile.svg">
                        </a>
                        <!-- Dropdown - User Information -->
                        <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                             aria-labelledby="userDropdown">
                            <a class="dropdown-item" href="login">
                                <i class=" fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                Zaloguj się
                            </a>

                            <a class="dropdown-item" href="add">
                                <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                Zarejestruj się
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
                        <a href="<c:url value="/vgame"/>"
                           class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i>

                            <img class="sidebar-card-illustration mb-2" src="${pageContext.request.contextPath}/theme/img/undraw_rocket.svg"
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
        <%@ include file="/WEB-INF/fragments/footer.jsp" %>
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
<%@ include file="/WEB-INF/fragments/logout.jsp" %>

<!-- Bootstrap core JavaScript-->
<script src="${pageContext.request.contextPath}/theme/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/theme/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="${pageContext.request.contextPath}/theme/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="${pageContext.request.contextPath}/theme/js/sb-admin-2.min.js"></script>
<script src="${pageContext.request.contextPath}/theme/js/game.js"></script>

</body>

</html>
