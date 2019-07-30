package com.engbaek.service;

import java.util.List;

import com.engbaek.domain.ClassroomVO;
import com.engbaek.domain.Criteria;

public class ClassroomServiceImpl implements ClassroomService {
	//강의실 게시판 총 게시물 수 
	@Override
	public int getTotal(Criteria cri) {
		return 0;
	}
	//강의실 목록 조회 
	@Override
	public List<ClassroomVO> getList(Criteria cri) {
		return null;
	}

}
