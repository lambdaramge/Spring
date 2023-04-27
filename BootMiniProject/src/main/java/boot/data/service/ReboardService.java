package boot.data.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.data.dto.ReboardDto;
import boot.data.mapper.ReboardMapperInter;

@Service
public class ReboardService implements ReboardServiceInter {

	@Autowired
	ReboardMapperInter mapper;
	
	@Override
	public int getMaxNum() {
		// TODO Auto-generated method stub
		return mapper.getMaxNum();
	}

	@Override
	public int getTotalCount(String searchcolumn, String searchword) {
		// TODO Auto-generated method stub
		
		Map<String, String> map=new HashMap<>();
		
		map.put("searchcolumn", searchcolumn);
		map.put("searchword", searchword);
		
		return mapper.getTotalCount(map);
	}

	@Override
	public List<ReboardDto> getPagingList(String searchcolumn, String searchword, int start, int perpage) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map=new HashMap<>();
		
		map.put("searchcolumn", searchcolumn);
		map.put("searchword", searchword);
		map.put("start", start);
		map.put("perpage", perpage);
		
		return mapper.getPagingList(map);
	}

	@Override
	public void insertReboard(ReboardDto dto) {
		// TODO Auto-generated method stub
		
		int num=dto.getNum(); //새글일 경우는 0이 들어있다.
		int regroup=dto.getRegroup();
		int restep=dto.getRestep();
		int relevel=dto.getRelevel();
		
		if(num==0) { //새글일 경우
			regroup=this.getMaxNum()+1;
			restep=0;
			relevel=0;
		}else { //답글일 경우
			
			//같은 그룹 중에서 전달받은 restep보다 큰 값은 일괄 1씩 증가
			this.updateRestep(regroup, restep);
			
			//그 이후에 전달받은 값보다 1크게 db저장
			restep++;
			relevel++;
		}
		
		//변경된 값들을 다시 dto에 담는다
		dto.setRegroup(regroup);
		dto.setRestep(restep);
		dto.setRelevel(relevel);
		
		mapper.insertReboard(dto);
		
	}

	@Override
	public void updateRestep(int regroup, int restep) {
		// TODO Auto-generated method stub
		
		Map<String, Integer> map=new HashMap<>();
		
		map.put("regroup", regroup);
		map.put("restep", restep);
		
		mapper.updateRestep(map);
	}

	@Override
	public void updateReadcount(int num) {
		// TODO Auto-generated method stub
		mapper.updateReadcount(num);
	}

	@Override
	public ReboardDto getData(int num) {
		// TODO Auto-generated method stub
		return mapper.getData(num);
	}

	@Override
	public void updateReboard(ReboardDto dto) {
		// TODO Auto-generated method stub
		mapper.updateReboard(dto);
	}

	@Override
	public void deleteReboard(int num) {
		// TODO Auto-generated method stub
		mapper.deleteReboard(num);
	}

	@Override
	public void updateLikes(int num) {
		// TODO Auto-generated method stub
		mapper.updateLikes(num);
	}

}
