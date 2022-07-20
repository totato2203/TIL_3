package springweb.a02_mvc.a01_controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class DownLoadController {
	
	// 파일 경로 정보
	// Value("${upload}")		==> download viewer에서 설정
	// private String upload;

	// http://localhost:7080/springweb/download10.do?filename=banner.png viewer fileView01
	@RequestMapping("download10.do")
	public String download10(@RequestParam("filename") String filename, Model d) {
		d.addAttribute("downloadFileName", filename);
		return "fileView01";
	}
	// jsp에서 click(function(){location.href="${path}/download10.do?filename="+$("[name=fname]").val()
	
	
	// http://localhost:7080/springweb/download11.do?file01=banner.png
	@RequestMapping("download11.do")
	public String download11(@RequestParam("file01") String fname, Model d) {
		d.addAttribute("downloadFileName", fname);
		return "fileView01";
		
	}
}


