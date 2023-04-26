package boot.data.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import boot.data.dto.SmartDto;

@Mapper
public interface SmartMapperInter {

	public void insertShop(SmartDto dto);
	public List<SmartDto> getShopList(Map<String, Integer> map);
	public int getTotalCount();
	public SmartDto getData(int num);
	public void deleteData(int num);
}
