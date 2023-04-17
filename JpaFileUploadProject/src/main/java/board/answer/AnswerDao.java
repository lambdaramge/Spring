package board.answer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import board.data.BoardDto;

@Repository
public class AnswerDao {

	@Autowired
	AnswerDaoInter daoInter;
	
	public void insertAnswer(AnswerDto adto) {
		
		daoInter.save(adto);
	}
}
