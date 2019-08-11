package com.engbaek.mapper;

import java.util.List;

import com.engbaek.domain.ProfileAttachVO;
import com.engbaek.domain.ProfileVO;

public interface ProfileAttachMapper {
	
	public void insert(ProfileVO profile);
	public void delete(String teacherProfileUuid);
	public List<ProfileAttachVO> findByTeacherPno(Long teacherPno);
	public void deleteAll(Long teacherPno);
	public List<ProfileAttachVO> getOldFIles();

}
