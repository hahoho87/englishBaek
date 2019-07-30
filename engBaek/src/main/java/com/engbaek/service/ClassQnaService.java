package com.engbaek.service;

import java.util.List;

import com.engbaek.domain.ClassQnaVO;
import com.engbaek.domain.Criteria;

public interface ClassQnaService {
	public int getTotal(Criteria cri);
	public List<ClassQnaVO> getList(Criteria cri);
	public void register(ClassQnaVO classQna);
	public ClassQnaVO get(Long classQna_bno);
	public boolean modify(ClassQnaVO classQna);
	public boolean remove(Long classQna_bno);
}
