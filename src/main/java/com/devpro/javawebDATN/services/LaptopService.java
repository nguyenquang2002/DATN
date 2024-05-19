package com.devpro.javawebDATN.services;

import java.io.IOException;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.javawebDATN.model.CauHinhLaptop;
import com.devpro.javawebDATN.model.Laptop;
import com.devpro.javawebDATN.model.PhanCung;
import com.devpro.javawebDATN.model.SanPham;

@Service
public class LaptopService extends BaseService<Laptop>{
	@Autowired
	SanPhamService sanPhamService = new SanPhamService();
	@Autowired
	CauHinhLaptopService cauHinhLaptopService = new CauHinhLaptopService();
	@Override
	protected Class<Laptop> clazz() {
		// TODO Auto-generated method stub
		return Laptop.class;
	}
	
	public Laptop findBySanPhamID(int spid) {
		return this.getEntityByNativeSQL("select * from laptop where sanpham_id = " + spid);
	}
	
	@Transactional
	public Laptop add(Laptop laptop, MultipartFile spAvatar, MultipartFile[] spAnh,
			PhanCung cpu, PhanCung ram, PhanCung harddrive, PhanCung vga) throws IllegalStateException,IOException{
		SanPham sp = new SanPham();
		sp.setTenSanPham(laptop.getSanPham().getTenSanPham());
		sp.setGiaTien(laptop.getSanPham().getGiaTien());
		sp.setGiamGia(laptop.getSanPham().getGiamGia());
		sp.setSoLuong(laptop.getSanPham().getSoLuong());
		sp.setLoaiSanPham(laptop.getSanPham().getLoaiSanPham());
		sp.setTrangThai(laptop.getSanPham().getTrangThai());
		sp.setMoTa(laptop.getSanPham().getMoTa());
		sp.setBrand(laptop.getSanPham().getBrand());
		sanPhamService.add(sp,spAvatar,"laptop",spAnh);
		laptop.setSanPham(sp);
		
		// Thêm cấu hình
		// Thêm cpu
		CauHinhLaptop newCpu = new CauHinhLaptop();
		CauHinhLaptop newRam = new CauHinhLaptop();
		CauHinhLaptop newHarddrive = new CauHinhLaptop();
		CauHinhLaptop newVga = new CauHinhLaptop();
		newCpu.setPhanCung(cpu);
		laptop.addCauHinh(newCpu);
		newRam.setPhanCung(ram);
		laptop.addCauHinh(newRam);
		newHarddrive.setPhanCung(harddrive);
		laptop.addCauHinh(newHarddrive);
		newVga.setPhanCung(vga);
		laptop.addCauHinh(newVga);
		
		return super.saveOrUpdate(laptop);
	}
	
	@Transactional
	public Laptop update(Laptop laptop, MultipartFile spAvatar, MultipartFile[] spAnh,
			PhanCung cpu, PhanCung ram, PhanCung harddrive, PhanCung vga) throws IOException{
		SanPham sp = sanPhamService.getById(laptop.getSanPham().getId());
		sp.setTenSanPham(laptop.getSanPham().getTenSanPham());
		sp.setGiaTien(laptop.getSanPham().getGiaTien());
		sp.setGiamGia(laptop.getSanPham().getGiamGia());
		sp.setSoLuong(laptop.getSanPham().getSoLuong());
		sp.setLoaiSanPham(laptop.getSanPham().getLoaiSanPham());
		sp.setTrangThai(laptop.getSanPham().getTrangThai());
		sp.setMoTa(laptop.getSanPham().getMoTa());
		sp.setBrand(laptop.getSanPham().getBrand());
		sanPhamService.update(sp,spAvatar,"laptop",spAnh);
		
		// Thêm cấu hình
		List<CauHinhLaptop> listCauHinh = cauHinhLaptopService.getEntitiesByNativeSQL("select * from cauhinhlaptop where laptop_id = " + laptop.getId() + ";");
		// Thêm cpu
		int dCPU = 0,dRam = 0,dHD = 0,dVga = 0;
		for (CauHinhLaptop cauHinh : listCauHinh) {
			if(cauHinh.getPhanCung().getLoaiPhanCung().getId() == 2) {
				dCPU++;
				if(cauHinh.getPhanCung().getId() != cpu.getId()) {
					cauHinhLaptopService.delete(cauHinh);
					CauHinhLaptop newCpu = new CauHinhLaptop();
					newCpu.setPhanCung(cpu);
					laptop.addCauHinh(newCpu);
					cauHinhLaptopService.saveOrUpdate(newCpu);
				}
			}
			if(cauHinh.getPhanCung().getLoaiPhanCung().getId() == 3) {
				dRam++;
				if(cauHinh.getPhanCung().getId() != ram.getId()) {
					cauHinhLaptopService.delete(cauHinh);
					CauHinhLaptop newRam = new CauHinhLaptop();
					newRam.setPhanCung(ram);
					laptop.addCauHinh(newRam);
					cauHinhLaptopService.saveOrUpdate(newRam);
				}
			}
			if(cauHinh.getPhanCung().getLoaiPhanCung().getId() == 5) {
				dHD++;
				if(cauHinh.getPhanCung().getId() != harddrive.getId()) {
					cauHinhLaptopService.delete(cauHinh);
					CauHinhLaptop newHD = new CauHinhLaptop();
					newHD.setPhanCung(harddrive);
					laptop.addCauHinh(newHD);
					cauHinhLaptopService.saveOrUpdate(newHD);
				}
			}
			if(cauHinh.getPhanCung().getLoaiPhanCung().getId() == 4) {
				dVga++;
				if(cauHinh.getPhanCung().getId() != vga.getId()) {
					cauHinhLaptopService.delete(cauHinh);
					CauHinhLaptop newVga = new CauHinhLaptop();
					newVga.setPhanCung(vga);
					laptop.addCauHinh(newVga);
					cauHinhLaptopService.saveOrUpdate(newVga);
				}
			}
		}

		if(dCPU == 0) {
			CauHinhLaptop newCpu = new CauHinhLaptop();
			newCpu.setPhanCung(cpu);
			laptop.addCauHinh(newCpu);
			cauHinhLaptopService.saveOrUpdate(newCpu);
		}
		if(dRam == 0) {
			CauHinhLaptop newRam = new CauHinhLaptop();
			newRam.setPhanCung(ram);
			laptop.addCauHinh(newRam);
			cauHinhLaptopService.saveOrUpdate(newRam);
		}
		if(dHD == 0) {
			CauHinhLaptop newHD = new CauHinhLaptop();
			newHD.setPhanCung(harddrive);
			laptop.addCauHinh(newHD);
			cauHinhLaptopService.saveOrUpdate(newHD);
		}
		if(dVga == 0) {
			CauHinhLaptop newVga = new CauHinhLaptop();
			newVga.setPhanCung(vga);
			laptop.addCauHinh(newVga);
			cauHinhLaptopService.saveOrUpdate(newVga);
		}
		return super.saveOrUpdate(laptop);
	}
}
