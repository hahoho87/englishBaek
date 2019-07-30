package com.engbaek.service;

import java.util.List;

import com.engbaek.domain.CourseVO;
import com.engbaek.domain.Criteria;
import com.engbaek.domain.ImageAttachVO;

public class CourseServiceImpl implements CourseService {
	
	//강좌 소개 총 게시물 수
	@Override
	public int getTotal(Criteria cri) {
		return 0;
	}
	
	//강좌 소개 목록
	@Override
	public List<CourseVO> getList(Criteria cri) {
		return null;
	}
	
	//강좌 소개 등록
	@Override
	public void register(CourseVO course) {
		
	}
	
	//강좌 소개 게시물 상세 보기 
	@Override
	public CourseVO get(Long course_bno) {
		return null;
	}
	
	//강좌 소개 게시물 수정
	@Override
	public boolean modify(CourseVO course) {
		return false;
	}

	//강좌 소개 게시물 삭제 
	@Override
	public boolean remove(Long course_bno) {
		return false;
	}
	
	//강좌 소개 이미지 파일 목록 
	@Override
	public List<ImageAttachVO> getAttachList(Long bno) {
		return null;
	}

}
