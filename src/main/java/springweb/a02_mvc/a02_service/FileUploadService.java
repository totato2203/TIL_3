package springweb.a02_mvc.a02_service;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import springweb.a02_mvc.a03_dao.DaoExp;
import springweb.a02_mvc.a04_vo.BoardFile;
import springweb.a02_mvc.a04_vo.FileVo;

@Service
public class FileUploadService {
	@Autowired(required = false)
	private DaoExp dao;
	
	@Value("${upload}")
	private String path;
	public void upload(FileVo vo){
		MultipartFile mpf = vo.getAddFile();
		String fname = mpf.getOriginalFilename();
		File f01 = new File(path + fname);
		
		try {
			mpf.transferTo(f01);
			System.out.println("파일 업로드 성공");
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// DB로 파일 정보 등록
		dao.insertFile(new BoardFile(path, fname));
	}
}
