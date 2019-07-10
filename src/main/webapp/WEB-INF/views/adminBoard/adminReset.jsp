<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<body class="bg-dark">

  <div class="container">
    <div class="card card-login mx-auto mt-5">
      <div class="card-header">Reset Password</div>
      <div class="card-body">
        <div class="text-center mb-4">
          <h4>Reset your password</h4>
          <p>Enter your password. </p>
        </div>
        <form>
          <div class="form-group">
            <div class="form-label-group">
              <input type="text" id="password" class="form-control" placeholder="Enter password " required="required" autofocus="autofocus">
              <label for="inputEmail">New password</label>
            </div>
            <input type="text" id="repassword" class="form-control" placeholder="Confirm password" required="required" autofocus="autofocus">
              <label for="inputEmail">Confirm password</label>
            </div>
          </div>
          <a class="btn btn-primary btn-block">Reset Password</a>
        </form>
        <div class="text-center">
          <a class="d-block small mt-3" href="/adminBoard/register">Register an Account</a>
          <a class="d-block small" href="/adminBoard/login">Login Page</a>
        </div>
      </div>
    </div>
  </div>


</body>
