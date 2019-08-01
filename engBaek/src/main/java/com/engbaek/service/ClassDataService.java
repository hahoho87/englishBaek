package com.engbaek.service;

import java.util.List;

import com.engbaek.domain.ClassDataAttachVO;
import com.engbaek.domain.ClassDataVO;
import com.engbaek.domain.Criteria;

public interface ClassDataService {
	
	   //수업자료&공지  총 게시물 수 
	   public int getTotal(Criteria cri);
	   
	   //수업자료&공지 게시판 목록
	   public List<ClassDataVO> getList(Criteria cri);
	   
	   //수업자료&공지 게시물 등록 
	   public void register(ClassDataVO class_);
	   
	   //수업자료&공지 게시물 상세 정보 
	   public ClassDataVO get(Long class_bno);
	   
	   //수업자료&공지 게시물 수정
	   public boolean modify(ClassDataVO class_);
	   
	   //수업자료&공지 게시물 삭제
	   public boolean remove(Long class_bno);
	   
	   //수업자료&공지 첨부파일 목록 
	   public List<ClassDataAttachVO> getAttachList(Long class_bno);
}
