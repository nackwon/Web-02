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
		if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인 해주세요')");
			script.println("loacation.href='login.jsp'");
			script.println("</script>");
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
		if(!userID.equals(bbs.getUserID())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("loacation.href='bbs.jsp'");
			script.println("</script>");
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


			<ul class="nav navbar-nav navbar-right">
				<li class="bropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">MEMBER <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">LOGOUT</a></li>
						<li><a href="profile.jsp">MY PROFILE</a></li>
					</ul></li>
			</ul>

		</div>
	</nav>

	<div class="container">
		<div class="row">
			<form method="post" action="updateAction.jsp?bbsID=<%=bbsID%>">
				<table class="table table-striped table-border-style">
					<thead>
						<tr>
							<th class="table-th-style" colspan="2">BOARD</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control" placeholder="Title" maxlength="50" name="bbsTitle" value="<%=bbs.getBbsTitle()%>"></td>
						</tr> <!-- 여기에 있는 bbsTitle 과 bbsContent는 자바 빈을 사용하지 않으면 request.getParameter로 받아와서 검사한다. updateAction.jsp에서 -->
						<tr>
							<td><textarea class="form-control" placeholder="Content" maxlength="2048" name="bbsContent" style="height: 300px;"><%=bbs.getBbsContent()%></textarea></td>
						</tr>
					</tbody>
				</table>
				<input type="button" class="btn btn-primary pull-right" value="Cancel" onclick="location.href='bbs.jsp'"> 
				<input type="submit" class="btn btn-primary pull-right" value="Update" style="margin-right: 5px;">
			</form>
		</div>
	</div>
</body>
</html>