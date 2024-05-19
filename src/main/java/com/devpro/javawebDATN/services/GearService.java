package com.devpro.javawebDATN.services;

import java.io.IOException;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.javawebDATN.model.Gear;
import com.devpro.javawebDATN.model.PhanCung;
import com.devpro.javawebDATN.model.SanPham;

@Service
public class GearService extends BaseService<Gear>{

	@Autowired
	SanPhamService sanPhamService = new SanPhamService();
	
	@Override
	protected Class<Gear> clazz() {
		// TODO Auto-generated method stub
		return Gear.class;
	}
	
	public Gear findBySanPhamID(int spid) {
		return this.getEntityByNativeSQL("select * from gear where sanpham_id = " + spid);
	}
	
	@Transactional
	public Gear add(Gear gear, MultipartFile spAvatar, MultipartFile[] spAnh) throws IllegalStateException,IOException{
		SanPham sp = new SanPham();
		sp.setTenSanPham(gear.getSanPham().getTenSanPham());
		sp.setGiaTien(gear.getSanPham().getGiaTien());
		sp.setGiamGia(gear.getSanPham().getGiamGia());
		sp.setSoLuong(gear.getSanPham().getSoLuong());
		sp.setLoaiSanPham(4);
		sp.setTrangThai(gear.getSanPham().getTrangThai());
		sp.setBrand(gear.getSanPham().getBrand());
		sp.setMoTa(gear.getSanPham().getMoTa());
		sanPhamService.add(sp,spAvatar,"gear",spAnh);
		gear.setSanPham(sp);
		return super.saveOrUpdate(gear);
	}
	
	@Transactional
	public Gear update(Gear gear, MultipartFile spAvatar, MultipartFile[] spAnh) throws IllegalStateException,IOException{
		SanPham sp = sanPhamService.getById(gear.getSanPham().getId());
		sp.setTenSanPham(gear.getSanPham().getTenSanPham());
		sp.setGiaTien(gear.getSanPham().getGiaTien());
		sp.setGiamGia(gear.getSanPham().getGiamGia());
		sp.setSoLuong(gear.getSanPham().getSoLuong());
		sp.setLoaiSanPham(4);
		sp.setTrangThai(gear.getSanPham().getTrangThai());
		sp.setBrand(gear.getSanPham().getBrand());
		sp.setMoTa(gear.getSanPham().getMoTa());
		sanPhamService.add(sp,spAvatar,"hardware",spAnh);
		return super.saveOrUpdate(gear);
	}
}
