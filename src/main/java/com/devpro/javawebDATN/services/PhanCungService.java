package com.devpro.javawebDATN.services;

import java.io.IOException;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.javawebDATN.model.PhanCung;
import com.devpro.javawebDATN.model.SanPham;

@Service
public class PhanCungService extends BaseService<PhanCung>{
	
	@Autowired
	SanPhamService sanPhamService = new SanPhamService();

	@Override
	protected Class<PhanCung> clazz() {
		// TODO Auto-generated method stub
		return PhanCung.class;
	}
	
	public PhanCung findBySanPhamID(int spid) {
		return this.getEntityByNativeSQL("select * from phancung where sanpham_id = " + spid);
	}
	
	@Transactional
	public PhanCung add(PhanCung hard, MultipartFile spAvatar, MultipartFile[] spAnh) throws IllegalStateException,IOException{
		SanPham sp = new SanPham();
		sp.setTenSanPham(hard.getSanPham().getTenSanPham());
		sp.setGiaTien(hard.getSanPham().getGiaTien());
		sp.setGiamGia(hard.getSanPham().getGiamGia());
		sp.setSoLuong(hard.getSanPham().getSoLuong());
		sp.setLoaiSanPham(3);
		sp.setTrangThai(hard.getSanPham().getTrangThai());
		sp.setBrand(hard.getSanPham().getBrand());
		sp.setMoTa(hard.getSanPham().getMoTa());
		sanPhamService.add(sp,spAvatar,"hardware",spAnh);
		hard.setSanPham(sp);
		return super.saveOrUpdate(hard);
	}
	
	@Transactional
	public PhanCung update(PhanCung hard, MultipartFile spAvatar, MultipartFile[] spAnh) throws IllegalStateException,IOException{
		SanPham sp = sanPhamService.getById(hard.getSanPham().getId());
		sp.setTenSanPham(hard.getSanPham().getTenSanPham());
		sp.setGiaTien(hard.getSanPham().getGiaTien());
		sp.setGiamGia(hard.getSanPham().getGiamGia());
		sp.setSoLuong(hard.getSanPham().getSoLuong());
		sp.setLoaiSanPham(3);
		sp.setTrangThai(hard.getSanPham().getTrangThai());
		sp.setBrand(hard.getSanPham().getBrand());
		sp.setMoTa(hard.getSanPham().getMoTa());
		sanPhamService.add(sp,spAvatar,"hardware",spAnh);
		return super.saveOrUpdate(hard);
	}
}
