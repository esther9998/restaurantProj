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
                    <th>Delete</th>
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
                    <th>Delete</th>
                  </tr>
                </tfoot>
                <tbody>
                  <c:forEach  items="${promoList}" var = "list" varStatus="count">
                  <tr>
                    <td>	${count.count}</td>
                    <td>	${list.title}</td>
                    <td>	${list.file}<br>
                    	<img alt="" src="/resources/imgUpload/${list.imgNm}" style="width: 100px;">
                    </td>
                    <td>
                    	<select name="priority" id="priority" value="${list.priority}" >
						  <option value="1" <c:if test="${list.priority eq 1}">selected</c:if>>1</option>
						  <option value="2" <c:if test="${list.priority eq 2}">selected</c:if>>2</option>
						  <option value="3" <c:if test="${list.priority eq 3}">selected</c:if>>3</option>
						  <option value="4" <c:if test="${list.priority eq 4}">selected</c:if>>4</option>
						  <option value="5" <c:if test="${list.priority eq 5}">selected</c:if>>5</option>
						  <option value="6" <c:if test="${list.priority eq 6}">selected</c:if>>6</option>
						  <option value="7" <c:if test="${list.priority eq 7}">selected</c:if>>7</option>
						  <option value="8" <c:if test="${list.priority eq 8}">selected</c:if>>8</option>
						</select>
                    	</td>
                    <td>
	                    	<input type="radio" name="${list.idx}" value="active" style="margin: 5px;" <c:if  test="${list.status eq 1}"> checked="checked"</c:if>/>ative <br>
	                    <input type="radio" name="${list.idx}"  value="inactive" style="margin: 5px;" <c:if  test="${list.status eq 0}">checked="checked"</c:if>/>Inactive 
	                </td>
                    <td>	<button class="btn btn-primary" data-toggle="modal" data-target="#editPromotion"  
                    data-edit="${list.idx},${list.title},${list.priority},${list.status},${list.price}, ${list.content},${list.file},${list.imgNm}, ${list.uuid},${list.start},${list.end}" >Edit</button></td>
                    <td>	${list.createdAt}</td>
                    <td>	<i class="fa fa-trash" aria-hidden="true" style="color: red; "></i></td>
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
<jsp:include page="./adminModal/editPromotion.jsp"></jsp:include>
<script>
$('#editPromotion').on('show.bs.modal', function (event) {
	  var button = $(event.relatedTarget) // Button that triggered the modal
	  var recipient = button.data('edit') 
	  
	 console.log(recipient);
});

</script>
