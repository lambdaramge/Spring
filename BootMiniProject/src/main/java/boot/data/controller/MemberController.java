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
		
		return "/member/gaipsuccess";
	}
	
	//myinfo
	@GetMapping("/member/myinfo")
	public String myInfo(Model model, HttpSession session) {
		
		List<MemberDto> list=service.getAllMembers();
		
		String loginok=(String)session.getAttribute("loginok");
		
		if(loginok!=null) {
			model.addAttribute("list", list);
			String myid=(String)session.getAttribute("myid");
			
			MemberDto dto=service.getDataById(myid);
			model.addAttribute("dto", dto);
			
		}
		
		return "/member/info";
	}
	
	@ResponseBody
	@GetMapping("/member/delete")
	public String deleteMembers(@RequestParam String num) {
		service.deleteMembers(num);
		
		return "redirect:list";
	}
	
	@GetMapping("/member/deleteinfo")
	public String deleteMember(@RequestParam String num,
			HttpSession session) {
		service.deleteMembers(num);
		
		session.removeAttribute("loginok");
		
		return "/layout/main";
	}
	
	//info에서 사진만 수정
	@ResponseBody //formdata로 ajax 수정
	@PostMapping("/member/updatephoto")
	public void photoupdate(String num, 
			MultipartFile photo,
			HttpSession session) {
		
		//업로드될 경로
		String path=session.getServletContext().getRealPath("/photo");
		
		//파일명
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		String fileName="f_"+sdf.format(new Date())+photo.getOriginalFilename();
		
		try {
			
			photo.transferTo(new File(path+"\\"+fileName));
			
			service.updatePhoto(num, fileName); //db에 사진 수정. 세션 사진은 수정 안됨
			session.setAttribute("loginphoto", fileName);
			
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	//회원정보수정 불러오기
	@ResponseBody
	@GetMapping("/member/getdata")
	public MemberDto getData(String id, HttpSession session) {
		
		id=(String)session.getAttribute("myid");
		
		return service.getDataById(id);
		
	}
	
	//회원정보 수정하기
	@ResponseBody
	@PostMapping("/member/updatedata")
	public void updateData(MemberDto dto,
			HttpSession session) {
		
		service.updateMember(dto);
		session.setAttribute("loginname", dto.getName());
	}
}
