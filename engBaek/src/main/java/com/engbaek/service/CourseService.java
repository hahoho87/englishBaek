package com.engbaek.service;

<<<<<<< HEAD
public interface CourseService {

}
=======
import java.util.List;

import com.engbaek.domain.CourseVO;
import com.engbaek.domain.Criteria;
import com.engbaek.domain.ImageAttachVO;

public interface CourseService {
	public int getTotal(Criteria cri);
//	public List<BoardVO> getList();
	public List<CourseVO> getList(Criteria cri);
	public void register(CourseVO course);
	public CourseVO get(Long course_bno);
	public boolean modify(CourseVO course);
	public boolean remove(Long course_bno);
	
	public List<ImageAttachVO> getAttachList(Long bno);
}
>>>>>>> 8f2273a6ce174c03eb18e67946a70aca9a04ed11
