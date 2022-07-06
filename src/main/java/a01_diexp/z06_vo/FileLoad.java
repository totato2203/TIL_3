package a01_diexp.z06_vo;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component("file01")
public class FileLoad {
	private String title;
	
	// 공통설정내용을 특정한 필드에 바로 할당하도록 처리
	@Value("${file.upload}")
	private String repository;
	public FileLoad() {
		// TODO Auto-generated constructor stub
	}
	public FileLoad(String repository, String title) {
		this.repository = repository;
		this.title = title;
	}
	public String getRepository() {
		return repository;
	}
	public void setRepository(String repository) {
		this.repository = repository;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
}
