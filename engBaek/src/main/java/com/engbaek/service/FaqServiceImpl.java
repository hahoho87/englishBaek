package com.engbaek.service;

import java.util.List;

import com.engbaek.domain.Criteria;
import com.engbaek.domain.FaqVO;

public class FaqServiceImpl implements FaqService {
	
	//FAQ 게시판 총 게시물 수 
	@Override
	public int getTotal(Criteria cri) {
		return 0;
	}
	
	//FAQ 게시판 목록
	@Override
	public List<FaqVO> getList(Criteria cri) {
		return null;
	}

	//FAQ 게시물 등록 
	@Override
	public void register(FaqVO faq) {
		
	}

	//FAQ 게시물 상세 보기 
	@Override
	public FaqVO get(Long faq_bno) {
		return null;
	}

	//FAQ 게시물 수정 
	@Override
	public boolean modify(FaqVO faq) {
		return false;
	}

	//FAQ 게시물 삭제 
	@Override
	public boolean remove(Long faq_bno) {
		return false;
	}

}
