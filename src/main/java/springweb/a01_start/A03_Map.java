package springweb.a01_start;

import java.util.HashMap;
import java.util.Map;

public class A03_Map {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Map<String, String> map = new HashMap<String, String>();
		map.put("name", "홍길동");
		map.put("age", "25");
		// public List<Emp> getEmpList(Map map);
		// mybatis parameterType="map"
		// #{name}, #{age} 로 처리가 가능하다.
		System.out.println("이름 : " + map.get("name"));
		System.out.println("나이 : " + map.get("age"));

	}

}
