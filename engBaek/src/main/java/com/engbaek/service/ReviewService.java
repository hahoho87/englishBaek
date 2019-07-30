package com.engbaek.service;

import java.util.List;

import com.engbaek.domain.Criteria;
import com.engbaek.domain.ReviewVO;

public interface ReviewService {

	
	public int getTotal(Criteria cri);
	public List<ReviewVO> getList(Criteria cri);
	public void register(ReviewVO notice);
	public ReviewVO get(Long bno);
	public boolean modify(ReviewVO review);
	public boolean remove(Long review_bno);
}
