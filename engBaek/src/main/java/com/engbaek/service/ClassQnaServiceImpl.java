package com.engbaek.service;

<<<<<<< HEAD
public class ClassQnaServiceImpl implements ClassQnaService{

=======
import java.util.List;

import com.engbaek.domain.ClassQnaVO;
import com.engbaek.domain.Criteria;

public class ClassQnaServiceImpl implements ClassQnaService{

	@Override
	public int getTotal(Criteria cri) {
		return 0;
	}

	@Override
	public List<ClassQnaVO> getList(Criteria cri) {
		return null;
	}

	@Override
	public void register(ClassQnaVO classQna) {
		
	}

	@Override
	public ClassQnaVO get(Long classQna_bno) {
		return null;
	}

	@Override
	public boolean modify(ClassQnaVO classQna) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean remove(Long classQna_bno) {
		// TODO Auto-generated method stub
		return false;
	}

>>>>>>> 8f2273a6ce174c03eb18e67946a70aca9a04ed11
}
