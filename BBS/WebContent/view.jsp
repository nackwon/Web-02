<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="EUC-KR"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="bbs.BbsDAO"%>


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
		int bbsID = 0;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		if (request.getParameter("bbsID") != null) {
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if (bbsID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않는 글입니다.')");
			script.println("loacation.href='bbs.jsp'");
			script.println("</script>");
		}
		Bbs bbs = new BbsDAO().getBbs(bbsID);
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
			<table class="table table-striped table-border-style">
				<thead>
					<tr>
						<th class="table-th-style" colspan="6">BOARD</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 20%"><b>Name</b></td>
						<td colspan="2"><%=bbs.getUserID()%></td>
						<td style="width: 20%"><b>Date</b></td>
						<td colspan="2"><%=bbs.getDatetime().substring(0, 11)%></td>
					</tr>
					<tr>
						<td style="width: 20%"><b>Title</b></td>
						<td colspan="6"><%=bbs.getBbsTitle()%></td>
					</tr>
					<tr>
						<td style="width: 20%"><b>Content</b></td>
						<td colspan="6" style="min-height: 200px; text-align: left;"><%=bbs.getBbsContent().replace("\n", "<br>;").replace(">", "&gt;").replace("<", "&lt;").replace(" ",
					"&nbsp;")%></td>
					</tr>
				</tbody>
			</table>
			<a href="bbs.jsp" class="btn btn-primary pull-left" style="margin-right: 5px;">List</a>

			<%
				if (userID != null && userID.equals(bbs.getUserID())) {
			%>
			<a href="update.jsp?bbsID=<%=bbsID%>" class="btn btn-primary pull-left" style="margin-right: 5px;">Update</a> 
			<a href="deleteAction.jsp?bbsID=<%=bbsID%>" onclick="return confirm('정말로 삭제하시겠습니까?')" class="btn btn-primary pull-left">Delete</a>
			<%
				}
			%>
		</div>
	</div>
</body>
</html>