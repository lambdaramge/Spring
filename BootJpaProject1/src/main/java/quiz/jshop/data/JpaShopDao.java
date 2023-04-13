package quiz.jshop.data;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class JpaShopDao {

	@Autowired
	JpaShopInter inter;
	
	//insert
	public void insertData(JpaShopDto dto) {
		inter.save(dto);
	}
	
	//select
	public List<JpaShopDto> getAllDatas(){
		return inter.findAll();
	}
	
	//getdata
	public JpaShopDto getData(int num) {
		return inter.getReferenceById(num);
	}
	
	//update
	public void updateData(JpaShopDto dto) {
		inter.save(dto);
	}
	
	//delete
	public void deleteData(int num) {
		inter.deleteById(num);
	}
}
