<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript" src="/resources/js/smarteditor2-2.8.2.3/js/HuskyEZCreator.js" charset="utf-8"></script>
    
 <!-- 달력 클릭 모달 : 예약 디테일, 예약 시간 변경, 상태 변경-->
<div class="modal fade bd-example-modal-lg" id="editPromotion" tabindex="-1" role="dialog" aria-labelledby="updateBookingScheduleModalLabel" aria-hidden="true">
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
                <form id="promotionForm" enctype="multipart/form-data">
                  <div class="row mb-4">
                    <div class=" col-md-6">
                      <label for="promo_title" class="label">Title</label>
                        <input type="text" class="form-control" id="editTitle" name="editTitle" >
                    </div>
                    <div class=" col-md-3">
                    	<label for="" class="label">Priority</label>
                    	  <input type="text" class="form-control" name="editPriority" id="editPriority" placeholder="Number">
                    </div>
                    <div class=" col-md-3">
                    	<label for="" class="label" style="display: block;">Status</label>
                    	<input type="radio" name="editStatus" value="active" style="margin: 5px;">active
                    	<input type="radio" name="editStatus" value="inactive" style="margin: 5px;">inactive
                    </div>
                     </div>
               <!--  가격 -->
			<div class="row mb-4">
                    <div class="col-md-6">
                      <label for="" class="label">Price</label>
                        <input type="text" class="form-control" name="eidtPrice" placeholder="Promotion price">
                    </div>
                    	
               <!--  이미지 업로드 -->
					<div class="input-group col-md-6">
						<label for="" class="label">Upload Image</label>
						<div class="input-group mb-3">
						<div class="custom-file">
						    <input type="file" name="editFile" id="file" class="custom-file-input">
						    <label  id="editFilename" class="custom-file-label" for="inputGroupFile02">Choose file</label>
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
                        <textarea cols="10" rows="5" class="form-control" name="editContent"placeholder="" ></textarea>
                    </div>
                    </div>
                  
				<!--  날짜 -->
				<div class="row mb-4">
                    <div class="col-md-6">
                      <label for="date" class="label">Start Date</label>
                        <input type="text" class="form-control" name="editStartDate" id="startDate" placeholder="format : YYYY-MM-DD">
                    </div>
                     <div class="col-md-6">
                      <label for="date" class="label">End Date </label>
                        <input type="text" class="form-control" name="editEndDate" id="endDate" placeholder="format : YYYY-MM-DD">
                    </div>
                  </div>
                  
                  <!-- Smart Editor -->
              <!--     <textarea name="ir1" id="ir1" rows="10" cols="100">에디터에 기본으로 삽입할 글(수정 모드)이 없다면 이 value 값을 지정하지 않으시면 됩니다.</textarea>
                   -->
               <!--      <input  type="submit" style="display: hidden;" onclick="submitForm()" > -->
                </form>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button class="btn btn-primary" onclick="javascript:sendPromotion();">Save</button>
      </div>
              </div>
            </div>
      </div>
    </div>
  </div>
</div>

<script>
function editData(idx, title, priority, status, price, content, file, imgNm, uuid, start, end) {
	//${list.idx},${list.title},${list.priority},${list.status},${list.price}, ${list.content},${list.file},${list.imgNm}, ${list.uuid}
	console.log("idx: "+idx,+"title: "+ title, +"priority: "+priority, +"status: "+status, +"price: "+price,+"content: "+ content,+"file: "+ file,+"imgNm: "+ imgNm, +"uuid: "+uuid, +"start: "+start, +"end: "+end);
	

	$("#editTitle").val(title);
}

function sendPromotion() {
	
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
        	
        	//날짜 유효성 검사 
        	try{
        		var pattern = /[0-9]{4}-[0-9]{2}-[0-9]{2}/;
        		 var startDate = pattern.test($("#startDate").val());
        		 var endDate = pattern.test($("#endDate").val());
	        		if(!startDate) {
	            		alert("The startDate form is not correct.")
					return;
	        		} else if(!endDate){
	        			alert("The endDate form is not correct. end")
						return;
	        		}
              }catch (e){
                return  false;
              }
    
    var form = $('#promotionForm')[0];
    var data = new FormData(form);

   // disabled the submit button
    $("#promotionFormSubmit").prop("disabled", true);
   
    $.ajax({
        type: "POST",
        enctype: 'multipart/form-data',
        url: "/adminBoard/promotionForm",
        data: data,
        processData: false,
        contentType: false,
        cache: false,
        timeout: 600000,
        success: function (data) {
        	window.location.href = '/adminBoard/promotion';
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
	         $('#editFilename').text(afterStr[afterStr.length-1]);
	    }
	    if (error) {
	        alert("fileupload error occured.")
	      }
	  });
	});

		
</script>