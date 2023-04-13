package quiz.jshop.data;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

import lombok.Data;

@Entity
@Table(name = "jpashop")
@Data
public class JpaShopDto {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int num;
	@Column
	private String sangpum;
	@Column
	private int price;
	@Column
	private String photo;
	@Column
	private String ipgoday;
	@Column(updatable = false)
	@CreationTimestamp
	private Timestamp writeday;
}
