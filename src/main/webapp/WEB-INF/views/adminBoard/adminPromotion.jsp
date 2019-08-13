<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

     <div class="container-fluid">

        <!-- Breadcrumbs-->
        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a href="/adminBoard/main">Dashboard</a>
          </li>
          <li class="breadcrumb-item active">Editor</li>
          <li class="breadcrumb-item active">Promotion</li>
        </ol>
        <!-- DataTables Example -->
        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
           Upload Promotion 
           	<button class="btn-primary float-right" data-toggle="modal" data-target="#addPromotion">Add New Promotion</button>
           </div>
          <div class="card-body">
    <!--  <img src="/resources/imgUpload/20190812b57e30e4d3d94e089c036118385a9c19"> -->

            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                  <tr>
                    <th>Index</th>
                    <th>Title</th>
                    <th>Image</th>
                    <th>Priority</th>
                    <th>Status</th>
                    <th>Edit</th>
                    <th>Created At</th>
                  </tr>
                </thead>
                <tfoot>
                  <tr>
                    <th>Index</th>
                    <th>Title</th>
                    <th>Image</th>
                    <th>Priority</th>
                    <th>Status</th>
                    <th>Edit</th>
                    <th>Created At</th>
                  </tr>
                </tfoot>
                <tbody>
                  <c:forEach  items="${promoList}" var = "list" varStatus="count">
                  <tr>
                    <td>	${count.count}</td>
                    <td>	${list.title}</td>
                    <td>	${list.imgNm}</td>
                    <td>	${list.priority}</td>
                    <td>	${list.status}</td>
                    <td>	<button class="btn btn-primary">Edit</button></td>
                    <td>	${list.createdAt}</td>
                  </tr>
          		</c:forEach>
                </tbody>
              </table>
            </div>
          </div>
          <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
        </div>
	</div>
      <!-- /.container-fluid -->
<jsp:include page="./adminModal/addPromotion.jsp"></jsp:include>