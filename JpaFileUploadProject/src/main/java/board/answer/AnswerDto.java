package board.answer;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

import board.data.BoardDto;
import lombok.Data;

@Entity
@Data
@Table(name = "janswer")
public class AnswerDto {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long idx;
	@ManyToOne
    @JoinColumn(name="jboard_num", referencedColumnName = "num")
	private BoardDto boardDto;
	@Column
	private String writer;
	@Column
	private String content;
	@Column(updatable = false)
	@CreationTimestamp
	private Timestamp writeday;
}
