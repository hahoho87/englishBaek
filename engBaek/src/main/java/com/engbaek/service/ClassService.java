package com.engbaek.service;

<<<<<<< HEAD
public interface ClassService {

=======
import java.util.List;

import com.engbaek.domain.ClassAttachVO;
import com.engbaek.domain.ClassVO;
import com.engbaek.domain.Criteria;

public interface ClassService {

	public int getTotal(Criteria cri);
	public List<ClassVO> getList(Criteria cri);
	public void register(ClassVO class_);
	public ClassVO get(Long class_bno);
	public boolean modify(ClassVO class_);
	public boolean remove(Long class_bno);
	
	public List<ClassAttachVO> getAttachList(Long bno);
>>>>>>> 8f2273a6ce174c03eb18e67946a70aca9a04ed11
}
