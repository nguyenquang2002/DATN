package com.devpro.javawebDATN.services;

import java.io.IOException;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.javawebDATN.model.CauHinhPC;
import com.devpro.javawebDATN.model.PC;
import com.devpro.javawebDATN.model.PhanCung;
import com.devpro.javawebDATN.model.SanPham;

@Service
public class PCService extends BaseService<PC>{

	@Autowired
	SanPhamService sanPhamService = new SanPhamService();
	@Autowired
	CauHinhPCService cauHinhPCService = new CauHinhPCService();
	
	@Override
	protected Class<PC> clazz() {
		// TODO Auto-generated method stub
		return PC.class;
	}
	
	public PC findBySanPhamID(int spid) {
		return this.getEntityByNativeSQL("select * from pc where sanpham_id = " + spid);
	}
	
	@Transactional
	public PC add(PC pc, MultipartFile spAvatar, MultipartFile[] spAnh,
			PhanCung cpu, PhanCung ram, PhanCung harddrive, PhanCung vga,
			PhanCung mainboard, PhanCung fan, PhanCung psu, PhanCung casePC, int soLuongRam) throws IllegalStateException,IOException{
		SanPham sp = new SanPham();
		sp.setTenSanPham(pc.getSanPham().getTenSanPham());
		sp.setGiaTien(pc.getSanPham().getGiaTien());
		sp.setGiamGia(pc.getSanPham().getGiamGia());
		sp.setSoLuong(pc.getSanPham().getSoLuong());
		sp.setLoaiSanPham(1);
		sp.setTrangThai(pc.getSanPham().getTrangThai());
		sp.setMoTa(pc.getSanPham().getMoTa());
		sp.setBrand(pc.getSanPham().getBrand());
		sanPhamService.add(sp,spAvatar,"pc",spAnh);
		pc.setSanPham(sp);
		
		// Thêm cấu hình
		// Thêm cpu
		CauHinhPC newMainboard = new CauHinhPC();
		CauHinhPC newCpu = new CauHinhPC();
		CauHinhPC newRam = new CauHinhPC();
		CauHinhPC newHarddrive = new CauHinhPC();
		CauHinhPC newVga = new CauHinhPC();
		CauHinhPC newFan = new CauHinhPC();
		CauHinhPC newPSU = new CauHinhPC();
		CauHinhPC newCasePC = new CauHinhPC();
		newMainboard.setPhanCung(mainboard);
		pc.addCauHinh(newMainboard);
		newCpu.setPhanCung(cpu);
		pc.addCauHinh(newCpu);
		newRam.setPhanCung(ram);
		newRam.setSoLuong(soLuongRam);
		pc.addCauHinh(newRam);
		newHarddrive.setPhanCung(harddrive);
		pc.addCauHinh(newHarddrive);
		newVga.setPhanCung(vga);
		pc.addCauHinh(newVga);
		newFan.setPhanCung(fan);
		pc.addCauHinh(newFan);
		newPSU.setPhanCung(psu);
		pc.addCauHinh(newPSU);
		newCasePC.setPhanCung(casePC);
		pc.addCauHinh(newCasePC);
		
		return super.saveOrUpdate(pc);
	}
	
