package com.engbaek.service;

<<<<<<< HEAD
public interface PaymentService {

=======
import java.util.List;

import com.engbaek.domain.Criteria;
import com.engbaek.domain.PaymentVO;

public interface PaymentService {
	public int getTotal(Criteria cri);
	public List<PaymentVO> getList(Criteria cri);
	public void register(PaymentVO payment);
	public PaymentVO get(Long payment_bno);
	public boolean modify(PaymentVO faq);
	public boolean remove(Long payment_bno);
>>>>>>> 8f2273a6ce174c03eb18e67946a70aca9a04ed11
}
