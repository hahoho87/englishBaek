package com.engbaek.service;

<<<<<<< HEAD
public interface ClassQnaService {

=======
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
>>>>>>> 8f2273a6ce174c03eb18e67946a70aca9a04ed11
}
