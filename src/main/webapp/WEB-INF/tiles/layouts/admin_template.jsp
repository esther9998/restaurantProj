<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
    <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SB Admin - Dashboard</title>
 
  <!-- Custom fonts for this template-->
  <link href="/resources/js/adminBoard/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Page level plugin CSS-->
  <link href="/resources/js/adminBoard/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="/resources/css/adminBoard/sb-admin.css" rel="stylesheet">
  
<!-- Bootstrap core JavaScript-->

  
<!--  calendar 관련 소-->
<link href='https://use.fontawesome.com/releases/v5.0.6/css/all.css' rel='stylesheet'>
<link href='/resources/themesResources/core/main.css' rel='stylesheet' />
<link href='/resources/themesResources/bootstrap/main.css' rel='stylesheet' /> 
<link href='/resources/themesResources/timegrid/main.css' rel='stylesheet' />
<link href='/resources/themesResources/daygrid/main.css' rel='stylesheet' />
<link href='/resources/themesResources/list/main.css' rel='stylesheet' />

 <script src="/resources/js/adminBoard/vendor/jquery/jquery.min.js"></script>
<script src='/resources/themesResources/js/moment.js'></script>
<script src="/resources/js/adminBoard/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src='/resources/themesResources/core/main.js'></script>
<script src='/resources/themesResources/interaction/main.js'></script>
<script src='/resources/themesResources/bootstrap/main.js'></script>
<script src="/resources/js/bootstrap-datepicker.js"></script>
		<script src="/resources/js/jquery.timepicker.min.js"></script>
<script src='/resources/themesResources/daygrid/main.js'></script>
<script src='/resources/themesResources/timegrid/main.js'></script>
<script src='/resources/themesResources/list/main.js'></script>
<script src='/resources/themesResources/js/theme-chooser.js'></script>


</head>

<body id="page-top">
<nav class="navbar navbar-expand navbar-dark bg-dark static-top">
    <a class="navbar-brand mr-1" href="/adminBoard/main">Your Restaurant </a>

    <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="/adminBoard/main">
      <i class="fas fa-bars"></i>
    </button>

    <!-- Navbar Search -->
    <!-- <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
      <div class="input-group">
        <input type="text" class="form-control" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
        <div class="input-group-append">
          <button class="btn btn-primary" type="button">
            <i class="fas fa-search"></i>
          </button>
        </div>
      </div> 
    </form>-->

    <!-- Navbar -->
  <ul class="navbar-nav ml-auto" >
<!--   <ul class="navbar-nav ml-auto ml-md-0" >  기존 ul 스타일   -->
      <!--   <li class="nav-item dropdown no-arrow mx-1"> 이메일   
        <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-bell fa-fw"></i>
          <span class="badge badge-danger">9+</span>
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="alertsDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>-->
    <!--   <li class="nav-item dropdown no-arrow mx-1">
        <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-envelope fa-fw"></i>
          <span class="badge badge-danger">7</span>
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="messagesDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li> -->
        <li class="nav-item dropdown no-arrow">
        <a class="nav-link dropdown-toggle" href="/"  role="button" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-home"></i>
        </a>
      </li>
      <li class="nav-item dropdown no-arrow">
        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-user-circle fa-fw"></i>
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
     <!--      <a class="dropdown-item" href="#">Settings</a>
          <a class="dropdown-item" href="#">Activity Log</a> 
          <div class="dropdown-divider"></div>-->
          <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">Logout</a>
        </div>
      </li>
    </ul>

  </nav> 
  <div id="wrapper">
    <!-- Sidebar -->
    <ul class="sidebar navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="/adminBoard/main">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Monitoring</span>
        </a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="/adminBoard/scheduler">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>Calendar</span></a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-fw fa-folder"></i>
          <span>Editor </span>
        </a>
        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
          <h6 class="dropdown-header">Pages:</h6>
          <a class="dropdown-item" href="/adminBoard/promotion">Promotions</a>
          <a class="dropdown-item" href="/adminBoard/menu">Menu</a>
         <!--  <div class="dropdown-divider"></div>
          <h6 class="dropdown-header">Other Pages:</h6>
          <a class="dropdown-item" href="404.html">404 Page</a>
          <a class="dropdown-item" href="blank.html">Blank Page</a> -->
        </div>
      </li>
      
    <!--   <li class="nav-item">
        <a class="nav-link" href="charts.html">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>Charts</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="tables.html">
          <i class="fas fa-fw fa-table"></i>
          <span>Tables</span></a>
      </li> -->
    </ul>
<div id="content-wrapper">
		<tiles:insertAttribute name="content" />

      <!-- Sticky Footer -->
      <footer class="sticky-footer">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright © Your Website 2019</span>
          </div>
        </div>
      </footer>

    </div>
    <!-- /.content-wrapper -->

  </div>
  <!-- /#wrapper -->
  
   <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up" style="font-size: 40px; padding-top: 5px;"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
          <a class="btn btn-primary"  href="/adminBoard/logout">Logout</a>
        </div>
      </div>
    </div>
  </div>

<script>
//로그아웃   
function logout() {
	sessionStorage.removeItem( "admin_session" );
	location.href ="/adminBoard/main";
}
</script>
	
  <!-- Core plugin JavaScript-->
  <script src="/resources/js/adminBoard/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Page level plugin JavaScript-->
  <script src="/resources/js/adminBoard/vendor/chart.js/Chart.min.js"></script>
  <script src="/resources/js/adminBoard/vendor/datatables/jquery.dataTables.js"></script>
  <script src="/resources/js/adminBoard/vendor/datatables/dataTables.bootstrap4.js"></script>


  <!-- Custom scripts for all pages-->
  <script src="/resources/js/adminBoard/sb-admin.min.js"></script>

  <!-- Demo scripts for this page-->
  <script src="/resources/js/adminBoard/datatables-demo.js"></script>
  <script src="/resources/js/adminBoard/chart-area-demo.js"></script>

	
</body>

</html>