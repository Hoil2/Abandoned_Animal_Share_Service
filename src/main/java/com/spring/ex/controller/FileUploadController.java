package com.spring.ex.controller;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class FileUploadController {
	@Autowired ServletContext servletContext;
	
	String uploadPath;
  
	@RequestMapping(value="/uploadPage", method=RequestMethod.GET)
	public String fileupload() {
		return "fileuploadTest";
	}
  
	@RequestMapping(value="/upload", method=RequestMethod.POST)
	public String uploadForm(HttpServletRequest request, @RequestParam MultipartFile image) throws Exception {
		System.out.println(servletContext.getRealPath("resources/"));
		
		/*
		 * createFolder();
		 * 
		 * System.out.println(request.getParameter("text"));
		 * System.out.println(image.getOriginalFilename());
		 * 
		 * // 랜덤 값 생성 String uuid = UUID.randomUUID().toString();
		 * 
		 * // 파일을 저장하기 위한 경로와 파일명 지정 File fileInfo = new File(uploadPath, uuid +
		 * image.getOriginalFilename()); // 파일 저장 image.transferTo(fileInfo);
		 */
      
		return "redirect:uploadPage";
	}
	
	public void createFolder() {
		File folder = new File(uploadPath);
		
		if (!folder.exists()) {
			try{
			    folder.mkdir(); //폴더 생성합니다.
			    System.out.println("폴더가 생성되었습니다.");
		        } 
		        catch(Exception e){
			    e.getStackTrace();
			}        
	         } else {
			System.out.println("이미 폴더가 생성되어 있습니다.");
		}
	}
}