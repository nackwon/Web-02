<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="EUC-KR"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/layout.css">

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<title>login page</title>
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
	%>
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
				<li class="active"><a href="bbs.jsp">BOARD</a></li>
			</ul>

			<%
				//로그인 안되어있을 때
				if (userID == null) {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="bropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">MENU <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">LOGIN</a></li>
						<li><a href="join.jsp">JOIN</a></li>
					</ul></li>
			</ul>
			<%
				//로그인 되어 있을 때
				} else {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="bropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">MEMBER <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">LOGOUT</a></li>
						<li><a href="profile.jsp">MY PROFILE</a></li>
					</ul></li>
			</ul>
			<%
				}
			%>
		</div>
	</nav>

	<div class="container">
		<div class="row">
			<form method="post" action="writeAction.jsp">
				<table class="table table-striped table-border-style">
					<thead>
						<tr>
							<th class="table-th-style" colspan="2">BOARD</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control" placeholder="Title" maxlength="50" name="bbsTitle"></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="Content" maxlength="2048" name="bbsContent" style="height: 300px;"></textarea></td>
						</tr>
					</tbody>
				</table>
				<input type="button" class="btn btn-primary pull-right" value="Cancel" onclick="location.href='bbs.jsp'"> <input type="submit" class="btn btn-primary pull-right" value="Write" style="margin-right: 5px;">
			</form>
		</div>
	</div>
</body>
</html>