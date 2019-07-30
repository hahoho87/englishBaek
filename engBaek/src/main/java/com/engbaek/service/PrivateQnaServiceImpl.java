package com.engbaek.service;


import java.util.List;

import com.engbaek.domain.Criteria;
import com.engbaek.domain.PrivateQnaVO;

public class PrivateQnaServiceImpl implements PrivateQnaService {

	//1:1문의 총 게시물 수 
	@Override
	public int getTotal(Criteria cri) {
		return 0;
	}
	
	//1:1문의 게시판 목록
	@Override
	public List<PrivateQnaVO> getList(Criteria cri) {
		return null;
	}

	//1:1문의 게시물 등록 
	@Override
	public void register(PrivateQnaVO privateQna) {
		
	}
	
	//1:1문의 게시물 상세 보기 
	@Override
	public PrivateQnaVO get(Long privateQna_bno) {
		return null;
	}

	//1:1문의 게시물 수정
	@Override
	public boolean modify(PrivateQnaVO privateQna) {
		return false;
	}
	
	//1:1문의 게시물 삭제 
	@Override
	public boolean remove(Long privateQna_bno) {
		return false;
	}



}
