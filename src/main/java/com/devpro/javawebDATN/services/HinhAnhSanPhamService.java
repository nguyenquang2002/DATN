package com.devpro.javawebDATN.services;

import org.springframework.stereotype.Service;

import com.devpro.javawebDATN.model.HinhAnhSanPham;

@Service
public class HinhAnhSanPhamService extends BaseService<HinhAnhSanPham>{

	@Override
	protected Class<HinhAnhSanPham> clazz() {
		// TODO Auto-generated method stub
		return HinhAnhSanPham.class;
	}

}
