package com.engbaek.service;

import java.util.List;

import com.engbaek.domain.Criteria;
import com.engbaek.domain.PrivateQnaReplyVO;
import com.engbaek.domain.ReplyPageDTO;
import com.engbaek.domain.ReplyVO;

public interface PrivateQnaReplyService {
	
	public ReplyPageDTO getListPage(Criteria cri, Long privateQnaReply_bno);
	public int modify(PrivateQnaReplyVO privateQnaReply);
	public ReplyVO get(Long privateQnaReply_bno);
	public int remove(Long privateQnaReply_bno);
	public int register(PrivateQnaReplyVO privateQnaReply);
	public List<PrivateQnaReplyVO> getList(Criteria cri, Long bno);
	
}
