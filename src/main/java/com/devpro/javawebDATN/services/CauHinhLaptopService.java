package com.devpro.javawebDATN.services;

import org.springframework.stereotype.Service;

import com.devpro.javawebDATN.model.CauHinhLaptop;

@Service
public class CauHinhLaptopService extends BaseService<CauHinhLaptop>{

	@Override
	protected Class<CauHinhLaptop> clazz() {
		// TODO Auto-generated method stub
		return CauHinhLaptop.class;
	}

}
