<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet"href="/resources/fonts/ionicons/css/ionicons.min.css">
 <!-- 달력 클릭 모달 : 예약 디테일, 예약 시간 변경, 상태 변경-->
<div class="modal fade bd-example-modal-lg" id="addEvent" tabindex="-1" role="dialog" aria-labelledby="updateBookingScheduleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
     	<div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Add Event</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <div class="row justify-content-center">
              <div class="col-md-10 form-wrap">
                <form  name="frm" >
                  <div class="row mb-4">
                    <div class="form-group col-md-4">
                      <label for="name" class="label">Name</label>
                      <div class="form-field-icon-wrap">
                        <span class="icon ion-android-person"></span>
                        <input type="text" class="form-control" id="nameAdd">
                      </div>
                    </div>
                    <div class="form-group col-md-4">
                      <label for="email" class="label">Email</label>
                      <div class="form-field-icon-wrap">
                        <span class="icon ion-email"></span>
                        <input type="email" class="form-control" id="emailAdd">
                      </div>
                    </div>
                    <div class="form-group col-md-4">
                      <label for="phone" class="label">Phone</label>
                      <div class="form-field-icon-wrap">
                        <span class="icon ion-android-call"></span>
                        <input type="text" class="form-control" id="phoneAdd">
                      </div>
                    </div>

                    <div class="form-group col-md-4">
                      <label for="persons" class="label">Number of Persons</label>
                      <div class="form-field-icon-wrap">
                        <span class="icon ion-android-arrow-dropdown"></span>
                        <select name="persons" id="personsAdd" class="form-control">
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
                        <input type="text" class="form-control" id="dateAdd">
                      </div>
                    </div>
                    <div class="form-group col-md-4">
                      <label for="time" class="label">Time (format: HH:MM:SS)</label>
                      <div class="form-field-icon-wrap">
                        <span class="icon ion-android-time"></span>
                        <input type="text" class="form-control" id="timeAdd">
                      </div>
                    </div>
                  </div>
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