<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
 <div class="container-fluid">

        <!-- Breadcrumbs-->
        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a href="/adminBoard/main">Dashboard</a>
          </li>
          <li class="breadcrumb-item active">Editor</li>
          <li class="breadcrumb-item active">Menu</li>
        </ol>
        <!-- DataTables Example -->
        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i> Upload Menu
           	<button class="btn-primary float-right" data-toggle="modal" data-target="#addMenu">Add New Menu</button>
           </div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                  <tr>
                    <th>Index</th>
                    <th>Category</th>
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
                    <th>Category</th>
                    <th>Title</th>
                    <th>Image</th>
                    <th>Priority</th>
                    <th>Status</th>
                    <th>Edit</th>
                    <th>Created At</th>
                    <th>Delete</th>
                  </tr>
                </tfoot>
                <tbody id="promoData">
                	<c:forEach items="${menuList}" var="list" varStatus="count" >
                  <tr>
                  <td>	${count.count}</td>
                  <td>
                  	<select name="boardCategory" id="boardCategory"  data-idx="${list.menuIdx}">
						  <option value="0" <c:if test="${list.menuCategory eq 0}">selected</c:if>>none 00</option>
						  <option value="1" <c:if test="${list.menuCategory eq 1}">selected</c:if>>Appetizer 01</option>
						  <option value="2" <c:if test="${list.menuCategory eq 2}">selected</c:if>>MainDish 02</option>
						  <option value="3" <c:if test="${list.menuCategory eq 3}">selected</c:if>>Dessert 03</option>
						  <option value="3" <c:if test="${list.menuCategory eq 3}">selected</c:if>>Drinking 03</option>
                  </select>
                  </td>
                    <td>	${list.menuTitle}</td>
                    <td>	${list.menuUserImgNm}<br>
                    	<img alt="" src="/resources/imgUpload/${list.menuServerImgFile}" style="width: 100px;">
                    </td>
                 <td>
                    	<select name="boardPriority" id="boardPriority"  data-idx="${list.menuIdx}">
						  <option value="0" <c:if test="${list.menuPriority eq 0}">selected</c:if>>0</option>
						  <option value="1" <c:if test="${list.menuPriority eq 1}">selected</c:if>>1</option>
						  <option value="2" <c:if test="${list.menuPriority eq 2}">selected</c:if>>2</option>
						  <option value="3" <c:if test="${list.menuPriority eq 3}">selected</c:if>>3</option>
						  <option value="4" <c:if test="${list.menuPriority eq 4}">selected</c:if>>4</option>
						  <option value="5" <c:if test="${list.menuPriority eq 5}">selected</c:if>>5</option>
						  <option value="6" <c:if test="${list.menuPriority eq 6}">selected</c:if>>6</option>
						  <option value="7" <c:if test="${list.menuPriority eq 7}">selected</c:if>>7</option>
						  <option value="8" <c:if test="${list.menuPriority eq 8}">selected</c:if>>8</option>
						</select>
                    	</td>
                    <td>
	                    	<input type="radio" data-idx="${list.menuIdx}" name="${list.menuIdx }" id="status"  value="1" style="margin: 5px;" <c:if  test="${list.menuStatus eq 1}"> checked="checked"</c:if>/>active <br>
	                    <input type="radio" data-idx="${list.menuIdx}" name="${list.menuIdx }"  id="status"   value="0" style="margin: 5px;" <c:if  test="${list.menuStatus eq 0}">checked="checked"</c:if>/>Inactive 
	                </td>
                    <td>	<button class="btn btn-primary" data-toggle="modal" data-target="#editMenu"   data-edit="${list.menuIdx}" >Edit</button></td>
                    <td>	${list.menuCreatedAt}</td>
                    <td>	<i class="fa fa-trash" aria-hidden="true" style="color: red; " data-delete="${list.menuTitle}"  onclick="deleteMenu(${list.menuIdx})" ></i></td> 
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
<jsp:include page="./adminModal/addMenu.jsp"></jsp:include>
<jsp:include page="./adminModal/editMenu.jsp"></jsp:include> 
      
