package com.engbaek.service;

import java.util.List;

import com.engbaek.domain.Criteria;
import com.engbaek.domain.ReviewVO;

public class ReviewServiceImpl implements ReviewService {

	// 수강 후기 게시물 개수
	@Override
	public int getTotal(Criteria cri) {
		return 0;
	}
	
	// 수강 후기 목록
	@Override
	public List<ReviewVO> getList(Criteria cri) {
		return null;
	}
	
	// 수강 후기 등록
	@Override
	public void register(ReviewVO notice) {

	}

	// 수강 후기 조회
	@Override
	public ReviewVO get(Long bno) {
		return null;
	}

	// 수강 후기 수정
	@Override
	public boolean modify(ReviewVO review) {
		return false;
	}

	// 수강 후기 삭제
	@Override
	public boolean remove(Long notice_bno) {
		return false;
	}

}
