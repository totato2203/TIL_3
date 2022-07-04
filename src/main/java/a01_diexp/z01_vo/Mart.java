package a01_diexp.z01_vo;

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
	public void setProduct(Product product) {
		this.product = product;
	}
	
}
