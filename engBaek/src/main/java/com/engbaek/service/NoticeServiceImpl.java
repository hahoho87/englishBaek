package com.engbaek.service;

import java.util.List;

import com.engbaek.domain.Criteria;
import com.engbaek.domain.NoticeVO;

public class NoticeServiceImpl implements NoticeService {

	//공지사항 총 게시물 수 
	@Override
	public int getTotal(Criteria cri) {
		return 0;
	}

	//공지사항 게시판 목록
	@Override
	public List<NoticeVO> getList(Criteria cri) {
		return null;
	}
	
	//공지사항 게시물 등록 
	@Override
	public void register(NoticeVO notice) {
		
	}

	//공지사항 게시물 상세보기 
	@Override
	public NoticeVO get(Long notice_bno) {
		return null;
	}

	//공지사항 게시물 수정
	@Override
	public boolean modify(NoticeVO notice) {
		return false;
	}

	//공지사항 게시물 삭제 
	@Override
	public boolean remove(Long notice_bno) {
		return false;
	}

}
