package com.engbaek.service;

import java.util.List;

import com.engbaek.domain.Criteria;
import com.engbaek.domain.NoticeVO;

public class NoticeServiceImpl implements NoticeService {

	@Override
	public int getTotal(Criteria cri) {
		return 0;
	}

	@Override
	public List<NoticeVO> getList(Criteria cri) {
		return null;
	}

	@Override
	public void register(NoticeVO notice) {
		
	}

	@Override
	public NoticeVO get(Long notice_bno) {
		return null;
	}

	@Override
	public boolean modify(NoticeVO notice) {
		return false;
	}

	@Override
	public boolean remove(Long notice_bno) {
		return false;
	}

}
