package boot.data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import boot.data.dto.BoardAnswerDto;

@Mapper
public interface BoardMapperAnswerInter {

	public void insertAnswer(BoardAnswerDto dto);
	public List<BoardAnswerDto> getAllAnswers(String num);
	public BoardAnswerDto getData(String idx);
	public void updateAnswer(BoardAnswerDto dto);
	public void deleteAnswer(String idx);
}
