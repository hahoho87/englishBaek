package com.engbaek.service;

import java.util.List;

import com.engbaek.domain.Criteria;
import com.engbaek.domain.ReplyPageDTO;
import com.engbaek.domain.ReplyVO;

public interface ReplyService {

	public ReplyPageDTO getListPage(Criteria cri, Long bno);
	public int modify(ReplyVO reply);
	public ReplyVO get(Long rno);
	public int remove(Long rno);
	public int register(ReplyVO reply);
	public List<ReplyVO> getList(Criteria cri, Long bno);
}
