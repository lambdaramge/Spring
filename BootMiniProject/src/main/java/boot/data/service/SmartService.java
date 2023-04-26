package boot.data.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.data.dto.SmartDto;
import boot.data.mapper.SmartMapperInter;

@Service
public class SmartService implements SmartServiceInter {

	@Autowired
	SmartMapperInter mapper;
	
	@Override
	public void insertShop(SmartDto dto) {
		
		mapper.insertShop(dto);
	}

	@Override
	public List<SmartDto> getShopList(int start, int perpage) {
		
		Map<String, Integer> map=new HashMap<>();
		map.put("start", start);
		map.put("perpage", perpage);
		
		return mapper.getShopList(map);
	}

	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return mapper.getTotalCount();
	}

	@Override
	public SmartDto getData(int num) {
		// TODO Auto-generated method stub
		return mapper.getData(num);
	}

	@Override
	public void deleteData(int num) {
		mapper.deleteData(num);
	}

}
