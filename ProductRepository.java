package dao;

import java.util.ArrayList;

import dto.Product;

public class ProductRepository {
	
	private ArrayList<Product> listOfProducts = new ArrayList<>();
	//ProductRepository인스턴스를 하나만 공유하게끔  '싱글톤'패턴을 이용한다.
	private static ProductRepository instance = new ProductRepository();
	
	//ProductRepository 인스턴스를 리턴하는 getter메서드
	public static ProductRepository getInstance() {
		return instance;
	}
	
	public ProductRepository() {
		Product phone = new Product("P1234", "Galaxy S20", 1200000);
		phone.setDescription("5.25-inch, 1334*750 HD display, Intel Core Processor");
		phone.setCategory("Smart Phone");
		phone.setManufacturer("SamSung");
		phone.setUnitInStock(1000);
		phone.setCondition("New");
		phone.setFilename("P1234.png");
		
		Product notebook = new Product("P1235", "LG Gram", 2000000);
		notebook.setDescription("13.3-inch, IPS FULL HD display, 16mehapixel Camera");
		notebook.setCategory("Notebook");
		notebook.setManufacturer("LG");
		notebook.setUnitInStock(1000);
		notebook.setCondition("Refurbished");
		notebook.setFilename("P1235.png");
		
		Product tablet = new Product("P1236", "Galaxy Tab", 900000);
		tablet.setDescription("212.8*125.6*6.6mm, Super AMOLED display, Octa-Core Processor");
		tablet.setCategory("Notebook");
		tablet.setManufacturer("SamSung");
		tablet.setUnitInStock(1000);
		tablet.setCondition("Old");
		tablet.setFilename("P1236.png");
		
		listOfProducts.add(phone);
		listOfProducts.add(notebook);
		listOfProducts.add(tablet);
	}
	
	public ArrayList<Product> getAllProducts(){
		return listOfProducts;
	}
	
	//listOfProducts에 저장된 모든 상품목록을 조회해서 상품id와 일치하는 상품을 리턴
	public Product getProductById(String productId) {
		Product productById = null;
		for(int i=0;i<listOfProducts.size();i++) {
			Product product = listOfProducts.get(i);
			if(product !=null && product.getProductId()!=null && product.getProductId().equals(productId)) {
				productById = product;
				break;
			}
		}
		return productById;
	}
	
	//상품을 추가하는 역할을 하는 메서드
	public void addProduct(Product product) {
		listOfProducts.add(product);
	}
}
