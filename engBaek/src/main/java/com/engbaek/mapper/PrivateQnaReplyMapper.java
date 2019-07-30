package com.engbaek.mapper;

import java.util.List;

import com.engbaek.domain.Criteria;
import com.engbaek.domain.ProfileVO;

public interface PrivateQnaReplyMapper {
	// 강사소개 게시글 수
	public int getTotalCount(Criteria cri);

	// 강사소개 페이징
	public List<ProfileVO> getListWithPaging(Criteria cri);

	// 강사소개 수정
	public int update(ProfileVO profile);

	// 강사소개 삭제
	public int delete(Long profile_bno);

	// 강사소개 조회
	public ProfileVO read(Long profile_bno);

	// 강사소개 등록
	public Integer insertSelectKey(ProfileVO profile);

	// 공지사항 등록(without notice_bno)
	// public void insert(NoticeVO course);

	// 강사소개 목록
	public List<ProfileVO> getList();
}
