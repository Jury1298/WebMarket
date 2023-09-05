<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="dto.Product"%>
<%@page import="dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	//addProduct.jsp에서 사용자가 업로드한 이미지 저장하고 있다.
	String filename ="";
	//String realFolder = "C://Temp"; //웹 어플리케이션 절대경로
	
	String realFolder = "D:/JSP02/WebMarket/WebContent/resource/images";
	int maxSize = 10*1024*1024; //최대 업로드크기 10M
	String encType = "utf-8"; //인코딩 유형
	
	MultipartRequest multi = new MultipartRequest(request,realFolder,maxSize,encType,new DefaultFileRenamePolicy());


	//addProduct.jsp에서 사용자가 입력한 부분을 받아서 저장하고 있다.
	 String productId = multi.getParameter("productId");
	 String pname = multi.getParameter("pname");
	 String unitPrice = multi.getParameter("unitPrice");
	 String description = multi.getParameter("description");
	 String manufacturer = multi.getParameter("manufacturer");
	 String category = multi.getParameter("category");
	 String unitInStock = multi.getParameter("unitInStock");
	 String condition = multi.getParameter("condition");
	 
	
	 Integer price;
	 long stock;
	
	 
	 //단가(unitPrice)입력창에 미입력시에 디폴트값
	 if(unitPrice.isEmpty()){
		 price =0; //자동박싱
	 }else{
		 //String -> 숫자로 변환
		 price = Integer.valueOf(unitPrice);
	 }
	 
	 //재고수량(stock)입력창에 미입력시에 디폴트값
	 if(unitInStock.isEmpty()){
		 stock =0; //자동박싱
	 }else{
		 //String -> long타입으로 변환
		 stock = Long.valueOf(unitInStock);
	 }
	 
	 Enumeration files =  multi.getFileNames();
	 String fname = (String)files.nextElement();
	 String fileName = multi.getFilesystemName(fname);
	 
	 ProductRepository dao = ProductRepository.getInstance();
	 Product newProduct = new Product();
	 
	 //Product객체에 사용자가 입력한 내용을 저장하고 있다.
	 newProduct.setProductId(productId);
	 newProduct.setPname(pname);
	 newProduct.setUnitPrice(price);
	 newProduct.setDescription(description);
	 newProduct.setManufacturer(manufacturer);
	 newProduct.setCategory(category);
	 newProduct.setUnitInStock(stock);
	 newProduct.setCondition(condition);
	 //이미지 저장부분
	 newProduct.setFilename(filename);
	 
	 //ArrayList에 새 상품을 추가하고 있다.
	 dao.addProduct(newProduct);
	 
	 //강제로 페이지 이동을 시키고 있다.
	 response.sendRedirect("products.jsp");
	 
	 
	 
%>