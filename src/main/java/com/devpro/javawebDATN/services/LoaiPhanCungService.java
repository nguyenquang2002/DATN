package com.devpro.javawebDATN.services;

import org.springframework.stereotype.Service;

import com.devpro.javawebDATN.model.LoaiPhanCung;

@Service
public class LoaiPhanCungService extends BaseService<LoaiPhanCung>{

	@Override
	protected Class<LoaiPhanCung> clazz() {
		// TODO Auto-generated method stub
		return LoaiPhanCung.class;
	}
	
}
