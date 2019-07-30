package com.engbaek.service;

<<<<<<< HEAD
public class ClassServiceImpl {
=======
import java.util.List;

import com.engbaek.domain.ClassAttachVO;
import com.engbaek.domain.ClassVO;
import com.engbaek.domain.Criteria;

public class ClassServiceImpl implements ClassService{

	@Override
	public int getTotal(Criteria cri) {
		return 0;
	}

	@Override
	public List<ClassVO> getList(Criteria cri) {
		return null;
	}

	@Override
	public void register(ClassVO class_) {
		
	}

	@Override
	public ClassVO get(Long class_bno) {
		return null;
	}

	@Override
	public boolean modify(ClassVO class_) {
		return false;
	}

	@Override
	public boolean remove(Long class_bno) {
		return false;
	}

	@Override
	public List<ClassAttachVO> getAttachList(Long bno) {
		return null;
	}
>>>>>>> 8f2273a6ce174c03eb18e67946a70aca9a04ed11

}
