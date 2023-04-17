package boot.data;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("bdto")
public class BookDto {

	private String num;
	private String bookname;
	private String bookwriter;
	private String bookcompany;
	private String bookprice;
	private String bookphoto;
	private Timestamp ipgoday;
}
