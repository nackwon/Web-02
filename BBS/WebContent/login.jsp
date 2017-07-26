<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">	
	<link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/layout.css">
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
<title>login page</title>
</head>
<body>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
			aria-expanded="false">
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span> 
			</button>
			<a class="navbar-brand" href="main.jsp">JIMMY's SITE</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collpase-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">MAIN</a></li>
				<li><a href="bbs.jsp">BOARD</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="bropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">MENU
					<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li class="active"><a href="login.jsp">LOGIN</a></li>
						<li><a href="join.jsp">JOIN</a></li>
					</ul>	
				</li>
			</ul>
		</div>
	</nav>
	  <div class="login-container">
	  	<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbtron" style="padding-top: 20px">
			<img src="./img/login.png" alt="login img">
	          <form name=login_form action="loginAction.jsp" method="post">
	            <div class="form-input">
	              <input type="text" maxlength="20" name="userID" autocomplete="off" placeholder="Enter Username">
	            </div>
	            <div class="form-input">
	              <input type="password" name="userPW" placeholder="Enter Password" maxlength="20">
	            </div>
	            <input type="submit" name="submit" value="LOGIN" class="btn-login"><br>
	            <a href="#">Forget password?</a>
	          </form>
			</div>
		  </div>
		  <div class="col-lg-4"></div>
        </div>
</body>	
</html>