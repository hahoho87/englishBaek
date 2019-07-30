package com.engbaek.service;

import java.util.List;

import com.engbaek.domain.Criteria;
import com.engbaek.domain.ReplyPageDTO;
import com.engbaek.domain.ReplyVO;

public interface ReplyService {

	// 댓글 개수
	public ReplyPageDTO getListPage(Criteria cri, Long bno);

	// 댓글 수정
	public int modify(ReplyVO reply);

	// 댓글 조회
	public ReplyVO get(Long rno);

	// 댓글 삭제
	public int remove(Long rno);

	// 댓글 등록
	public int register(ReplyVO reply);

	// 댓글 목록
	public List<ReplyVO> getList(Criteria cri, Long bno);
}
