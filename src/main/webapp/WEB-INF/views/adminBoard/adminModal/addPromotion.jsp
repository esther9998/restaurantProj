<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript" src="/resources/js/smarteditor2-2.8.2.3/js/HuskyEZCreator.js" charset="utf-8"></script>
    
 <!-- 달력 클릭 모달 : 예약 디테일, 예약 시간 변경, 상태 변경-->
<div class="modal fade bd-example-modal-lg" id="addPromotion" tabindex="-1" role="dialog" aria-labelledby="updateBookingScheduleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content" style="width:1000px">
     	<div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Add New Promotion</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <div class="row justify-content-center">
              <div class="col-md-10 form-wrap">
                <form  name="frm" >
                  <div class="row mb-4">
                    <div class="form-group col-md-12">
                      <label for="promo_title" class="label">Title <p style="font-size: 10px; color: grey">(Administrator will be recognized what promotion is by the title.)</p></label>
                      <div class="form-field-icon-wrap">
                        <input type="text" class="form-control" id="promo_title">
                      </div>
                    </div>
                     </div>

				<div class="row mb-4">
                    <div class="form-group col-md-6">
                      <label for="date" class="label">Start Date  <p style="font-size: 10px; color: grey">(format : MM/DD/YYYY)</p></label>
                      <div class="form-field-icon-wrap">
                        <input type="text" class="form-control" id="dateAdd">
                      </div>
                    </div>
                    
                     <div class="form-group col-md-6">
                      <label for="date" class="label">End Date  <p style="font-size: 10px; color: grey">(format : MM/DD/YYYY)</p></label>
                      <div class="form-field-icon-wrap">
                        <input type="text" class="form-control" id="dateAdd">
                      </div>
                    </div>

                  </div>
                  
                  <!-- Smart Editor -->
                  <textarea name="ir1" id="ir1" rows="10" cols="100">에디터에 기본으로 삽입할 글(수정 모드)이 없다면 이 value 값을 지정하지 않으시면 됩니다.</textarea>
                  
                  
                </form>
              </div>
            </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary"  onclick="addForm()" >Save</button>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">
var oEditors = [];
//추가 글꼴 목록
//var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];

nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "ir1",
	sSkinURI: "/resources/js/smarteditor2-2.8.2.3/SmartEditor2Skin.html",	
	htParams : {
		bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
		bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
		bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
		//bSkipXssFilter : true,		// client-side xss filter 무시 여부 (true:사용하지 않음 / 그외:사용)
		//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
		fOnBeforeUnload : function(){
			//alert("완료!");
		}
	}, //boolean
	fOnAppLoad : function(){
		//예제 코드
		//oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
	},
	fCreator: "createSEditor2"
});
</script>


<script>
			/* ********************************************************* */
			// 유효성 검사 
			/* ********************************************************* */
			function validate(){			
			    if( $("#nameAdd").val().trim()== ""){
			     alert( "Please provide your name!" );
			     return false;
			    	
			    }else if($("#phoneAdd").val().trim()== "" ){
			     alert( "Please provide your phone!" );
			     return false;
			    	
			    }else if($("#emailAdd").val().trim()== "" ){
			     alert( "Please provide your email!" );
			     return false;
			    	
			    }else if($("#personsAdd").val().trim()== "" ){
			     alert( "Please provide your persons!" );
			     return false;
			    	
			    }else if($("#timeAdd").val().trim()== "" ){
			     alert( "Please provide your time" );
			     return false;
			     
			    }else{
			    	   return true;
			    }
			    }
			    		
			
//ajax 데이터 전
function addForm() {
	//유효성 검사 
				var validateCheked = validate();
				if(validateCheked){				
				var data ={
						 name : $("#nameAdd").val(),
						 phone : $("#phoneAdd").val(),
						 email : $("#emailAdd").val(),
						 persons : $("#personsAdd").val(),
						 date : $("#dateAdd").val(),
						 time : $("#timeAdd").val()
				}
					$.ajax({
						url: '/addEvent',
						type: "POST",
						contentType: 'application/json;charset=UTF-8',
						dataType: 'json',
						data:  JSON.stringify(data),
						success :function(data){
							if(data == 1){
							alert( "Successfully booked");
							location.reload();
							}else if(data == 0){
							alert("Email address is not validate. ");
							location.reload();
							}else{
							alert(data+"There is error occured. Please try again. ");
							location.reload();
							}
							},
						error:function(xhr, status,error){
							alert("There is an error occured. Please fill the form again. ");
						alert(xhr+"+++++++++" +status+"////////////"+error);
							location.reload();
						}
					
					});
					}else{
						console.log("form is not complated");
					};
				};
					
			</script>