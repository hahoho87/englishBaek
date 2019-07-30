package com.engbaek.service;

import java.util.List;

import com.engbaek.domain.ClassQnaVO;
import com.engbaek.domain.Criteria;

public class ClassQnaServiceImpl implements ClassQnaService{

	
	//강의별 Q&A 총 게시물 수 
	@Override
	public int getTotal(Criteria cri) {
		return 0;
	}

	//강의별 Q&A 목록 
	@Override	
	public List<ClassQnaVO> getList(Criteria cri) {
		return null;
	}

	//강의별 Q&A 등록 
	@Override
	public void register(ClassQnaVO classQna) {
		
	}
	//강의별 Q&A 상세조회 
	@Override
	public ClassQnaVO get(Long classQna_bno) {
		return null;
	}
	//강의별 Q&A 수정 
	@Override
	public boolean modify(ClassQnaVO classQna) {
		return false;
	}
	//강의별 Q&A 삭제 
	@Override
	public boolean remove(Long classQna_bno) {
		return false;
	}

}
