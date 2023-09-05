<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<link rel="stylesheet" href="./resource/css/bootstrap.min.css"/>
<meta charset="UTF-8">
<title>로그인(login)</title>
</head>
<body>

	<jsp:include page="menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">로그인</h1>
		</div>
	</div>
	
	<div class="container" align="center">
		<div class="col-md-4 col-md-offset-4">
			<h3 class="form-signin-heading">Please sign in</h3>
			
			<%
				/* 로그인 인증실패시 작동 */
				String error = request.getParameter("error");
				if(error != null){
					out.println("<div class='alert alert-danger'>");
					out.println("아이디와 비밀번호를 확인해주세요");
					out.println("</div>");
				}
			%>
			<form class="form-signin" action="j_security_check" method="post">
				<!-- 아이디를 입력하는 부분 -->
				<div class="form-group">
					<!-- <label for="inputUserName" class="sr-only">User Name</label> -->
					<input type="text" class="form-control" placeholder="ID" name="j_username" required="required" autofocus="autofocus">
				</div>
				<!-- 비밀번호를 입력하는 부분 -->
				<div class="form-group">
					<!-- <label for="inputPassword" class="sr-only">Password</label> -->
					<input type="password" class="form-control" placeholder="Password" name="j_password" required>
				</div>
				<!-- btn-lg : 버튼 크기. btn-sucess:초록색 버튼 -->
				<button class="btn btn-lg btn-success btn-block" type="submit">로그인</button>
			</form>	
		</div>
	</div>
	
	
</body>
</html>