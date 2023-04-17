package boot.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import boot.data.BookDto;

@Mapper
public interface BookInterMapper {

	public int getTotalCount();
	public void insertData(BookDto dto);
	public List<BookDto> getAllDatas();
}
