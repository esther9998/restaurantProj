<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<body class="bg-dark">

  <div class="container">
    <div class="card card-login mx-auto mt-5">
      <div class="card-header">Login</div>
      <div class="card-body">
        <form>
          <div class="form-group">
            <div class="form-label-group">
              <input type="text" id="inputEmail" class="form-control" placeholder="Email Address" required="required"  autofocus="autofocus">
              <label for="inputEmail">Email Address</label>
            </div>
          </div>
          <div class="form-group">
            <div class="form-label-group">
              <input type="password" id="inputPassword" class="form-control" placeholder="Password" required="required">
              <label for="inputPassword">Password</label>
            </div>
          </div>
          <div class="form-group">
            <div class="checkbox">
              <label>
                <input type="checkbox" value="remember-me" >
                Remember Password
              </label>
            </div>
          </div>
          <a class="btn btn-primary btn-block" id="login_btn">Login</a>
        </form>
        <div class="text-center">
          <a class="d-block small mt-3" href="/adminBoard/register">Register an Account</a>
          <a class="d-block small" href="/adminBoard/forgot">Forgot Password?</a>
        </div>
      </div>
    </div>
  </div>
<script>
$(document).ready(function () {
	/*  템플릿 안보이게 처리 */
	$("nav").css("display","none");
	$("footer").css("display","none");
	$(".sidebar").css("display","none");
	
	$("#login_btn").on('click', function() {
		admin_loginChk();
	});
	
    $("#inputEmail").keydown(function (key) {
        if(key.keyCode == 13) {
        	admin_loginChk();
        }
    });
    
    $("#inputPassword").keydown(function (key) {
       if(key.keyCode == 13) {
    	   admin_loginChk();
       }
    });
    
   /*  //알림 허용
    if (Notification.permission !== "granted")
        Notification.requestPermission();
    
    $('#modalLoginForm').on('shown.bs.modal', function () {
    	  $('#id').trigger('focus')
    	}) */
});
function admin_loginChk() {
	if ( $("#inputEmail").val() == "" ) {
		alert("Fill out the id box");	
		return;
	}
	if ( $("#admin_pw").val() == "") {
		alert("Fill out the password box.");
		return;
	}
	var data ={
			email:$("#inputEmail").val(),
			pw:$("#inputPassword").val()
	}
	/* if($("input[type='checkbox']:checked")){
		//쿠키에 저장 
		document.cookie = "admin = "+ data;
	} */

	$.ajax({
		/* beforeSend : function(xhr) {
			xhr.setRequestHeader("AJAX", true);
		}, */
		type:"POST",
		url:'/admin_chk',
		data:data,
		dataType:"json",
		async: false, 
		success:function(rst) {    
		//	location.href = "/adminBoard/main";
			location.reload();
		},
		error:function() {
				alert("Not validate, please check the Email and password.");
			$("#inputEmail").focus();
		}
	});
}

</script>
