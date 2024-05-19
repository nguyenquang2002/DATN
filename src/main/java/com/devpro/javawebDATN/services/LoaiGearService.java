package com.devpro.javawebDATN.services;

import org.springframework.stereotype.Service;

import com.devpro.javawebDATN.model.LoaiGear;

@Service
public class LoaiGearService extends BaseService<LoaiGear>{

	@Override
	protected Class<LoaiGear> clazz() {
		// TODO Auto-generated method stub
		return LoaiGear.class;
	}

}
