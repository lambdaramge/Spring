package boot.data.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import boot.data.dto.BoardAnswerDto;
import boot.data.service.BoardAnswerService;
import boot.data.service.MemberService;

@RestController
public class BbAnswerController {
	
	@Autowired
	BoardAnswerService service;
	
	@Autowired
	MemberService m;
	
	@PostMapping("/board/insertanswer")
	public void insertAnswer(BoardAnswerDto dto,
			HttpSession session) {
		
		String myid=(String)session.getAttribute("myid");
		String name=m.getName(myid);
		
		dto.setMyid(myid);
		dto.setName(name);
		
		service.insertAnswer(dto);
	}

	//list
	@GetMapping("/board/alist")
	public List<BoardAnswerDto> getList(String num){
		return service.getAllAnswers(num);
	}
	
	//delete
	@GetMapping("/board/deleteanswer")
	public void deleteAnswer(String idx) {
		service.deleteAnswer(idx);
	}
	
	//getdata
	@GetMapping("/board/getdata")
	public BoardAnswerDto getData(String idx) {
		return service.getData(idx);
	}
	
	@PostMapping("/board/updateAnswer")
	public void updateAnswer(BoardAnswerDto dto) {
		service.updateAnswer(dto);
	}
}

