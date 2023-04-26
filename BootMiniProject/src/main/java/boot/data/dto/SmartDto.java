package boot.data.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("sdto")
public class SmartDto {

	private int num;
	private String sangname;
	private int price;
	private String color;
	private String content;
	private String ipgoday;
}
