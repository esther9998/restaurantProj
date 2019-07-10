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
  <script src="/resources/js/adminBoard/vendor/jquery/jquery.min.js"></script>
  <script src="/resources/js/adminBoard/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!--  calendar 관련 소-->
<link href='https://use.fontawesome.com/releases/v5.0.6/css/all.css' rel='stylesheet'>
<link href='/resources/themesResources/core/main.css' rel='stylesheet' />
<!-- <link href='/resources/themesResources/bootstrap/main.css' rel='stylesheet' /> -->
<link href='/resources/themesResources/timegrid/main.css' rel='stylesheet' />
<link href='/resources/themesResources/daygrid/main.css' rel='stylesheet' />
<link href='/resources/themesResources/list/main.css' rel='stylesheet' />
<script src='/resources/themesResources/core/main.js'></script>
<script src='/resources/themesResources/interaction/main.js'></script>
<script src='/resources/themesResources/bootstrap/main.js'></script>
<script src='/resources/themesResources/daygrid/main.js'></script>
<script src='/resources/themesResources/timegrid/main.js'></script>
<script src='/resources/themesResources/list/main.js'></script>
<script src='/resources/themesResources/js/theme-chooser.js'></script>
</head>

<body id="page-top">

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
    <i class="fas fa-angle-up"></i>
  </a>

  


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