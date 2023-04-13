package mycar.data;

import org.springframework.data.jpa.repository.JpaRepository;

public interface MyCarDaoInter extends JpaRepository<MyCarDto, Long>{ // <dto명, num의 자료형타입(long)>

}
