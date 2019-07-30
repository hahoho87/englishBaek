package com.engbaek.service;

<<<<<<< HEAD
public interface ClassroomService {

=======
import java.util.List;

import com.engbaek.domain.ClassroomVO;
import com.engbaek.domain.Criteria;

public interface ClassroomService {
	
	public int getTotal(Criteria cri);
	public List<ClassroomVO> getList(Criteria cri);
	
>>>>>>> 8f2273a6ce174c03eb18e67946a70aca9a04ed11
}
