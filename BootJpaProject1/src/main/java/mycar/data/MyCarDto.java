package mycar.data;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

import lombok.Data;

@Entity //dto에 대해 테이블 생성
@Table(name = "mycar") //테이블명 ...변수변경시 자동수정됨
@Data
public class MyCarDto {
	
	//jpa는 아래 두개 기본 !!
	@Id //num에 각 엔티티를 구별하는 식별자인 sequence(id)갖도록 설계
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long num;
	
	@Column(name = "carname") //지정해도 되지만 이름 같으면 생략 가능
	private String carname;
	@Column
	private int carprice;
	@Column
	private String carcolor;
	@Column
	private String carguip;
	
	@CreationTimestamp //now(). 엔티티 생성되는 시점을 자동 등록
	@Column(updatable = false) //수정시 이 컬럼은 수정하지 않는다
	private Timestamp guipday;
	
}
