package com.engbaek.service;

<<<<<<< HEAD
public class PaymentServiceImpl implements PaymentService{

=======
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
	
>>>>>>> 8f2273a6ce174c03eb18e67946a70aca9a04ed11
}
