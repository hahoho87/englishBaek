package com.engbaek.service;

import java.util.List;

import com.engbaek.domain.Criteria;
import com.engbaek.domain.PrivateQnaReplyVO;
import com.engbaek.domain.ReplyPageDTO;
import com.engbaek.domain.ReplyVO;

public interface PrivateQnaReplyService {
	
	//1:1문의 답글 수정 
	public int modify(PrivateQnaReplyVO privateQnaReply);
	
	//1:1문의 답글 상세보기 
	public PrivateQnaReplyVO get(Long privateQnaReplyNo);
	
	//1:1문의 답글 삭제 
	public int remove(Long privateQnaReplyNo);
	
	//1:1문의 답글 등록 
	public int register(PrivateQnaReplyVO privateQnaReply);
	
}
