<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<div class="modal fade bd-example-modal-lg" id="editMenu" tabindex="-1" role="dialog" aria-labelledby="updateBookingScheduleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content" style="width:1000px">
     	<div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Edit Promotion</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <div class="row justify-content-center">
              <div class="col-md-10 form-wrap">
                <form id="editMenuForm" enctype="multipart/form-data">

                <input type="text" name="editIdx" id="editIdx" style="display: none;">
                  <div class="row mb-4">
                    <div class=" col-md-5">
                      <label for="promo_title" class="label">Title</label>
                        <input type="text" class="form-control" id="editTitle" name="editTitle" >
                    </div>
                     <div class=" col-md-2">
                      <label for="promo_category" class="label">Category</label>
                        <input type="text" class="form-control" id="editCategory" name="editCategory" placeholder="Number">
                    </div>
                    <div class=" col-md-2">
                    	<label for="" class="label">Priority</label>
                    	  <input type="text" class="form-control" name="editPriority" id="editPriority" >
                    </div>
                    <div class=" col-md-3">
                    	<label for="" class="label" style="display: block;">Status</label>
                    	<input type="radio" name="editStatus" value="1" style="margin: 5px;">active
                    	<input type="radio" name="editStatus" value="0" style="margin: 5px;">inactive
                    </div>
                     </div>
               <!--  가격 -->
			<div class="row mb-4">
                    <div class="col-md-6">
                      <label for="" class="label">Price</label>
                        <input type="text" class="form-control" id="editPrice" name="editPrice" placeholder="Promotion price">
                    </div>
                    	
               <!--  이미지 업로드 -->
					<div class="input-group col-md-6">
						<label for="" class="label">Upload Image</label>
						<div class="input-group mb-3">
						<div class="custom-file">
						    <input type="file" name="editFile" id="editFile" class="custom-file-input" >
						    <label class="custom-file-label" id="editFileName" for="inputGroupFile02">Choose file</label>
						  </div>
						  <!-- Form ajax 데이터 용 -->
						  <input type="text" style="display: none;" name="editFileName02" id="editFileName02"> 
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
                        <textarea cols="10" rows="5" class="form-control" id="editContent" name="editContent"placeholder="" ></textarea>
                    </div>
                    </div>
                    <!--  기존 서버파일명 담아놓음 -->
                  <input   id="editImgNm"  name="editImgNm" style="display: none;"> 
                </form>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button class="btn btn-primary" onclick="javascript:sendEditMenu();">Save</button>
      </div>
              </div>
            </div>
      </div>
    </div>
  </div>
</div>

<script>
/* 선택한  파일명 input에 입력  */
$( document ).ready(function() {
  $('input[name="editFile"]').change(function() {
  	if ($(this).val()) {
	    		error=false;
	         var filename = $(this).val();
	     	var afterStr = filename.split( "\\" );
	         $('#editFileName').text("");
	         $('#editFileName').text(afterStr[afterStr.length-1]);
	         $('#editFileName02').val(afterStr[afterStr.length-1]);
	    }
    if (error) {
        alert("fileupload error occured.")
      }
  });
});
function sendEditMenu() {
    
    var form = $('#editMenuForm')[0];
    var data = new FormData(form);

    $.ajax({
        type: "POST",
        enctype: 'multipart/form-data',
        url: "/adminBoard/editMenuForm",
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



		
</script>