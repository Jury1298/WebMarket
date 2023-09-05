<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"> -->
<link rel="stylesheet" href="./resource/css/bootstrap.min.css"/>

<!-- 외부 자바스크립트 파일을 가져오기 위해서 아래와 같은 코드를 입력하도록 한다 -->
<script type="text/javascript" src="./resource/js/validation.js"></script>
<meta charset="UTF-8">
<title>상품 등록</title>
</head>
<body>
	<!-- 다국어 처리를 하기위한 코드 -->
	<fmt:setLocale value='<%=request.getParameter("language") %>'/>
	<fmt:bundle basename="resourceBundle.message">
	
	<jsp:include page="menu.jsp"/>
	<!-- 점보트론은 대형전광판이라는 의미를 지니고 있다. 점보트론 안에는 다양한 컴포넌트(텍스트,이미지,회사로고 등)가 포함이 가능하다. -->
	<div class="jumbotron">
		<div class="container">
			<!-- 한글 or 영어로 표시할지 선택하는 부분을 추가함 -->
			<div class="text-right">
				<a href="?language=ko">Korean</a>||<a href="?language=en">English</a>
				
				<!-- 로그아웃 버튼 만들기 -->
				<a href="logout.jsp"class="btn btn-sm btn-SUCCESS pull-right"><b>logout</b></a>
			</div>
			<!-- <h1 class="display-3">상품 등록</h1> -->
			<h1 class="display-3"><fmt:message key="title"/></h1>
			
		</div>
	</div>
	
	<div class="container">
		<!-- form-horizontal : 폼 요소들이 수평적으로 배치되도록해준다 -->
		<form name="newProduct" action="./processAddProduct.jsp" class="form-horizontal" method="post" enctype="multipart/form-data">
		
			<div class="form-group row">
			<!-- 화면크기가 768px이상일때 col-sm-? 이부분이 적용되고, div요소의 block특성에 의해서 100%너비를 가지면
			수직으로 쌓이게 만들어줌 -->
				<!-- <label class="col-sm-2"><b>상품 코드</b></label> -->
				<label class="col-sm-2"><b><fmt:message key="productId"/></b></label>
				<div class="col-sm-3">
					<!-- id속성을 추가한 것은 유효성검사를 위해서 document에서 자바스크립트 파일에서 참조하기 위함 -->
					<input type="text" id="productId" name="productId" class="form-control" placeholder="상품코드를 입력하세요">
				</div>
			</div>
			
			
			<div class="form-group row">
				<!-- <label class="col-sm-2"><b>상품명</b></label> -->
				<label class="col-sm-2"><b><fmt:message key="pname"/></b></label>
				<div class="col-sm-3">
					<input type="text" id="pname" name="pname" class="form-control" placeholder="상품명을 입력하세요">
				</div>
			</div>
			
			<div class="form-group row">
				<!-- <label class="col-sm-2"><b>상품가격</b></label> -->
				<label class="col-sm-2"><b><fmt:message key="unitPrice"/></b></label>
				<div class="col-sm-3">
					<input type="text" id="unitPrice" name="unitPrice" class="form-control" placeholder="상품가격을 입력하세요">
				</div>
			</div>
			
			<div class="form-group row">
				<!-- <label class="col-sm-2"><b>상세정보</b></label> -->
				<label class="col-sm-2"><b><fmt:message key="description" /> </b></label>
				<div class="col-sm-5">
					<textarea name="description" rows="2" cols="50" class="form-control" placeholder="상세정보를 입력해주세요"></textarea>
				</div>
			</div>
			
			<div class="form-group row">
				<!-- <label class="col-sm-2"><b>제조사</b></label> -->
				<label class="col-sm-2"><b><fmt:message key="manufacturer"/> </b></label>
				<div class="col-sm-3">
					<input type="text" name="manufacturer" class="form-control" placeholder="제조사를 입력하세요">
				</div>
			</div>
			
			<div class="form-group row">
				<!-- <label class="col-sm-2"><b>분류</b></label> -->
				<label class="col-sm-2"><b><fmt:message key="category"/></b></label>
				<div class="col-sm-3">
					<input type="text" name="category" class="form-control" placeholder="분류를 입력하세요">
				</div>
			</div>
			
			<div class="form-group row">
				<!-- <label class="col-sm-2"><b>재고수</b></label> -->
				<label class="col-sm-2"><b><fmt:message key="unitInStock"/></b></label>
				<div class="col-sm-3">
					<input type="text" id="unitInStock" name="unitInStock" class="form-control" placeholder="재고수를 입력하세요">
				</div>
			</div>
			
			<div class="form-group row">
				<!-- <label class="col-sm-2"><b>상태</b></label> -->
				<label class="col-sm-2"><b><fmt:message key="condition"/></b></label>
				<div class="col-sm-5">
					<input type="radio" name="condition" value="New"><fmt:message key="condition_New"/>
					<input type="radio" name="condition" value="Old"><fmt:message key="condition_Old"/>
					<input type="radio" name="condition" value="Refurbished"><fmt:message key="condition_Refurbished"/>
				</div>
			</div>
			
			<!-- 상품이미지 업로드 부분 -->
			<div class="form-group row">
				<!-- <label class="col-sm-2"><b>이미지</b></label> -->
				<label class="col-sm-2"><b><fmt:message key="filename"/></b></label>
				<div class="col-sm-5">
					<input type="file" name="filename" class="form-control">
				</div>
			</div>
			
			<div class="form-group row">
				<!-- offset지정은 col의 2만큼 띄워라 -->
				<div class="col-sm-offset-2 col-sm-10">
					<!-- 타입을 버튼으로 바꾸는 이유 : submit타입을 주게되면 유효성검사시 오류가 발생해도 action의 속성값으로 페이지 이동이 일어나기때문 -->
					<!-- <input type="button"  class="btn btn-primary" value="등록" onclick="CheckAddProduct()"> -->
					<input type="button"  class="btn btn-primary" value="<fmt:message key="button"/>" onclick="CheckAddProduct()">
				</div>
			</div>
		
		</form>
	</div>
	</fmt:bundle>
</body>
</html>