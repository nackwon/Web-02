<!-- name:JIMMY -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/layout.css">

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<title>join_form page</title>
</head>
<body>
	<!-- navbar start -->
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">JIMMY's SITE</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collpase-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">MAIN</a></li>
				<li><a href="bbs.jsp">BOARD</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="bropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">MENU <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">LOGIN</a></li>
						<li class="active"><a href="join.jsp">JOIN</a></li>
					</ul></li>
			</ul>
		</div>
	</nav>
	<!-- navbar end -->

	<!-- join_form start -->
	<div class="join-container">

		<div class="join">
			<form name="join_form" action="joinAction.jsp" method="post">
				<div class="upper">
					<!-- ID -->
					<div>
						<input type="button" name="btn" value="ID Check"> <input type="text" name="userID" autocomplete="off" placeholder="Enter your ID">
					</div>

					<!-- PASSWORD -->
					<div>
						<input type="password" name="userPW" placeholder="Enter Password">
					</div>
					<div>
						<input type="password" name="userPW2" placeholder="Check Passowrd">
					</div>
				</div>

				<!-- name/nickname -->
				<div class="middle margin-top">
					<div>
						<input type="text" name="name" placeholder="Enter UserName" autocomplete="off">
					</div>
					<div>
						<input type="text" name="nickname" placeholder="Enter UserNicname" autocomplete="off">
					</div>
				</div>

				<!-- phone number -->
				<div class="bottom phone margin-top">
					<input type="text" name="phone" placeholder="Enter Phone number" maxlength="20" autocomplete="off">
				</div>

				<!-- E-mail -->
				<div class="bottom margin-top">
					<input type="email" name="email" placeholder="Enter E-mail" maxlength="20" autocomplete="off">
				</div>

				<!-- Gender -->
				<div class="form-group">
					<div class="btn-group" data-toggle="buttons">
						<label class="btn btn-primary active"> <input type="radio" name="userGender" value="male" checked>Male
						</label> <label class="btn btn-primary"> <input type="radio" name="userGender" value="Female">Female
						</label>
					</div>
				</div>


				<!-- submit button -->
				<div class="margin-top float">
					<input type="submit" name="btn-join" value="submit"> <input type="submit" name="btn-cancel" value="cancel">
				</div>
			</form>
		</div>
	</div>
	<!-- join_form end -->
</body>
</html>
​
