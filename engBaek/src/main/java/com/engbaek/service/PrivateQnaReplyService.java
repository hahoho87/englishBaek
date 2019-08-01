package com.engbaek.service;

import com.engbaek.domain.PrivateQnaReplyVO;

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
