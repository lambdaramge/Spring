package data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import data.dto.MarketDto;
import data.mapper.MarketMapperInter;

@Controller
public class MarketController {

	@Autowired
	MarketMapperInter mapper;
	
	@GetMapping("/")
	public String index() {
		return "redirect:market/list";
	}
	
	@GetMapping("/market/list")
	public ModelAndView list() {
		
		ModelAndView model=new ModelAndView();
		
		List<MarketDto> list=mapper.getList();
		int totalCount=mapper.getTotalCount();

		model.addObject("list", list);
		model.addObject("totalCount", totalCount);
		
		model.setViewName("marketlist");
		return model;
	}
	
	@GetMapping("/market/form")
	public String addform() {
		return "addform";
	}
	
	@PostMapping("/market/insert")
	public String insertData(@ModelAttribute MarketDto dto,
			@RequestParam MultipartFile photo,
			HttpSession session) {
		
		//업로드 경로구하기
		String path=session.getServletContext().getRealPath("/upload");
		
		if(photo.getOriginalFilename().equals("")) {
			dto.setPhotoname(null);
		}else {
			//사진명 구해서 
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
			String photoname="f "+sdf.format(new Date())+photo.getOriginalFilename();
			//db에 넣기
			dto.setPhotoname(photoname);

			try {
				photo.transferTo(new File(path+"\\"+photoname));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		mapper.insertMarket(dto);
		
		return "redirect:list"; 
	}
	
	@GetMapping("/market/delete")
	public String deleteData(String num,
			HttpSession session) {
		
		String photo=mapper.getData(num).getPhotoname();
		if(!(photo==null)) {
			String path=session.getServletContext().getRealPath("/upload");
			
			File file=new File(path+"\\"+photo);
			file.delete();
		}
		
		mapper.deleteData(num);
		
		return "redirect:list"; 
	}
	
	@GetMapping("/market/detail")
	public ModelAndView getData(String num) {
		
		ModelAndView model=new ModelAndView();		
		MarketDto dto=mapper.getData(num);
		
		model.addObject("dto", dto);
		
		model.setViewName("updateform");
		return model;
	}
	
	@PostMapping("/market/update")
	public String updateData(@ModelAttribute MarketDto dto,
			@RequestParam MultipartFile photo,
			HttpSession session
			) {
		
		String path=session.getServletContext().getRealPath("/upload");
		
		//사진명 구해서 
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		String photoname="f_"+sdf.format(new Date())+photo.getOriginalFilename();
		//db에 넣기
		dto.setPhotoname(photoname);

		try {
			photo.transferTo(new File(path+"\\"+photoname));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		mapper.updateData(dto);
		
		return "redirect:list";
	}
}
