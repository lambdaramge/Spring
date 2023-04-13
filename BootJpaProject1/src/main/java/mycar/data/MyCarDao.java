package mycar.data;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyCarDao {

	@Autowired
	MyCarDaoInter carInter;
	
	//insert
	public void insertCar(MyCarDto dto) {
		carInter.save(dto); //id유무에 따라 자동으로 insert or update
	}
	
	//전체출력
	public List<MyCarDto> getList(){
		return carInter.findAll();
	}
	
	//delete
	public void deleteCar(long num) {
		carInter.deleteById(num);
	}
	
	//getdata
	public MyCarDto getData(long num) {
		return carInter.getReferenceById(num);
	}
	
	//update
	public void updateCar(MyCarDto dto) {
		carInter.save(dto);
	}
}
