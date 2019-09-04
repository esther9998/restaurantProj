<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript" src="/resources/js/smarteditor2-2.8.2.3/js/HuskyEZCreator.js" charset="utf-8"></script>
    
 <!-- 달력 클릭 모달 : 예약 디테일, 예약 시간 변경, 상태 변경-->
<div class="modal fade bd-example-modal-lg" id="addMenu" tabindex="-1" role="dialog" aria-labelledby="updateBookingScheduleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content" style="width:1000px">
     	<div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Add New Menu</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <div class="row justify-content-center">
              <div class="col-md-10 form-wrap">
                <form id="menuAddForm" enctype="multipart/form-data">
                  <div class="row mb-4">
                    <div class=" col-md-5">
                      <label for="promo_title" class="label">Title</label>
                        <input type="text" class="form-control" id="title" name="title" placeholder="Menu title">
                    </div>
                  <div class=" col-md-2">
                      <label for="promo_category" class="label">Category</label>
                        <input type="text" class="form-control" id="category" name="category" placeholder="Number">
                    </div>
                    <div class=" col-md-2">
                    	<label for="" class="label">Priority</label>
                    	  <input type="text" class="form-control" name="priority" id="priority" placeholder="Number">
                    </div>
                    <div class=" col-md-3">
                    	<label for="" class="label" style="display: block;">Status</label>
                    	<input type="radio" name="status" value="1" style="margin: 5px;">active
                    	<input type="radio" name="status" value="0" style="margin: 5px;">inactive
                    </div>
                     </div>
               <!--  가격 -->
			<div class="row mb-4">
                    <div class="col-md-6">
                      <label for="" class="label">Price</label>
                        <input type="text" class="form-control" name="price" placeholder="Menu price">
                    </div>
                    	
               <!--  이미지 업로드 -->
					<div class="input-group col-md-6">
						<label for="" class="label">Upload Image</label>
						<div class="input-group mb-3">
						<div class="custom-file">
						    <input type="file" name="file" id="file" class="custom-file-input">
						    <label  id="filename" class="custom-file-label" for="inputGroupFile02" >Choose file</label>
						  </div>
						<!--   <div class="input-group-append">
						    <input class="input-group-text" id=""  type="submit">
						  </div> -->
						</div>
						</div>
                  </div>
                 <!--  콘텐츠 --> 
                  <div class="row mb-4">
                  <div class="col-md-12">
                      <label for="promo_title" class="label">Contents</label>
                        <textarea cols="10" rows="5" class="form-control" name="content"placeholder="" ></textarea>
                    </div>
                    </div>
                  
                </form>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button class="btn btn-primary" onclick="javascript:sendAddMenu();">Save</button>
      </div>
              </div>
            </div>
      </div>
    </div>
  </div>
</div>

<script>
function sendAddMenu() {
	
    //preventDefault 는 기본으로 정의된 이벤트를 작동하지 못하게 하는 메서드이다. submit을 막음
    // 유효성 검사  
     var re = /^[0-9]+$/;
        if(!re.test($("#priority").val())) {
               alert("Input ONLY number!!");
               $("#priority").val("");
               $("#priority").focus();
               return;
        }
        	if ($("#title").val() ==""||$("#status").val() ==""||$("#priority").val() ==""||$("#price").val() ==""||$("#contents").val() ==""||$("#file").val() =="") {
        		alert("Please fillout.");
        		return;
			} 
        	
    var form = $('#menuAddForm')[0];
    var data = new FormData(form);

   
    $.ajax({
        type: "POST",
        enctype: 'multipart/form-data',
        url: "/adminBoard/addMenuForm",
        data: data,
        processData: false,
        contentType: false,
        cache: false,
        timeout: 600000,
        success: function (data) {
        	window.location.href = '/adminBoard/menu';
           // alert("complete");
        },
        error: function (e) {
            console.log("ERROR : ", e);
            alert("다시시도 해주세요.");
        }
    });
}

/* 선택한  파일명 input에 입력  */
$( document ).ready(function() {
	  $('input[type="file"]').change(function() {
	    if ($(this).val()) {
	    	error=false;
	         var filename = $(this).val();
	     	var afterStr = filename.split( "\\" );
	         $('#filename').text(afterStr[afterStr.length-1]);
	    }
	    if (error) {
	        alert("fileupload error occured.")
	      }
	  });
	});

		
</script>