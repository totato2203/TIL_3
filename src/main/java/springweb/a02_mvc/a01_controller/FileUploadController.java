package springweb.a02_mvc.a01_controller;

import java.io.File;
import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class FileUploadController {
	// 1. 파일 업로드 연습을 하기 위한 초기 화면
	// http://localhost:7080/springweb/uploadForm01.do
	@GetMapping("uploadForm01.do")	// get 방식 호출
	public String uploadForm01() {
		return "WEB-INF\\views\\a02_mvc\\a10_fileUpload.jsp";
	}
	@PostMapping("uploadForm01.do")	// post 방식 호출
	public String uploadForm02(@RequestParam("report") MultipartFile report) {
		// MultipartFile : stream 방식으로 client ==> server로 파일을 가져왔을 때 받을 수 있음
		System.out.println("업로드된 파일명 : " + report.getOriginalFilename());
		return "WEB-INF\\views\\a02_mvc\\a10_fileUpload.jsp";
	}
	// ex) a11_fileUpload.jsp uploadForm02.do
	//		<input name="fileData"/>로 파일이 업로드 된 것을 확인하세요.
	// http://localhost:7080/springweb/uploadForm02.do
	@GetMapping("uploadForm02.do")
	public String uploadForm02_1() {
		return "WEB-INF\\views\\a02_mvc\\a11_fileUpload.jsp";
	}
	@PostMapping("uploadForm02.do")
	public String uploadForm02_2(@RequestParam("fileData") MultipartFile fileData) {
		System.out.println("업로드할 파일명 : " + fileData.getOriginalFilename());
		String fname = fileData.getOriginalFilename();
		// 경로를 지정하여 파일 객체 생성
		String path = "C:\\a01_javaexp\\workplace\\springweb\\src\\main\\webapp\\z01_upload\\";
		File f = new File(path + fname);
		// MultipartFile ==> File 변환

			try {
				fileData.transferTo(f);
				System.out.println("파일 업로드 완료");
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		return "WEB-INF\\views\\a02_mvc\\a11_fileUpload.jsp";
	}
}
