package boot.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import boot.data.BookDto;
import boot.mapper.BookInterMapper;

@Controller
@RequestMapping("/bookstore")
public class BookController {

	@Autowired
	BookInterMapper mapper;
	
	@GetMapping("/list")
	public String getList(Model model,BookDto dto) {
		
		int tot=mapper.getTotalCount();
		List<BookDto> list=mapper.getAllDatas();

		for(BookDto a:list) {
			String [] photos=a.getBookphoto().split(",");
			a.setBookphoto(photos[0]);
		}
		
		model.addAttribute("tot", tot);
		model.addAttribute("list", list);
		
		return "list";
	}
	
	@GetMapping("/write")
	public String getAddForm() {
		return "addform";
	}
	
	@PostMapping("/insert")
	   public String insert(@ModelAttribute BookDto dto, 
			   @RequestParam ArrayList<MultipartFile> image, 
			   HttpSession session,
			   Model model) {
	      

	      String path=session.getServletContext().getRealPath("/imagefile");
	      
	      ArrayList<String> files=new ArrayList<String>();
	      
	      for(MultipartFile f:image) {
	    	 String fileName=f.getOriginalFilename()+",";
	    	 files.add(fileName);
	         
	         try {
	            f.transferTo(new File(path+"\\"+fileName.substring(0,fileName.length()-1)));
	            
	         } catch (IllegalStateException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	         } catch (IOException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	         }      
	         
	      }
	      
	       String joinedFiles = String.join("", files);
	          if (joinedFiles.endsWith(",")) {
	              joinedFiles = joinedFiles.substring(0, joinedFiles.length() - 1);
	          }
	          dto.setBookphoto(joinedFiles);
	          
	      mapper.insertData(dto);
	      
	      return "redirect:list";
	         
	   }
	
}

