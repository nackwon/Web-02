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
				<li class="active"><a href="main.jsp">MAIN</a></li>
				<li><a href="bbs.jsp">BOARD</a></li>
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
		<div class="jumbotron">
			<div class="container">
				<h1>JIMMY's House</h1>
				<p>
					JPS 게시판 연습했습니다. <br> <br> <br> <br> <a href="#" class="btn btn-primary btn-pull" role="button">자세히</a>
				</p>
			</div>
		</div>
	</div>

	<!-- carousel (참조:https://bootsnipp.com/snippets/VP798) -->
	<div class="content-area">
		<div id="myCarousel" class="carousel slide">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner">
				<div class="item active">
					<img src="http://placekitten.com/960/600">
				</div>
				<div class="item">
					<img src="http://placebear.com/960/600">
				</div>
				<div class="item">
					<img src="http://lorempixel.com/960/600">
				</div>
			</div>
		</div>

		<!-- Controls -->
		<a class="left carousel-control" href="#myCarousel" data-slide="prev"> <span class="icon-prev"></span></a>
		<a class="right carousel-control" href="#myCarousel" data-slide="next"> <span class="icon-next"></span></a>
	</div>
</body>
</html>