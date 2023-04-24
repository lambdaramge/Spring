package boot.data.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.data.dto.BoardDto;
import boot.data.mapper.BoardMapperInter;

@Service
public class BoardService implements BoardServiceInter{

	@Autowired
	BoardMapperInter inter;
	
	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return inter.getTotalCount();
	}

	@Override
	public void updatereadcount(String num) {
		// TODO Auto-generated method stub
		inter.updatereadcount(num);
		
	}

	@Override
	public BoardDto getData(String num) {
		// TODO Auto-generated method stub
		return inter.getData(num);
	}

	@Override
	public int getMaxNum() {
		// TODO Auto-generated method stub
		return inter.getMaxNum();
	}

	@Override
	public List<BoardDto> getList(int start, int perpage) {
		// TODO Auto-generated method stub
		
		HashMap<String, Integer> map=new HashMap<>();
		
		map.put("start", start);
		map.put("perpage", perpage);
		
		return inter.getList(map);
	}

	@Override
	public void insertBoard(BoardDto dto) {
		// TODO Auto-generated method stub
		inter.insertBoard(dto);
	}

}
