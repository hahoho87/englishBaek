package com.engbaek.service;

import java.util.List;

import com.engbaek.domain.Criteria;
import com.engbaek.domain.ProfileVO;


public interface ProfileService {


	public int getTotal(Criteria cri);
	public List<ProfileVO> getList(Criteria cri);
	public void register(ProfileVO  profile);
	public ProfileVO get(Long teacherPno);
	public boolean modify(ProfileVO  profile);
	public boolean remove(Long teacherPno);
}
