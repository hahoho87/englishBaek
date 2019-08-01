package com.engbaek.service;

import java.util.List;

import com.engbaek.domain.Criteria;
import com.engbaek.domain.ProfileVO;

public class ProfileServiceImpl implements ProfileService{

	@Override
	public int getTotal(Criteria cri) {
		return 0;
	}

	@Override
	public List<ProfileVO> getList(Criteria cri) {
		return null;
	}

	@Override
	public void register(ProfileVO profile) {
		
	}

	@Override
	public ProfileVO get(Long teacherPno) {
		return null;
	}

	@Override
	public boolean modify(ProfileVO profile) {
		return false;
	}

	@Override
	public boolean remove(Long teacherPno) {
		return false;
	}

}
