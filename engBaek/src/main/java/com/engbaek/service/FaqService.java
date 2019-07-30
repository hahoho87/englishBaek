package com.engbaek.service;

import java.util.List;

import com.engbaek.domain.Criteria;
import com.engbaek.domain.FaqVO;

public interface FaqService {
	
	public int getTotal(Criteria cri);
	public List<FaqVO> getList(Criteria cri);
	public void register(FaqVO faq);
	public FaqVO get(Long faq_bno);
	public boolean modify(FaqVO faq);
	public boolean remove(Long faq_bno);

}
