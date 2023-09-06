<%@page import="dto.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resource/css/bootstrap.min.css"/>
<%
	//세션의 ID값을 가져오는 코드
	String cartId = session.getId();

%>

<meta charset="UTF-8">
<title>장바구니</title>
</head>
<body>
	<jsp:include page="menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">장바구니</h1>
		</div>
	</div>
	
	<div class="container">
		<div class="row">
			<table width="100%">
				<tr>
					<td align="left"><a href="./deleteCart.jsp?cardId"=<%= cartId%> class="btn btn-danger">삭제하기</a></td>
					<td align="right"><a href="#" class="btn btn-success">주문하기</a></td>
					
				</tr>
			</table>
		</div>
		<div style="padding-top : 50px">
			<!-- table-hover는 마우스 포인터가 있는 행의 배경을 바꾸어서 눈에 띄도록 만들어진 부트스트랩 클래스 -->
			<table class="table table-hover">
				<tr>
					<th>상품</th>
					<th>가격</th>
					<th>수량</th>
					<th>소계</th>
					<th>비고</th>
				</tr>
				
				<%
					int sum=0;
					/* 장바구니인 cartlist에 등록된 모든 상품을 가져오도록 session내장객체의 getAttribute()를 사용한다. */
					ArrayList<Product> cartlist = (ArrayList<Product>)session.getAttribute("cartlist");
					
					//cart.jsp파일에서 전체상품을 삭제하는 deleteCart.jsp에서 session.invalidate()호출하게 되면 cartList은 null이 되기에
					//아래와 같은 코드가 반드시 필요하다
					if(cartlist==null){
						cartlist = new ArrayList<Product>();
					}
					
					//상품 리스트를 하나씩 출력하기
					for(int i=0;i<cartlist.size();i++){
						Product product= cartlist.get(i);
						int total = product.getUnitPrice()*product.getQuantity();
						sum+=total;
					
				%>
				<tr>
					<td><%=product.getProductId() %>-<%=product.getPname() %></td>
					<td><%=product.getUnitPrice() %></td>
					<td><%=product.getQuantity() %></td>
					<td><%=total %></td>
					<td><a href="./removeCart.jsp?id=<%=product.getProductId()%>"class="badge badge-danger">삭제</a></td>
					
				</tr>
				<%} %>
				
				<tr>
					<th></th>
					<th></th>
					<th>총액</th>
					<th><%=sum %></th>
				</tr>
			</table>
			<a href="./products.jsp" class="btn btn-secondary">&raquo;쇼핑 계속하기</a>
		</div>
		<hr>
		
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
	

</body>
</html>