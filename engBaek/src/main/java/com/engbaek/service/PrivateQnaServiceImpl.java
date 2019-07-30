package com.engbaek.service;

import java.util.List;

import com.engbaek.domain.Criteria;
import com.engbaek.domain.PrivateQnaVO;

public class PrivateQnaServiceImpl implements PrivateQnaService {

	@Override
	public int getTotal(Criteria cri) {
		return 0;
	}

	@Override
	public List<PrivateQnaVO> getList(Criteria cri) {
		return null;
	}

	@Override
	public void register(PrivateQnaVO privateQna) {
		
	}

	@Override
	public PrivateQnaVO get(Long privateQna_bno) {
		return null;
	}

	@Override
	public boolean modify(PrivateQnaVO privateQna) {
		return false;
	}

	@Override
	public boolean remove(Long privateQna_bno) {
		return false;
	}

}
