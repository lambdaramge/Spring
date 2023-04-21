 package boot.data.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import boot.data.dto.MemberDto;
import boot.data.service.MemberService;

@Controller
public class LoginController {

	@Autowired
	MemberService service;
	
	@GetMapping("/login/main")
	public String login(HttpSession session,
			Model model) {
		
		//폼의 id를 얻어옴
		String myid=(String)session.getAttribute("myid");
		//로그인 상태 판단
		String loginok=(String)session.getAttribute("loginok");
		
		//한번도 실행안하면 null
		if(loginok==null) {
			return "/login/loginform";
		}else {
			//로그인 중일때 request에 로그인한 이름 저장하기
			String name=service.getName(myid);
			model.addAttribute("name", name);
			
			return "/login/logoutform";
		}
	}
	
	@PostMapping("/login/loginproc")
	public String loginproc(@RequestParam String id,
			@RequestParam String pass,
			@RequestParam(required = false) String cbsave,
			HttpSession session,
			Model model) {
		
		int logincheck=service.loginIdPassCheck(id, pass);
		
		if (logincheck==1) { //로그인 성공시 세션 저장
			session.setMaxInactiveInterval(60*60*8); //8시간 세션저장
			
			session.setAttribute("myid", id);
			session.setAttribute("loginok", "yes");
			session.setAttribute("saveok", cbsave);
			
			//id에 대한 데이터
			MemberDto dto=service.getDataById(id);
			session.setAttribute("loginname", dto.getName());
			session.setAttribute("loginphoto", dto.getPhoto());
			
			return "redirect:main";
		
		}else { //로그인 실패시 
			
			return "/member/passfail";
		}
		
	}
	
	@GetMapping("/login/logoutproc")
	public String logout(HttpSession session) {
		
		session.removeAttribute("loginok");
		session.removeAttribute("myid");
		
		return "redirect:main";
	}
	
}
