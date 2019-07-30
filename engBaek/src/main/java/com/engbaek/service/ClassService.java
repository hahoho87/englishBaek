package com.engbaek.service;

import java.util.List;

import com.engbaek.domain.ClassAttachVO;
import com.engbaek.domain.ClassVO;
import com.engbaek.domain.Criteria;

public interface ClassService {
	
	   //수업자료&공지  총 게시물 수 
	   public int getTotal(Criteria cri);
	   
	   //수업자료&공지 게시판 목록
	   public List<ClassVO> getList(Criteria cri);
	   
	   //수업자료&공지 게시물 등록 
	   public void register(ClassVO class_);
	   
	   //수업자료&공지 게시물 상세 정보 
	   public ClassVO get(Long class_bno);
	   
	   //수업자료&공지 게시물 수정
	   public boolean modify(ClassVO class_);
	   
	   //수업자료&공지 게시물 삭제
	   public boolean remove(Long class_bno);
	   
	   //수업자료&공지 첨부파일 목록 
	   public List<ClassAttachVO> getAttachList(Long class_bno);
}
