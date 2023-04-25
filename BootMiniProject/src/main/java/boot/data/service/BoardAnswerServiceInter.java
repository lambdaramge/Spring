package boot.data.service;

import java.util.List;

import boot.data.dto.BoardAnswerDto;

public interface BoardAnswerServiceInter {

	public void insertAnswer(BoardAnswerDto dto);
	public List<BoardAnswerDto> getAllAnswers(String num);
	public BoardAnswerDto getData(String idx);
	public void updateAnswer(BoardAnswerDto dto);
	public void deleteAnswer(String idx);
}
