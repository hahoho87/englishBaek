package com.engbaek.service;

import java.util.List;

import com.engbaek.domain.CourseVO;
import com.engbaek.domain.Criteria;
import com.engbaek.domain.ImageAttachVO;

public interface CourseService {
	//강좌 소개 총 게시물 수 
	public int getTotal(Criteria cri);

	//강좌 소개 목록
	public List<CourseVO> getList(Criteria cri);

	//강좌 소개 등록
	public void register(CourseVO course);
	
	//강좌 소개 게시물 상세 보기 
	public CourseVO get(Long course_bno);

	//강좌 소개 게시물 수정
	public boolean modify(CourseVO course);

	//강좌 소개 게시물 삭제 
	public boolean remove(Long course_bno);

	//강좌 소개 이미지 파일 목록 
	public List<ImageAttachVO> getAttachList(Long bno);
}
