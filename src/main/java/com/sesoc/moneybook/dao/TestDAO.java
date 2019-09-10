package com.sesoc.moneybook.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sesoc.moneybook.vo.MemberVO;
import com.sesoc.moneybook.vo.MoneybookVO;


@Repository
public class TestDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int insertMember(MemberVO member) {
		TestMapper mapper = sqlSession.getMapper(TestMapper.class);
		int result =0; 
		try {
		result = mapper.insertmember(member);
		}catch(Exception e){
			e.printStackTrace();
		}
		return result; 
	}
	
	public MemberVO select(MemberVO member) {
		TestMapper mapper =sqlSession.getMapper(TestMapper.class);
		MemberVO result = mapper.loginmember(member);
		return result;
	}

	public List<MoneybookVO> selectAll(MoneybookVO moneybook) {
		TestMapper mapper =sqlSession.getMapper(TestMapper.class);
		List<MoneybookVO> result = mapper.selectAll(moneybook); 
		return result;
	}
	
	public int insertmoneybook(MoneybookVO moneybook) {
		TestMapper mapper =sqlSession.getMapper(TestMapper.class);
		int result = mapper.insertmoneybook(moneybook); 
		return result; 
	}
	
	public int deletebook(int infonum) {
		TestMapper mapper =sqlSession.getMapper(TestMapper.class);
		int result = mapper.deletemoneybook(infonum);
		return result; 
	}
}
