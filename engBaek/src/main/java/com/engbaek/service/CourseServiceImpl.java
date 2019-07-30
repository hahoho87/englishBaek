package com.engbaek.service;

<<<<<<< HEAD
public class CourseServiceImpl {
=======
import java.util.List;

import com.engbaek.domain.CourseVO;
import com.engbaek.domain.Criteria;
import com.engbaek.domain.ImageAttachVO;

public class CourseServiceImpl implements CourseService {

	@Override
	public int getTotal(Criteria cri) {
		return 0;
	}

	@Override
	public List<CourseVO> getList(Criteria cri) {
		return null;
	}

	@Override
	public void register(CourseVO course) {
		
	}

	@Override
	public CourseVO get(Long course_bno) {
		return null;
	}

	@Override
	public boolean modify(CourseVO course) {
		return false;
	}

	@Override
	public boolean remove(Long course_bno) {
		return false;
	}

	@Override
	public List<ImageAttachVO> getAttachList(Long bno) {
		return null;
	}
>>>>>>> 8f2273a6ce174c03eb18e67946a70aca9a04ed11

}
