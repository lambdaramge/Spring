package board.data;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDao {

	@Autowired
	BoardDaoInter daoInter;
	
	//insert
	public void insertBoard(BoardDto dto) {
		
		daoInter.save(dto);
	}
	
	//list
	public List<BoardDto> getAllDatas(){
		
		//return daoInter.findAll();
		
		//desc정렬
		return daoInter.findAll(Sort.by(Sort.Direction.DESC,"num"));
	}
	
	//detail
	public BoardDto getData(Long num) {
		return daoInter.getReferenceById(num);
	}
	
	//update
	public void updateData(BoardDto dto) {
		daoInter.save(dto);
	}
	
	//delete
	public void deleteData(Long num) {
		daoInter.deleteById(num);
	}
}
