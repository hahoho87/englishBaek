package com.engbaek.service;


import java.util.List;

import com.engbaek.domain.Criteria;
import com.engbaek.domain.PrivateQnaVO;

public interface PrivateQnaService{
	public int getTotal(Criteria cri);
	public List<PrivateQnaVO> getList(Criteria cri);
	public void register(PrivateQnaVO privateQna);
	public PrivateQnaVO get(Long privateQna_bno);
	public boolean modify(PrivateQnaVO privateQna);
	public boolean remove(Long privateQna_bno);

}
