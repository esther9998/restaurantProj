<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<body class="bg-dark">

  <div class="container">
    <div class="card card-login mx-auto mt-5">
      <div class="card-header">Reset Password</div>
      <div class="card-body">
        <div class="text-center mb-4">
          <h4>Forgot your password?</h4>
          <p>Enter your email address and we will send you instructions on how to reset your password.</p>
        </div>
        <form>
          <div class="form-group">
            <div class="form-label-group">
              <input type="email" id="inputEmail" class="form-control" placeholder="Enter email address" required="required" autofocus="autofocus">
              <label for="inputEmail">Enter email address</label>
            </div>
          </div>
          <a class="btn btn-primary btn-block"  onclick="sendEmail();" onkeydown="javascript: if (event.keyCode == 13) {sendEmail(); }">Reset Password</a>
        </form>
        <div class="text-center">
          <a class="d-block small mt-3" href="/adminBoard/register">Register an Account</a>
          <a class="d-block small" href="/adminBoard/login">Login Page</a>
        </div>
      </div>
    </div>
  </div>
</body>
<script>
$(document).ready(function () {
	/*  템플릿 안보이게 처리 */
	$("nav").css("display","none");
	$("footer").css("display","none");
	$(".sidebar").css("display","none");
});
function sendEmail() {
	var data = {
			email : $("#inputEmail").val()
	}
$.ajax({
	/* beforeSend : function(xhr) {
		xhr.setRequestHeader("AJAX", true);
	}, */
	url:'/adminBoard/reset',
	type:"POST",
	data: JSON.stringify(data),
	contentType: 'application/json;charset=UTF-8',
	dataType:"json",
	async: false, 
	success:function(rst) {    
		alert("We send a link to email to  reset your password.");
		 location.href = "/adminBoard/main";
	},
	error:function() {
			alert("Error occurred. Try again.");
		$("#inputEmail").focus();
	}
});

}
</script>