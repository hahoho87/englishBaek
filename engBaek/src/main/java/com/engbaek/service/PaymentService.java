package com.engbaek.service;

import java.util.List;

import com.engbaek.domain.Criteria;
import com.engbaek.domain.PaymentVO;

public interface PaymentService {
	//결제 내역 총 게시물 수 
	public int getTotal(Criteria cri);
	
	//결제 내역 목록
	public List<PaymentVO> getList(Criteria cri);
	
	//결제 내역 게시물 등록 
	public void register(PaymentVO payment);
	
	//결제 내역 게시물 상세 보기 
	public PaymentVO get(Long payment_bno);
	
	//결제 내역 게시물 수정
	public boolean modify(PaymentVO faq);
	
	//결제 내역 게시물 삭제 
	public boolean remove(Long payment_bno);
}