package com.engbaek.service;

import java.util.List;

import com.engbaek.domain.ClassroomVO;
import com.engbaek.domain.Criteria;

public interface ClassroomService {
	public int getTotal(Criteria cri);
	public List<ClassroomVO> getList(Criteria cri);
}
