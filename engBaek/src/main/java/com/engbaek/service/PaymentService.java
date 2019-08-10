package com.engbaek.service;

import java.util.List;

import com.engbaek.domain.Criteria;
import com.engbaek.domain.PaymentVO;
import com.engbaek.domain.PrivateQnaReplyVO;

public interface PaymentService {
	
	//결제 내역 목록
	public List<PaymentVO> getList();
	
	//결제 내역 게시물 등록 
	public void register(PaymentVO payment);
	
	//결제 내역 게시물 상세 보기 
	public PaymentVO read(Long paymentNo);
	

	public boolean modify(PaymentVO paymentNo);
	
	//결제 내역 게시물 삭제 
	public boolean remove(Long paymentNo);
}