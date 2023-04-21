package boot.data.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	@Override
	public String getName(String id) {
		return mapper.getName(id);
	}

	@Override
	public int loginIdPassCheck(String id, String pass) {
		
		Map<String, String> map=new HashMap<>();
		map.put("id", id);
		map.put("pass", pass);
		return mapper.loginIdPassCheck(map);
	}

	@Override
	public MemberDto getDataById(String id) {
		return mapper.getDataById(id);
	}

	@Override
	public void deleteMembers(String num) {
		mapper.deleteMembers(num);
	}

	@Override
	public void updatePhoto(String num, String photo) {
		
		Map<String, String> map=new HashMap<>();
		
		map.put("num", num);
		map.put("photo", photo);
		
		mapper.updatePhoto(map);
	}

	@Override
	public void updateMember(MemberDto dto) {

		mapper.updateMember(dto);
	}
	
}
