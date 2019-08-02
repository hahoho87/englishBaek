package com.engbaek.service;

import java.util.List;

import com.engbaek.domain.Criteria;
import com.engbaek.domain.PaymentVO;

public class PaymentServiceImpl implements PaymentService{
	//결제 내역 총 게시물 수 
	@Override
	public int getTotal(Criteria cri) {
		return 0;
	}
	//결제 내역 목록
	@Override
	public List<PaymentVO> getList(Criteria cri) {
		return null;
	}
	//결제 내역 게시물 등록 
	@Override
	public void register(PaymentVO payment) {
		
	}
	//결제 내역 게시물 상세 보기
	@Override
	public PaymentVO get(Long payment_bno) {
		return null;
	}
	//결제 내역 게시물 수정
	@Override
	public boolean modify(PaymentVO notice) {
		return false;
	}
	//결제 내역 게시물 삭제
	@Override
	public boolean remove(Long payment_bno) {
		return false;
	}

}
