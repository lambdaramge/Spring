package boot.data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
@Alias("answerdto")
public class BoardAnswerDto {

	private String idx;
	private String num;
	private String myid;
	private String name;
	private String content;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm")
	private Timestamp writeday;
}
