package boot.data.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;

import boot.data.dto.MemberDto;
import boot.data.mapper.MemberMapperInter;

@Service
public class MemberService implements MemberServiceInter {

	@Autowired
	MemberMapperInter mapper;
	@Autowired
	HttpSession session;

	@Override
	public List<MemberDto> getAllMembers() {
		return mapper.getAllMembers();
	}

	@Override
	public void insertMember(@ModelAttribute MemberDto dto) {
		
		mapper.insertMember(dto);
	}

	@Override
	public int getSearchId(String id) {
		 return mapper.getSearchId(id);
	}
	
}
