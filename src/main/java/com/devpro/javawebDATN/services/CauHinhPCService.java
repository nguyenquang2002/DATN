package com.devpro.javawebDATN.services;

import org.springframework.stereotype.Service;

import com.devpro.javawebDATN.model.CauHinhPC;

@Service
public class CauHinhPCService extends BaseService<CauHinhPC>{

	@Override
	protected Class<CauHinhPC> clazz() {
		// TODO Auto-generated method stub
		return CauHinhPC.class;
	}
	
}
