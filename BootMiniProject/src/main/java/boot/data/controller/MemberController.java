package boot.data.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MemberController {

	@GetMapping("/member/form")
	public String form() {
		return "/member/memberform";
	}
	
	@GetMapping("/member/list")
	public String list() {
		return "/member/memberlist";
	}
}
