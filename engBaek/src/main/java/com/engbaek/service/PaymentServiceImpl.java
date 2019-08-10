package com.engbaek.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.engbaek.domain.Criteria;
import com.engbaek.domain.PaymentVO;
import com.engbaek.mapper.PaymentMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class PaymentServiceImpl implements PaymentService{

	@Setter(onMethod_ = @Autowired)
	private PaymentMapper mapper;
	
	//결제 내역 총 게시물 수 

	//결제 내역 목록
	@Override
	public List<PaymentVO> getList() {
		log.info("getList");
		
		return mapper.getList();
	}
	//결제 내역 게시물 등록 
	@Override
	public void register(PaymentVO payment) {
		
		mapper.insertSelectKey(payment);
	}
	//결제 내역 게시물 상세 보기
	@Override
	public PaymentVO read(Long paymentNo) {
		return mapper.read(paymentNo);
	}
	
	//결제 내역 게시물 삭제
	@Override
	public boolean remove(Long paymentNo) {
		log.info("remove : " +paymentNo);
		boolean removeResult = mapper.delete(paymentNo) == 1;
		return removeResult;
	}
	@Override
	public boolean modify(PaymentVO payment) {
		
		log.info("modify : " + payment);
		boolean modifyResult = mapper.update(payment) == 1;
		return modifyResult;
	}

}
