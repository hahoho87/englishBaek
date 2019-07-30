package com.engbaek.service;

import java.util.List;

import com.engbaek.domain.CourseVO;
import com.engbaek.domain.Criteria;
import com.engbaek.domain.ImageAttachVO;

public class CourseServiceImpl implements CourseService {

	//게시물 개수 
	@Override
	public int getTotal(Criteria cri) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<CourseVO> getList(Criteria cri) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void register(CourseVO course) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public CourseVO get(Long course_bno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean modify(CourseVO course) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean remove(Long course_bno) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<ImageAttachVO> getAttachList(Long bno) {
		// TODO Auto-generated method stub
		return null;
	}

}
