package boot.data.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import boot.data.dto.MemberDto;
import boot.data.service.MemberService;

@RestController
public class LoginRestController {

	@Autowired
	MemberService service;
	
	@GetMapping("/member/login")
	public Map<String, String> loginproc(String id,String pass,HttpSession session){
		Map<String, String> map=new HashMap<>();
		
		int result=service.loginIdPassCheck(id, pass);
		
		if(result==1) { //로그인 ok
			
			session.setMaxInactiveInterval(60*60*8); //세션 유지 8시간
			
			//로그인한 정보 얻어서 세션에 저장
			MemberDto dto=service.getDataById(id);
			session.setAttribute("loginok", "yes");
			session.setAttribute("myid", id);
			session.setAttribute("image", dto.getPhoto());
			
			session.setAttribute("loginname", dto.getName());
		}
		
		map.put("result", result==1?"success":"fail");
		
		return map;
	}
	
	@GetMapping("/member/logout")
	public void logoutproc(HttpSession session) {
		
		//로그이웃때 제거되어야 할 세션
		session.removeAttribute("loginok");
		session.removeAttribute("myid");
	}
}
