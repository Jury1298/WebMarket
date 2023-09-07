<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="dao.ProductRepository"%>
<%@page import="dto.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session"></jsp:useBean> --%>
<!DOCTYPE html>
<% request.setCharacterEncoding("UTF-8");
	DecimalFormat dfFormat = new DecimalFormat("###,###");		//숫자를 천단위 구분하게끔 
%>
<html>
<head>
<!-- CDN방식은 더이상 사용하지 않는다.(인터넷이 되는 곳만 허용됨으로) -->
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"> -->
<!-- 다운로드 받은 파일을 직접 link를 걸고있다. -->
<link rel="stylesheet" href="./resource/css/bootstrap.min.css"/>
<meta charset="UTF-8">
<title>상품목록</title>
</head>
<body>

	<jsp:include page="menu.jsp"/>
		
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 목록</h1>
		</div>
	</div>
	<%-- <%	
		ProductRepository dao = ProductRepository.getInstance();
		//상품목록을 다 가져온다.
		ArrayList<Product> listOfProducts = dao.getAllProducts();
	%> --%>
	
	
	<div class="container">
		<div class="row" align="center">
			<%@include file="dbconn.jsp" %> <!-- db연동하는 부분 -->
			<%
				/* for(int i=0;i<listOfProducts.size();i++){
					Product product= listOfProducts.get(i);  */
				
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				String sql = "select * from product";
				//Connection객체로부터 쿼리를 주고 preparestatment객체를 얻고있다.
				pstmt = conn.prepareStatement(sql); 
				//쿼리의 결과를 받아오고 있다.
				rs = pstmt.executeQuery();
				
				while(rs.next()){
					
			%>
			<div class="col-md-4">
				<img alt="사진" src="${pageContext.request.contextPath}/resource/images/<%=rs.getString("p_filename") %>"
					style="width : 100%"/>
				<h3><%=rs.getString("p_name") %></h3>
				<p><%=rs.getString("p_description") %></p>
				<p><%= dfFormat.format(Integer.parseInt(rs.getString("p_unitPrice"))) %>원</p>
				
				<!-- 경로를 지정해서 이미지를 출력하고 있다. -->
				<!-- 일반 웹브라우저에서는 적용X : 웹어플리케이션에서 적용이 될려면 상대적 경로로 제시해주어야 경로가 제대로 인식 -->
				<%-- <img src="./resource/images/<%= product.getFilename()%>" style="width:100%"/> --%>
				<%-- <img src="C://Temp/<%= product.getFilename()%>" style="width:100%"/> --%>
				<%-- <%
					System.out.println(request.getContextPath());
				%> --%>
				<%-- <img src="${pageContext.request.contextPath}/resource/images/<%=product.getFilename() %>" style="width:100%">
				
				<h3><%=product.getPname() %></h3>
				<p><%=product.getDescription() %></p>
				<p><%=dfFormat.format(product.getUnitPrice()) %>원</p> --%>
				<!-- 상품의 아이디에 대한 상세정보 페이지를 연결시키기위해서 아래코드를 작성하였다. -->
				<p><a href="./product.jsp?id=<%=rs.getString("p_id") %>" 
					class="btn btn-secondary" role="button">상세 정보 &raquo;</a></p>
			</div>
			<%
				}
				if(rs!=null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn!=null) conn.close();
			%>
		</div>
		<hr>
	</div>
	
	<jsp:include page="footer.jsp"/>
	
</body>
</html>