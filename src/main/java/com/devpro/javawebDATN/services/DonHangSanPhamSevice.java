package com.devpro.javawebDATN.services;

import org.springframework.stereotype.Service;

import com.devpro.javawebDATN.model.DonHangSanPham;

@Service
public class DonHangSanPhamSevice extends BaseService<DonHangSanPham>{

	@Override
	protected Class<DonHangSanPham> clazz() {
		// TODO Auto-generated method stub
		return DonHangSanPham.class;
	}

}
