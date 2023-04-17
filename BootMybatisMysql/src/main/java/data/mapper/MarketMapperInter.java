package data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import data.dto.MarketDto;

@Mapper
public interface MarketMapperInter {
	
	public int getTotalCount(); //mapper.xml에서의 id와 이름 동일
	public void insertMarket(MarketDto dto);
	public List<MarketDto> getList();
	public void deleteData(String num);
	public MarketDto getData(String num);
	public void updateData(MarketDto dto);
}
