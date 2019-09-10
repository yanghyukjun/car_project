package com.sesoc.moneybook.dao;

import java.util.List;

import com.sesoc.moneybook.vo.MemberVO;
import com.sesoc.moneybook.vo.MoneybookVO;

public interface TestMapper {
	public int insertmember(MemberVO member);
	public MemberVO loginmember(MemberVO member);
	public List<MoneybookVO> selectAll(MoneybookVO moneybook);
	public int insertmoneybook(MoneybookVO moneybook); 
	public int deletemoneybook(int infonum);
}
