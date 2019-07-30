package com.engbaek.service;

import java.util.List;

import com.engbaek.domain.Criteria;
import com.engbaek.domain.RefundVO;

public interface RefundService {


	public int getTotal(Criteria cri);
	public List<RefundVO> getList(Criteria cri);
	public void register(RefundVO refund);
	public RefundVO get(Long bno);
	public boolean modify(RefundVO refund);
	public boolean remove(Long review_bno);
}
