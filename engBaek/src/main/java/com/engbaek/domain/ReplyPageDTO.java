package com.engbaek.domain;

import java.util.List;

import com.engbaek.domain.ReplyVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@AllArgsConstructor
@Getter
public class ReplyPageDTO {
	private int replyCnt;		//전체 댓글 갯수
	private List<ReplyVO> list;	//댓글 목록
}
