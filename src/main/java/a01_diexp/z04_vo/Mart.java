package a01_diexp.z04_vo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("mart01")
public class Mart {
	private String name;
	// source 상에 객체가 할당될 수 있게 선언
	// container에 해당 객체가 로딩되어 있을 때, 자동으로 할당할 수 있게 처리된다.
	@Autowired
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
