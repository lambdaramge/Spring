package boot.data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
@Alias("boarddto")
public class BoardDto {
	
	private String num;
	private String name;
	private String myid;
	private String subject;
	private String content;
	private String uploadfile; //insert할때 multipart 대신에
	private MultipartFile upload; //dto 멤버로 줄수도 있음, form tag의 name과 동일하게, 여러개하려면 arraylist로
	private int readcount;
	private Timestamp writeday;

}
