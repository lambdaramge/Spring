package boot.data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("IpgoDto")
public class IpgoDto {

	private String num;
	private String sangpum;
	private String photoname;
	private String dimage; //대표이미지, 여러 이미지중 첫번째 사진
	private int price;
	private Timestamp ipgoday;
}
