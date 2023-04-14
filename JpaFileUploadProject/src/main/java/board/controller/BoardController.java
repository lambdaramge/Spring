package board.controller;

import java.io.File;
import java.io.IOException;
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

import board.data.BoardDao;
import board.data.BoardDto;

@Controller
public class BoardController {

	@Autowired
	BoardDao dao;
	
	@GetMapping("/")
	public String home() {
		
		return "redirect:board/list";
	}
	
	@GetMapping("/board/list")
	public ModelAndView list() {
		ModelAndView model=new ModelAndView();
		
		List<BoardDto> list=dao.getAllDatas();
		
		model.addObject("list", list);
		model.addObject("totalCount", list.size());
		
		model.setViewName("list");
		return model;
	}
	
	@GetMapping("/board/writeform")
	public String addForm() {
		return "addform";
	}
	
	@PostMapping("/board/insert")
	public String insertData(@ModelAttribute BoardDto dto, 
			@RequestParam MultipartFile upload,
			HttpSession session) {
		
		//업로드된 실제경로 
		String realPath=session.getServletContext().getRealPath("/save");
		System.out.println(realPath);
		
		//사진을 실제경로에 업로드한 후 그 파일명을 dto.setphoto해서 저장
		//사진을 안넣으면 no라고 저장
		String uploadName=upload.getOriginalFilename();
		
		if(upload.isEmpty()) {
			dto.setPhoto("no");
		}else {
			dto.setPhoto(uploadName); 
			
			//실제업로드
			try {
				upload.transferTo(new File(realPath+"\\"+uploadName));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		dao.insertBoard(dto);
		
		return "redirect:list";
	}
	
	@GetMapping("/board/detail")
	public String getDetail(long num, Model model) {
		
		BoardDto dto=dao.getData(num);
		
		model.addAttribute("dto",dto);
		
		return "detail";
	}
	
	//delete
	@GetMapping("/board/delete")
	public String deleteData(long num, HttpSession session) {
		//사진삭제
		String photo=dao.getData(num).getPhoto();
		if(!photo.equals("no")) {
			String path=session.getServletContext().getRealPath("/save");
			
			File file=new File(path+"\\"+photo);
			file.delete();
		}
		
		//일반삭제
		dao.deleteData(num);
		
		return "list";
	}
	
	//updateform
	@GetMapping("/board/updateform")
	public String updateForm(long num, Model model) {

		BoardDto dto=dao.getData(num);
		
		model.addAttribute("dto",dto);
		
		return "updateform";
		
	}
	
	 @PostMapping("/board/update")
	   public String update(@ModelAttribute BoardDto dto, 
			   @RequestParam MultipartFile upload, 
			   HttpSession session) {
		 
	      String realPath=session.getServletContext().getRealPath("/save");
	      
	      String uploadName=upload.getOriginalFilename();
	      
	      if(upload.isEmpty()) { //올라온게 없으면
	    	  //이미 올라가있는 사진을 넣는다
	         dto.setPhoto(dao.getData(dto.getNum()).getPhoto());
	        
	      }else { //새로 사진이 올라왔으면
	    	 //올라온 업로드네임을 넣는다
	         dto.setPhoto(uploadName);
	      }
	      
	      	//실제 업로드
	            try {
	               upload.transferTo(new File(realPath+"\\"+uploadName));
	            } catch (IllegalStateException e) {
	               // TODO Auto-generated catch block
	               e.printStackTrace();
	            } catch (IOException e) {
	               // TODO Auto-generated catch block
	               e.printStackTrace();
	            }
	      dao.updateData(dto);
	      
	      return "redirect:detail?num="+dto.getNum();
	   }
}