	@Transactional
	public PC update(PC pc, MultipartFile spAvatar, MultipartFile[] spAnh,
			PhanCung cpu, PhanCung ram, PhanCung harddrive, PhanCung vga,
			PhanCung mainboard, PhanCung fan, PhanCung psu, PhanCung casePC, int soLuongRam) throws IOException{
		SanPham sp = sanPhamService.getById(pc.getSanPham().getId());
		sp.setTenSanPham(pc.getSanPham().getTenSanPham());
		sp.setGiaTien(pc.getSanPham().getGiaTien());
		sp.setGiamGia(pc.getSanPham().getGiamGia());
		sp.setSoLuong(pc.getSanPham().getSoLuong());
		sp.setLoaiSanPham(1);
		sp.setTrangThai(pc.getSanPham().getTrangThai());
		sp.setMoTa(pc.getSanPham().getMoTa());
		sp.setBrand(pc.getSanPham().getBrand());
		sanPhamService.update(sp,spAvatar,"pc",spAnh);
		
		// Thêm cấu hình
		List<CauHinhPC> listCauHinh = cauHinhPCService.getEntitiesByNativeSQL("select * from cauhinhpc where pc_id = " + pc.getId() + ";");
		// Thêm cpu
		int dCPU = 0,dRam = 0,dHD = 0,dVga = 0,dMain = 0, dFan=0, dPsu = 0, dCase = 0;
		for (CauHinhPC cauHinh : listCauHinh) {
			if(cauHinh.getPhanCung().getLoaiPhanCung().getId() == 1) {
				dMain++;
				if(cauHinh.getPhanCung().getId() != mainboard.getId()) {
					cauHinhPCService.delete(cauHinh);
					CauHinhPC newMain = new CauHinhPC();
					newMain.setPhanCung(mainboard);
					pc.addCauHinh(newMain);
					cauHinhPCService.saveOrUpdate(newMain);
				}
			}
			if(cauHinh.getPhanCung().getLoaiPhanCung().getId() == 2) {
				dCPU++;
				if(cauHinh.getPhanCung().getId() != cpu.getId()) {
					cauHinhPCService.delete(cauHinh);
					CauHinhPC newCpu = new CauHinhPC();
					newCpu.setPhanCung(cpu);
					pc.addCauHinh(newCpu);
					cauHinhPCService.saveOrUpdate(newCpu);
				}
			}
			if(cauHinh.getPhanCung().getLoaiPhanCung().getId() == 3) {
				dRam++;
				if(cauHinh.getPhanCung().getId() == ram.getId() && cauHinh.getSoLuong() != soLuongRam) {
					cauHinh.setSoLuong(soLuongRam);
					cauHinhPCService.saveOrUpdate(cauHinh);
				}
				if(cauHinh.getPhanCung().getId() != ram.getId()) {
					cauHinhPCService.delete(cauHinh);
					CauHinhPC newRam = new CauHinhPC();
					newRam.setPhanCung(ram);
					pc.addCauHinh(newRam);
					cauHinhPCService.saveOrUpdate(newRam);
				}
			}
			if(cauHinh.getPhanCung().getLoaiPhanCung().getId() == 5) {
				dHD++;
				if(cauHinh.getPhanCung().getId() != harddrive.getId()) {
					cauHinhPCService.delete(cauHinh);
					CauHinhPC newHD = new CauHinhPC();
					newHD.setPhanCung(harddrive);
					pc.addCauHinh(newHD);
					cauHinhPCService.saveOrUpdate(newHD);
				}
			}
			if(cauHinh.getPhanCung().getLoaiPhanCung().getId() == 4) {
				dVga++;
				if(cauHinh.getPhanCung().getId() != vga.getId()) {
					cauHinhPCService.delete(cauHinh);
					CauHinhPC newVga = new CauHinhPC();
					newVga.setPhanCung(vga);
					pc.addCauHinh(newVga);
					cauHinhPCService.saveOrUpdate(newVga);
				}
			}
			if(cauHinh.getPhanCung().getLoaiPhanCung().getId() == 6) {
				dFan++;
				if(cauHinh.getPhanCung().getId() != fan.getId()) {
					cauHinhPCService.delete(cauHinh);
					CauHinhPC newFan = new CauHinhPC();
					newFan.setPhanCung(fan);
					pc.addCauHinh(newFan);
					cauHinhPCService.saveOrUpdate(newFan);
				}
			}
			if(cauHinh.getPhanCung().getLoaiPhanCung().getId() == 7) {
				dPsu++;
				if(cauHinh.getPhanCung().getId() != psu.getId()) {
					cauHinhPCService.delete(cauHinh);
					CauHinhPC newPsu = new CauHinhPC();
					newPsu.setPhanCung(psu);
					pc.addCauHinh(newPsu);
					cauHinhPCService.saveOrUpdate(newPsu);
				}
			}
			if(cauHinh.getPhanCung().getLoaiPhanCung().getId() == 8) {
				dCase++;
				if(cauHinh.getPhanCung().getId() != casePC.getId()) {
					cauHinhPCService.delete(cauHinh);
					CauHinhPC newCase = new CauHinhPC();
					newCase.setPhanCung(casePC);
					pc.addCauHinh(newCase);
					cauHinhPCService.saveOrUpdate(newCase);
				}
			}
		}

		if(dCPU == 0) {
			CauHinhPC newCpu = new CauHinhPC();
			newCpu.setPhanCung(cpu);
			pc.addCauHinh(newCpu);
			cauHinhPCService.saveOrUpdate(newCpu);
		}
		if(dRam == 0) {
			CauHinhPC newRam = new CauHinhPC();
			newRam.setPhanCung(ram);
			newRam.setSoLuong(soLuongRam);
			pc.addCauHinh(newRam);
			cauHinhPCService.saveOrUpdate(newRam);
		}
		if(dHD == 0) {
			CauHinhPC newHD = new CauHinhPC();
			newHD.setPhanCung(harddrive);
			pc.addCauHinh(newHD);
			cauHinhPCService.saveOrUpdate(newHD);
		}
		if(dVga == 0) {
			CauHinhPC newVga = new CauHinhPC();
			newVga.setPhanCung(vga);
			pc.addCauHinh(newVga);
			cauHinhPCService.saveOrUpdate(newVga);
		}
		if(dMain == 0) {
			CauHinhPC newMain = new CauHinhPC();
			newMain.setPhanCung(mainboard);
			pc.addCauHinh(newMain);
			cauHinhPCService.saveOrUpdate(newMain);
		}
		if(dFan == 0) {
			CauHinhPC newFan = new CauHinhPC();
			newFan.setPhanCung(fan);
			pc.addCauHinh(newFan);
			cauHinhPCService.saveOrUpdate(newFan);
		}
		if(dPsu == 0) {
			CauHinhPC newPsu = new CauHinhPC();
			newPsu.setPhanCung(psu);
			pc.addCauHinh(newPsu);
			cauHinhPCService.saveOrUpdate(newPsu);
		}
		if(dCase == 0) {
			CauHinhPC newCase = new CauHinhPC();
			newCase.setPhanCung(casePC);
			pc.addCauHinh(newCase);
			cauHinhPCService.saveOrUpdate(newCase);
		}
		return super.saveOrUpdate(pc);
	}
}
