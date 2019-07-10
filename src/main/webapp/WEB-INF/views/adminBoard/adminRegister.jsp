<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<body class="bg-dark">

  <div class="container">
    <div class="card card-register mx-auto mt-5">
      <div class="card-header">Register an Account</div>
      <div class="card-body">
        <form>
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="firstName" class="form-control" placeholder="First name" required="required" autofocus="autofocus">
                  <label for="firstName">First name</label>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="lastName" class="form-control" placeholder="Last name" required="required">
                  <label for="lastName">Last name</label>
                </div>
              </div>
            </div>
          </div>
          <div class="form-group">
            <div class="form-label-group">
              <input type="email" id="inputEmail" class="form-control" placeholder="Email address" required="required">
              <label for="inputEmail">Email address</label>
            </div>
          </div>
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="password" id="inputPassword" class="form-control" placeholder="Password" required="required">
                  <label for="inputPassword">Password</label>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="password" id="confirmPassword" class="form-control" placeholder="Confirm password" required="required">
                  <label for="confirmPassword">Confirm password</label>
                </div>
              </div>
            </div>
          </div>
          <a class="btn btn-primary btn-block" id="registerBtn">Register</a>
        </form>
        <div class="text-center">
          <a class="d-block small mt-3" href="/adminBoard/login">Login Page</a>
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
  });
	$("#registerBtn").on('click', function() {
		admin_registerChk();
	});
	
function admin_registerChk() {
	if ( $("#firstName").val() == "" ) {
		alert("First name must be filled out");	
		return;
	}
	if ( $("#lastName").val() == "" ) {
		alert("Last name must be filled out");	
		return;
	}
	if ( $("#inputEmail").val() == "") {
		alert("Email must be fill out.");
		return;
	}
	if ( $("#inputPassword").val() == "") {
		alert("Password must be fill out.");
		return;
	}
	if ( $("#confirmPassword").val() == "") {
		alert("Confirm password must be fill out.");
		return;
	}
	if ( $("#inputPassword").val() != $("#confirmPassword").val() ) {
		alert("Password is not matching with the confirm password.");
		return;
	}
	var data ={
			name:$("#firstName").val(),
			email:$("#inputEmail").val(),
			pw:$("#inputPassword").val()
	}

	$.ajax({
		/* beforeSend : function(xhr) {
			xhr.setRequestHeader("AJAX", true);
		}, */
		type:"POST",
		url:'/register_chk',
		data:data,
		dataType:"json",
		async: false, 
		success:function(rst) {    
			if (rst == 1) {
				alert("you have successfully registered");
				 location.href = "/adminBoard/main";
			}else{
				alert("There is an  error occured. Try it agin.");
				location.href = "/adminBoard/register";
			}
		}
		
	});
}

</script>