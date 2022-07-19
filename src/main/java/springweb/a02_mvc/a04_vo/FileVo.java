package springweb.a02_mvc.a04_vo;

import org.springframework.web.multipart.MultipartFile;

public class FileVo {
	private MultipartFile addFile;
	private String title;
	public MultipartFile getAddFile() {
		return addFile;
	}
	public void setAddFile(MultipartFile addFile) {
		this.addFile = addFile;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
}