<script>
$(document).ready(function(){
	// 프로모션 수정 모달에 값 전달 (editPromotion.jsp)
	$('#editMenu').on('show.bs.modal', function (event) {
		  var button = $(event.relatedTarget) 	// Button that triggered the modal
		  var index = button.data('edit');

		  //jstl에서 받은 idx로 js로받은 데이터와 비교하여 같으면,수정 모달창에 입력한다. 
		var data = ${jsonMenu};
		for (var key in data) {
		     if (data.hasOwnProperty(key)) {
		    //	 alert(	data[key].promo_userFile);
		    	 	if(data[key].idx == index){
		    	 		$("#editIdx").val(data[key].idx);
		    	 		$("#editPriority").val(data[key].priority);
		    	 		$("#editCategory").val(data[key].category);
		    	 		$('input:radio[name="editStatus"]:input[value='+data[key].status+']').attr("checked", true);
		    	 		$("#editTitle").val(data[key].menu_title);
		    	 		$("#editPrice").val(data[key].menu_price);
		    	 		$("#editContent").val(data[key].menu_content);
		    	 		$("#editFileName").text(data[key].menu_userImgNm);
		    	 		$("#editFileName02").val(data[key].menu_userImgNm);
		    	 		//status
		    	 		$("#editImgNm").val(data[key].menu_serverImgFile);
		    	 		
		    	 		
			    	 	}
			     }
			}
		
			  
		});
	});
	
//카테고리 변경시
$("[id^='boardCategory']").change(function () {
	  if (confirm('Do you want to change the category ?' + 'value :'+ $(this).val())) {
		    var data= {}
		    data['boardCategory']= $(this).val();
		    data['boardIdx']= $(this).data("idx");
		    $.ajax({
			       type: "POST",
			       url: "/adminBoard/menuCategory ",
			       async      : false,
			       data: JSON.stringify(data),
			       dataType : 'json',
			       contentType: 'application/json',
			       success: function (rst) {
			           alert("complete");
			       }
			       
			   });
   
	  } else {
		    console.log('canceled.');
		   window.location.href = '/adminBoard/menu';
		    //$.data(this, 'current', $(this).val());
		}
   
}); 
//순서 변경시
$("[id^='boardPriority']").change(function () {
	  if (confirm('Do you want to change the priority to ?' + 'value :'+ $(this).val())) {
		    console.log('yes');
		
		    
		    var data= {}
		    data['boardPriority']= $(this).val();
		    data['boardIdx']= $(this).data("idx");
		    alert(   data['boardIdx']);
		    $.ajax({
			       type: "POST",
			       url: "/adminBoard/menuPriority ",
			       async      : false,
			       data: JSON.stringify(data),
			       dataType : 'json',
			       contentType: 'application/json',
			       success: function (rst) {
			           alert("complete");
			       }
			       
			   });
   
	  } else {
		    console.log('canceled.');
		   window.location.href = '/adminBoard/menu';
		    //$.data(this, 'current', $(this).val());
		}
   
}); 

$("[id^='status']").change(function () {
	var status ;
	if($(this).val() == 1){
		status = ' Active';
	}else{
		status = ' Inactive';
	}
	 if (confirm('Do you want to change the status to ' + status +"?")) {
		    var data= {}
		    data['boardStatus']= $(this).val();
		    data['boardIdx']= $(this).data("idx");
		    console.log( data['boardIdx']);
		    $.ajax({
			       type: "POST",
			       url: "/adminBoard/menuStatus",
			   //    data: 'priority='+$(this).val(),
			       data: JSON.stringify(data),
			       dataType : 'json',
			       contentType: 'application/json',
			       success: function (rst) {
			           alert("complete");
			       }
			       
			   });

	  } else {
		    console.log('no');
		   window.location.href = '/adminBoard/promotion';
		    //$.data(this, 'current', $(this).val());
		}
	
});

//프로모션 삭제
function deleteMenu(idx) {
	var title = $(this).data('delete');
	 if (confirm('Do you want to delete? ')) {
		 $.ajax({
		        type: "POST",
		        url: "/adminBoard/menuDelete",
		        data: idx,
		        processData: false,
		        contentType: false,
		        cache: false,
		        timeout: 600000,
		        success: function (data) {
		        	window.location.href = '/adminBoard/menu';
		        },
		        error: function (e) {
		            console.log("ERROR : ", e);
		            alert("다시시도 해주세요.");
		        }
		    });
	 } else {
			   window.location.href = '/adminBoard/menu';
	}
}
  

</script>
      