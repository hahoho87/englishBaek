package com.engbaek.mapper;

import java.util.List;

import com.engbaek.domain.ClassDataVO;
import com.engbaek.domain.ClassQnaVO;
import com.engbaek.domain.Criteria;

public interface ClassServiceMapper {

		//수업자료&공지 총 게시물 수  
		public int getTotalCount(Criteria cri);
		
		//수업자료&공지 게시판 페이징 
		public List<ClassDataVO> getListWithPaging(Criteria cri);
		
		//수업자료&공지 수정 
		public int update(ClassDataVO class_);
		
		//수업자료&공지 삭제 
		public int delete(Long class_bno);
		
		//수업자료&공지 읽기 
		public ClassQnaVO read(Long class_bno);
		
		//게시물 번호 사용자에게 보이게 하기 
		public Integer insertSelectKey(ClassDataVO class_);
}
