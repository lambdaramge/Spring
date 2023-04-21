package boot.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import boot.data.dto.IpgoDto;
import boot.data.dto.MemberDto;
import boot.data.mapper.IpgoMapperInter;
import boot.data.service.MemberService;

@Controller
public class IpgoController {

	@Autowired
	IpgoMapperInter mapper;
	
	@Autowired
	MemberService service;
	
	@GetMapping("/")
	public String start(Model model,HttpSession session) {
		
		String myid=(String)session.getAttribute("myid");
		
		MemberDto dto=service.getDataById(myid);
		
		model.addAttribute("dto", dto);
		
		return "/layout/main";
	}
	
	@GetMapping("/ipgo/list")
	public ModelAndView getList() {
		
		ModelAndView model=new ModelAndView();
		
		int totalCount=mapper.getTotalCount();
		List<IpgoDto> list=mapper.getAllIpgos();
		
		//대표이미지 설정
		for(IpgoDto dto:list) {
			String [] photos=dto.getPhotoname().split(",");
			dto.setDimage(photos[0]);
		}
		
		model.addObject("totalCount", totalCount);
		model.addObject("list", list);
		
//		model.setViewName("list"); jsp리졸버
		model.setViewName("/sub/ipgo/list");
		return model;
	}
	
	@GetMapping("/ipgo/form")
	public String form() {
//		return "form"; //jsp리졸버
		return "/sub/ipgo/form";
	}
	
	@PostMapping("/ipgo/insert")
	public String add(@ModelAttribute IpgoDto dto,
			@RequestParam ArrayList<MultipartFile> upload, //upload=>form의 name
			HttpSession session) {
		
		String path=session.getServletContext().getRealPath("/photo");
		String uploadName="";
		int idx=1;
		
		if(upload.get(0).getOriginalFilename().equals("")) {//등록된 사진이 없을때 null대신 다른값을 넣으려면
			uploadName="no";
		}else {
			
			for(MultipartFile f:upload) {
				
				SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
				String fName=idx++ +"_"+sdf.format(new Date())+f.getOriginalFilename();
				
				uploadName+=fName+",";
				
				//업로드
				try {
					f.transferTo(new File(path+"\\"+fName));
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			//마지막 컴마 제거
			uploadName=uploadName.substring(0, uploadName.length()-1);
		}
		
		dto.setPhotoname(uploadName);
		
		mapper.insertIpgo(dto);
		
		return "redirect:list";
	}
	
	//오시는길
	@GetMapping("/road/map")
	public String road() {
		return "/sub/road/map";
	}
}
