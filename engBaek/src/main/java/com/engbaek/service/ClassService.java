package com.engbaek.service;


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

}
