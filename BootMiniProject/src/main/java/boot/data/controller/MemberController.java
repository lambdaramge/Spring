package boot.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import boot.data.dto.MemberDto;
import boot.data.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	MemberService service;

	@GetMapping("/member/form")
	public String form() {
		return "/member/memberform";
	}
	
	@GetMapping("/member/list")
	public ModelAndView list() {
		
		ModelAndView model=new ModelAndView();
		
		List<MemberDto> list=service.getAllMembers();
		model.addObject("list", list);
		model.addObject("totalCount", list.size());
		
		model.setViewName("/member/memberlist");
		return model;
	}
	
	//id중복체크
	@ResponseBody
	@GetMapping("/member/idcheck")
	public Map<String, Integer> idCheck(@RequestParam String id) {
		
		Map<String, Integer> map=new HashMap<>();
		map.put("count", service.getSearchId(id)); //0 or 1 {"count":0}
		return map;
	}
	
	//insert
	@PostMapping("/member/insert")
	public String insert(MemberDto dto,
			MultipartFile myphoto,
			HttpSession session) {
		
		String path=session.getServletContext().getRealPath("/photo");
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		String filename=sdf.format(new Date())+"_"+myphoto.getOriginalFilename();
		
		dto.setPhoto(filename);
		
		try {
			myphoto.transferTo(new File(path+"\\"+filename));
			
			//db insert
			service.insertMember(dto);
			
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//return "/member/gaipsuccess";
		return "redirect:list";
	}
	
	//myinfo
	@GetMapping("/member/myinfo")
	public String myInfo(Model model) {
		
		List<MemberDto> list=service.getAllMembers();
		
		model.addAttribute("list", list);
		
		return "/member/info";
	}
	
	
}
