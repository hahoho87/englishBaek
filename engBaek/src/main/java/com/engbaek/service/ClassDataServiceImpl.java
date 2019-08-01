package com.engbaek.service;

import java.util.List;

import com.engbaek.domain.ClassDataAttachVO;
import com.engbaek.domain.ClassDataVO;
import com.engbaek.domain.Criteria;

public class ClassDataServiceImpl implements ClassDataService{

	 //수업자료&공지  총 게시물 수 
	@Override
	public int getTotal(Criteria cri) {
		return 0;
	}
	//수업자료&공지 게시판 목록
	@Override
	public List<ClassDataVO> getList(Criteria cri) {
		return null;
	}
	 //수업자료&공지 게시물 등록 
	@Override	
	public void register(ClassDataVO class_) {
		
	}
	//수업자료&공지 게시물 상세 정보 
	@Override
	public ClassDataVO get(Long class_bno) {
		return null;
	}
	 //수업자료&공지 게시물 수정
	@Override
	public boolean modify(ClassDataVO class_) {
		return false;
	}
	//수업자료&공지 게시물 삭제
	@Override
	public boolean remove(Long class_bno) {
		return false;
	}
	//수업자료&공지 첨부파일 목록 
	@Override
	public List<ClassDataAttachVO> getAttachList(Long class_bno) {
		return null;
	}

}
