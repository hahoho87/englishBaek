package com.engbaek.service;


import java.util.List;

import com.engbaek.domain.Criteria;
import com.engbaek.domain.PaymentVO;


public class PaymentServiceImpl implements PaymentService{

	@Override
	public int getTotal(Criteria cri) {
		return 0;
	}

	@Override
	public List<PaymentVO> getList(Criteria cri) {
		return null;
	}

	@Override
	public void register(PaymentVO payment) {
		
	}

	@Override
	public PaymentVO get(Long payment_bno) {
		return null;
	}

	@Override
	public boolean modify(PaymentVO faq) {
		return false;
	}

	@Override
	public boolean remove(Long payment_bno) {
		return false;
	}
	

}
