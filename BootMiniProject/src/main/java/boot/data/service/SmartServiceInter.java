package boot.data.service;

import java.util.List;
import java.util.Map;

import boot.data.dto.SmartDto;

public interface SmartServiceInter {

	public void insertShop(SmartDto dto);
	public List<SmartDto> getShopList(int start,int perpage);
	public int getTotalCount();
	public SmartDto getData(int num);
	public void deleteData(int num);
}
