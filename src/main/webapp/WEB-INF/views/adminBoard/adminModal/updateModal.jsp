<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%--  <jsp:include page="../../../tiles/components/head.jsp"></jsp:include> --%>
  <style>
  .form-field-icon-wrap .icon {
  top: 70%;
  }
  </style> 
   
 <!-- 달력 클릭 모달 : 예약 디테일, 예약 시간 변경, 상태 변경-->
<div class="modal fade bd-example-modal-lg" id="eventDetails" tabindex="-1" role="dialog" aria-labelledby="updateBookingScheduleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
     	<div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Details & Update</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <div class="row justify-content-center">
              <div class="col-md-10 form-wrap">
            <p> The customer booked at  <a id="register"> </a></p>
        <!--     <p id="indexEdit" style="display: none;"></p> -->
            <p id="indexEdit"></p>
                <form  name="frm" >
                  <div class="row mb-4">
                    <div class="form-group col-md-4">
                      <label for="name" class="label">Name</label>
                      <div class="form-field-icon-wrap">
                        <span class="icon ion-android-person"></span>
                        <input type="text" class="form-control" id="nameEdit" >
                      </div>
                    </div>
                    <div class="form-group col-md-4">
                      <label for="email" class="label">Email</label>
                      <div class="form-field-icon-wrap">
                        <span class="icon ion-email"></span>
                        <input type="email" class="form-control" id="emailEdit">
                      </div>
                    </div>
                    <div class="form-group col-md-4">
                      <label for="phone" class="label">Phone</label>
                      <div class="form-field-icon-wrap">
                        <span class="icon ion-android-call"></span>
                        <input type="text" class="form-control" id="phoneEdit">
                      </div>
                    </div>

                    <div class="form-group col-md-4">
                      <label for="persons" class="label">Number of Persons</label>
                      <div class="form-field-icon-wrap">
                        <span class="icon ion-android-arrow-dropdown"></span>
                        <select name="persons" id="personsEdit" class="form-control">
                          <option value="1">1 person</option>
                          <option value="2">2 persons</option>
                          <option value="3">3 persons</option>
                          <option value="4">4 persons</option>
                          <option value="5">5 persons</option>
                          <option value="6">6 persons</option>
                          <option value="10">10+ persons</option>
                        </select>
                      </div>
                    </div>
                    <div class="form-group col-md-4">
                      <label for="date" class="label">Date (format : MM/DD/YYYY)</label>
                      <div class="form-field-icon-wrap">
                        <span class="icon ion-calendar"></span>
                        <input type="text" class="form-control" id="dateEdit">
                      </div>
                    </div>
                    <div class="form-group col-md-4">
                      <label for="time" class="label">Time (format: HH:MM:SS)</label>
                      <div class="form-field-icon-wrap" id="datetimepickerEdit">
                        <span class="icon ion-android-time"></span>
                        <input type="text" class="form-control" id="timeEdit">
                      </div>
                    </div>
                    <div class="col-md-10 form-wrap" style="margin-top: 50px;">
	                    <p>Please select reservation status:</p>
						  <input type="radio" name="statusEdit" value="0"> Booking
						  <input type="radio" name="statusEdit" value="1"> Attend
						  <input type="radio" name="statusEdit" value="2"> Cancel
						  <input type="radio" name="statusEdit" value="3"> Miss
					  </div>
                  </div>
                </form>
              </div>
            </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary"  onclick="editForm()">Save changes</button>
      </div>
    </div>
  </div>
</div>
		<script>
			/* ********************************************************* */
			// status 체크값세팅   
			/* ********************************************************* */
			var statusEdit ="";
			function checkStatus(statusNum) {
	//			var status = $("#statusEdit").text();
				console.log(statusNum);
				  
				  $('input[name="statusEdit"]').removeAttr('checked');
				   $('input[name="statusEdit"]:radio[value='+statusNum+']').prop('checked',true);
	    	console.log("test = "+statusEdit);
			}
			
			
			/* ********************************************************* */
			// 페이지 초기 세팅   
			/* ********************************************************* */
			 $(document).ready( function() {
					
			});
			
			/* ********************************************************* */
			// 유효성 검사 
			/* ********************************************************* */
			//이름  
			function validateEdit(){			
			    if( $("#nameEdit").val().trim()== "" ){
			     alert( "Please provide your name!" );
			     $("#nameEdit").focus() ;
			     return false;
			   }
			    //이메일  
			    if( $("#emailEdit").val().trim()== "" ){ 
				     alert( "Please provide your email!" );
				     $("#emailEdit").focus() ;
				     return false;
				   }
				//전화번호  
			    if( $("#phoneEdit").val().trim()== "" || $("#phoneEdit").val().trim().length != 11 ){
				     alert( "Please provide your contact numbers!" );
				     $("#phoneEdit").focus() ;
				     return false;
				   }else if(isNaN($("#phoneEdit").val())){
				     alert( "Please provide only numbers" );
				     $("#phoneEdit").focus() ;
				   }
			/* ********************************************************* */
			  //오늘날짜 가져오기 
			/* ********************************************************* */
			    /* 	var today = new Date();
			    	var year = today.getFullYear();
			    	var month = today.getMonth()+1;
			    	var day = today.getDate();
			    	var hour = today.getHours();
			    	var dateNow = month+"/"+day+"/"+year;
			    	var hourNow = today.getHours();
			    	console.log(dateNow);
			    	console.log(hourNow); */
			/* ********************************************************* */
			   //날짜 유효성 검사 
			/* ********************************************************* */
			  /* if( $("#date").val().trim()== ""||$("#date").val().length < 8 || $("#date").val().length > 9){
			    	
				  alert( "Please choose a day for reservation") ;
			  		$("#date").datepicker("setDate", new Date);
			    	$("#date").focus();
				     return false; 
				   }  */
			    	
			    if( $("#dateEdit").val().trim()== ""){
			    	alert( "Please fill out the date.") ;
			    	return false;
			    }
			    /* else if(moment($("#dateEdit").val()).isAfter()==false){
			    	alert("You cant make a event before today.");
			    	return false;
			    } */
			    
			/* ********************************************************* */
				// 시간 유효성
			/* ********************************************************* */
			    if( $("#timeEdit").val().trim()== "" ){
			    	alert( "Please choose a time for reservation" );
				     $("#timeEdit").focus() ;
				     return false;
				   }
			
			   return true ;
			}
//ajax 데이터 전
function editForm() {
	//유효성 검사 
				var validateCheked = validateEdit();
				if(validateCheked){				
				var data ={
						 index : $("#indexEdit").val(),
						 name : $("#nameEdit").val(),
						 phone : $("#phoneEdit").val(),
						 email : $("#emailEdit").val(),
						 persons : $("#personsEdit").val(),
						 date : $("#dateEdit").val(),
						 time : $("#timeEdit").val(),
						 status :  $('input[name="statusEdit"]:checked').val()
				}
					$.ajax({
						url: '/updateEvent',
						type: "POST",
						contentType: 'application/json;charset=UTF-8',
						dataType: 'json',
						data:  JSON.stringify(data),
						success :function(data){
							if(data == 1){
							alert( "The booking is successfully updated.");
							location.reload();
							}else{
							alert(data+"There is error occured. Please try again. ");
							location.reload();
							}
							},
						error:function(xhr, status,error){
							alert("There is an error occured. Please fill the form again. ");
				//		alert(xhr+"+++++++++" +status+"////////////"+error);
							location.reload();
						}
					
					});
					}else{
						console.log("Please fill out the form.");
					};
				};
					
			</script>
