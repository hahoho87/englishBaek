package com.engbaek.service;

import java.util.List;

import com.engbaek.domain.Criteria;
import com.engbaek.domain.FaqVO;

public class FaqServiceImpl implements FaqService {

	@Override
	public int getTotal(Criteria cri) {
		return 0;
	}

	@Override
	public List<FaqVO> getList(Criteria cri) {
		return null;
	}

	@Override
	public void register(FaqVO faq) {
		
	}

	@Override
	public FaqVO get(Long faq_bno) {
		return null;
	}

	@Override
	public boolean modify(FaqVO faq) {
		return false;
	}

	@Override
	public boolean remove(Long faq_bno) {
		return false;
	}

}
