package com.devpro.javawebDATN.services;

import org.springframework.stereotype.Service;

import com.devpro.javawebDATN.model.ChucVu;

@Service
public class ChucVuService extends BaseService<ChucVu>{

	@Override
	protected Class<ChucVu> clazz() {
		// TODO Auto-generated method stub
		return ChucVu.class;
	}

}
