<!-- name:JIMMY -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="User.MemberDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="user" class="User.Member" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPW" />
<jsp:setProperty name="user" property="name" />
<jsp:setProperty name="user" property="nickname" />
<jsp:setProperty name="user" property="phone" />
<jsp:setProperty name="user" property="email" />
<jsp:setProperty name="user" property="gender" />
<!-- 입력한 값을 넘겨 받을 때 사용한다. -->

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}

		if (userID != null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인이 되어있습니다.')");
			script.println("location.href='main.jsp'");
			script.println("</script>");
		}

		if (user.getUserID() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('아이디를 입력하세요')");
			script.println("history.back()");
			script.println("</script>");
		} else if (user.getUserPW() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호를 입력하세요')");
			script.println("history.back()");
			script.println("</script>");
		} else if (user.getName() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이름을 입력하세요')");
			script.println("history.back()");
			script.println("</script>");
		} else if (user.getNickname() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('닉네임을 입력하세요')");
			script.println("history.back()");
			script.println("</script>");
		} else if (user.getPhone() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('휴대전화 번호를 입력하세요')");
			script.println("history.back()");
			script.println("</script>");
		} else if (user.getEmail() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이메일을 입력하세요')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			MemberDAO memberDAO = new MemberDAO();
			int result = memberDAO.join(user);

			if (result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 존재하는 아이디 입니다.')");
				script.println("</script>");
			} else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('회원가입을 축하합니다.')");
				script.println("location.href='login.jsp'");
				script.println("</script>");
			}
		}
	%>
</body>
</html>
​
