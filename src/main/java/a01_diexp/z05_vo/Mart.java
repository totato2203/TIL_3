package a01_diexp.z05_vo;

public class Mart {
	private String name;
	private Product product;
	public Mart() {}
	public Mart(String name) {
		this.name = name;
	}
	public void buy() {
		System.out.print(name + "마트에서 ");
		if(product != null) {
			System.out.print(product.getPname() + " 물건을 ");
			System.out.print(product.getPrice() + "원에 ");
			System.out.println(product.getCnt() + "개를 구매했습니다. ");
		}else {
			System.out.println("물건을 구매하지 않았습니다!!");
		}
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Product getProduct() {
		return product;
	}
	
	// <bean id="product" autowire="byName">
	// 할당할 수 있게 property 선언
	public void setProduct(Product product) {
		this.product = product;
	}
	
}
