package com.engbaek.service;

import java.util.List;

import com.engbaek.domain.Criteria;
import com.engbaek.domain.ReplyPageDTO;
import com.engbaek.domain.ReplyVO;

public class ReplyServiceImpl implements ReplyService{

	// 댓글 개수
	@Override
	public ReplyPageDTO getListPage(Criteria cri, Long bno) {
		return null;
	}

	// 댓글 수정
	@Override
	public int modify(ReplyVO reply) {
		return 0;
	}

	// 댓글 조회
	@Override
	public ReplyVO get(Long rno) {
		return null;
	}

	// 댓글 삭제
	@Override
	public int remove(Long rno) {
		return 0;
	}

	// 댓글 등록
	@Override
	public int register(ReplyVO reply) {
		return 0;
	}

	// 댓글 목록
	@Override
	public List<ReplyVO> getList(Criteria cri, Long bno) {
		return null;
	}

}
