<%@page import="dao.ProductRepository"%>
<%@page import="dto.Product"%>
<%@page import="java.util.ArrayList"%>
<!-- 아이디값이 유효하지 않으면 err페이지로 이동시킨다. -->
<%@page errorPage="exceptionNoProductId.jsp"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session"></jsp:useBean> --%>
<!DOCTYPE html>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"> -->
<link rel="stylesheet" href="./resource/css/bootstrap.min.css"/>
<meta charset="UTF-8">
<title>상품 상세 정보</title>
</head>
<body>
	<jsp:include page="menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 정보</h1>
		</div>
	</div>
	<%
		//넘어온 상품 아이디값을 얻어낸다.
		String id = request.getParameter("id");
		ProductRepository dao = ProductRepository.getInstance();
		//넘어온 상품아이디값을 이용해서 실제 해당하는 Product객체를 얻고있다.
		Product product = dao.getProductById(id);
		
	%>
	<div class="container">
		<div class="row">
			<!-- 이미지 추가부분 -->
			<div class="col-md-5">
				<%-- <img src="./resource/images/<%=product.getFilename() %>"
					style="width:100%"/> --%>
				<img src="${pageContext.request.contextPath}/resource/images/<%=product.getFilename() %>" style="width:100%">
		
				 <%-- <img src="C://Temp/<%=product.getFilename() %>" style="width:100%"/> --%>
						
			</div>
			<div class="col-md-6">
				
				<h3><%= product.getPname()%></h3>
				<p><%=product.getDescription() %></p>
				<p><b>상품코드 : </b><span class="badge badge-danger"><%=product.getProductId() %></span></p>
				<p><b>제조사 : </b><%=product.getManufacturer() %></p>
				<p><b>분류 : </b><%=product.getCategory() %></p>
				<p><b>재고 수 : </b><%=product.getUnitInStock() %></p>
				<h4><%=product.getUnitPrice() %>원</h4>
				
				<p><a href="#" class="btn btn-info">상품주문&raquo;</a>
				<a href="./products.jsp" class="btn btn-secondary">상품 목록&raquo;</a></p>
			</div>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp"/>

</body>
</html>