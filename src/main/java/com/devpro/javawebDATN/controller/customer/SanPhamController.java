package com.devpro.javawebDATN.controller.customer;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.javawebDATN.controller.BaseController;
import com.devpro.javawebDATN.dto.SanPhamSearchModel;
import com.devpro.javawebDATN.model.Brand;
import com.devpro.javawebDATN.model.CauHinhLaptop;
import com.devpro.javawebDATN.model.CauHinhPC;
import com.devpro.javawebDATN.model.Gear;
import com.devpro.javawebDATN.model.Laptop;
import com.devpro.javawebDATN.model.PC;
import com.devpro.javawebDATN.model.PhanCung;
import com.devpro.javawebDATN.model.SanPham;
import com.devpro.javawebDATN.services.BrandService;
import com.devpro.javawebDATN.services.GearService;
import com.devpro.javawebDATN.services.LaptopService;
import com.devpro.javawebDATN.services.PCService;
import com.devpro.javawebDATN.services.PagerData;
import com.devpro.javawebDATN.services.PhanCungService;
import com.devpro.javawebDATN.services.SanPhamService;

@Controller
public class SanPhamController extends BaseController{
	
	@Autowired
	BrandService brandService = new BrandService();
	@Autowired
	LaptopService laptopService = new LaptopService();
	@Autowired
	SanPhamService sanPhamService = new SanPhamService();
	@Autowired
	PCService pcService = new PCService();
	@Autowired
	PhanCungService phanCungSevice = new PhanCungService();
	@Autowired
	GearService gearService = new GearService();
	
	@RequestMapping(value = { "/list" }, method = RequestMethod.GET)
	public String listProduct(final Model model, 
	   				   final HttpServletRequest request, 
	   				   final HttpServletResponse response) {
		String keyword = request.getParameter("keyword");
		String price = request.getParameter("price");
		Integer brandID = getInteger(request, "brandID");
		Integer lsp = getInteger(request, "loaiSP");
		
		SanPhamSearchModel searchModel = new SanPhamSearchModel();
		searchModel.setKeyword(keyword);
		searchModel.setPrice(price);
		searchModel.setBrandID(brandID);
		searchModel.setLoaiSP(lsp);
		searchModel.setPage(getCurrentPage(request));
		
		List<Brand> brands = brandService.findAll();
		PagerData<SanPham> listSP = sanPhamService.listSP(searchModel);
		model.addAttribute("products", listSP);
		
		model.addAttribute("spCount", spCount(0));
		model.addAttribute("pcCount", spCount(1));
		model.addAttribute("laptopCount", spCount(2));
		model.addAttribute("laptopGamingCount", spCount(5));
		model.addAttribute("hardCount", spCount(3));
		model.addAttribute("gearCount", spCount(4));
		model.addAttribute("searchModel", searchModel);
		model.addAttribute("brands", brands);
		// đường dẫn tới file view
		return "customer/list-product"; // -> /WEB-INF/views/customer/index.jsp
	}
	
	public int spCount(int loaiSP) {
		List<SanPham> listSP = new ArrayList<SanPham>();
		if(loaiSP <= 0) {
			listSP = sanPhamService.getEntitiesByNativeSQL("select * from sanpham where trang_thai >= 0");
		}
		else listSP = sanPhamService.getEntitiesByNativeSQL("select * from sanpham where trang_thai >= 0 and loai_san_pham = " + loaiSP);
		return listSP.size();
	}
	
	@RequestMapping(value = { "/computer/{spid}" }, method = RequestMethod.GET)
	public String computer(final Model model, 
	   				   final HttpServletRequest request, 
	   				   final HttpServletResponse response,
	   				   @PathVariable("spid") int spid) {
		PhanCung main = new PhanCung();
		PhanCung cpu = new PhanCung();
		PhanCung ram = new PhanCung();
		PhanCung vga = new PhanCung();
		PhanCung harddrive = new PhanCung();
		PhanCung fan = new PhanCung();
		PhanCung psu = new PhanCung();
		PhanCung casePC = new PhanCung();
		int slRam = 1;
		PC pc = pcService.findBySanPhamID(spid);
		for (CauHinhPC cauHinh : pc.cauHinhPCs) {
			if(cauHinh.getPhanCung().getLoaiPhanCung().getId() == 1) {
				main = cauHinh.getPhanCung();
			}
			if(cauHinh.getPhanCung().getLoaiPhanCung().getId() == 2) {
				cpu = cauHinh.getPhanCung();
			}
			if(cauHinh.getPhanCung().getLoaiPhanCung().getId() == 3) {
				ram = cauHinh.getPhanCung();
				slRam = cauHinh.getSoLuong();
			}
			if(cauHinh.getPhanCung().getLoaiPhanCung().getId() == 5) {
				harddrive = cauHinh.getPhanCung();
			}
			if(cauHinh.getPhanCung().getLoaiPhanCung().getId() == 4) {
				vga = cauHinh.getPhanCung();
			}
			if(cauHinh.getPhanCung().getLoaiPhanCung().getId() == 6) {
				fan = cauHinh.getPhanCung();
			}
			if(cauHinh.getPhanCung().getLoaiPhanCung().getId() == 7) {
				psu = cauHinh.getPhanCung();
			}
			if(cauHinh.getPhanCung().getLoaiPhanCung().getId() == 8) {
				casePC = cauHinh.getPhanCung();
			}
			
		}
		// đường dẫn tới file view
		List<SanPham> sanPhamLienQuan = sanPhamService.getEntitiesByNativeSQL("select * from sanpham where loai_san_pham = " + pc.getSanPham().getLoaiSanPham() + " and trang_thai >= 0"
				+ " and id <> " + pc.getSanPham().getId()
				+ " order by id desc limit 4");
		model.addAttribute("main",main);
		model.addAttribute("cpu",cpu);
		model.addAttribute("ram",ram);
		model.addAttribute("slRam",slRam);
		model.addAttribute("harddrive",harddrive);
		model.addAttribute("vga",vga);
		model.addAttribute("fan",fan);
		model.addAttribute("psu",psu);
		model.addAttribute("casePC",casePC);
		model.addAttribute("listSPLQ",sanPhamLienQuan);
		model.addAttribute("pc",pc);
		return "customer/computer"; // -> /WEB-INF/views/customer/index.jsp
	}
	
	@RequestMapping(value = { "/gear/{spid}" }, method = RequestMethod.GET)
	public String gear(final Model model, 
	   				   final HttpServletRequest request, 
	   				   final HttpServletResponse response,
	   				   @PathVariable("spid") int spid) {
		
		Gear gear = gearService.findBySanPhamID(spid);
		List<SanPham> sanPhamLienQuan = sanPhamService.getEntitiesByNativeSQL("select * from sanpham where loai_san_pham = " + gear.getSanPham().getLoaiSanPham() + " and trang_thai >= 0"
				+ " and id <> " + gear.getSanPham().getId()
				+ " order by id desc limit 4");
		model.addAttribute("listSPLQ",sanPhamLienQuan);
		model.addAttribute("gear",gear);
		// đường dẫn tới file view
		return "customer/gear"; // -> /WEB-INF/views/customer/index.jsp
	}
	
	@RequestMapping(value = { "/hardware/{spid}" }, method = RequestMethod.GET)
	public String hardware(final Model model, 
	   				   final HttpServletRequest request, 
	   				   final HttpServletResponse response,
	   				   @PathVariable("spid") int spid) {
		PhanCung phanCung = phanCungSevice.findBySanPhamID(spid);
		List<SanPham> sanPhamLienQuan = sanPhamService.getEntitiesByNativeSQL("select * from sanpham where loai_san_pham = " + phanCung.getSanPham().getLoaiSanPham() + " and trang_thai >= 0"
				+ " and id <> " + phanCung.getSanPham().getId()
				+ " order by id desc limit 4");
		model.addAttribute("listSPLQ",sanPhamLienQuan);
		model.addAttribute("phanCung",phanCung);
		// đường dẫn tới file view
		return "customer/hardware"; // -> /WEB-INF/views/customer/index.jsp
	}
	
	@RequestMapping(value = { "/laptop/{spid}" }, method = RequestMethod.GET)
	public String laptop(final Model model, 
	   				   final HttpServletRequest request, 
	   				   final HttpServletResponse response,
	   				   @PathVariable("spid") int spid) {
		PhanCung cpu = new PhanCung();
		PhanCung ram = new PhanCung();
		PhanCung harddrive = new PhanCung();
		PhanCung vga = new PhanCung();
		Laptop lap = laptopService.findBySanPhamID(spid);
		for (CauHinhLaptop cauHinh : lap.cauHinhLaptops) {
			if(cauHinh.getPhanCung().getLoaiPhanCung().getId() == 2) {
				cpu = cauHinh.getPhanCung();
			}
			if(cauHinh.getPhanCung().getLoaiPhanCung().getId() == 3) {
				ram = cauHinh.getPhanCung();
			}
			if(cauHinh.getPhanCung().getLoaiPhanCung().getId() == 5) {
				harddrive = cauHinh.getPhanCung();
			}
			if(cauHinh.getPhanCung().getLoaiPhanCung().getId() == 4) {
				vga = cauHinh.getPhanCung();
			}
		}
		List<SanPham> sanPhamLienQuan = sanPhamService.getEntitiesByNativeSQL("select * from sanpham where loai_san_pham = " + lap.getSanPham().getLoaiSanPham() + " and trang_thai >= 0"
				+ " and id <> " + lap.getSanPham().getId()
				+ " order by id desc limit 4");
		model.addAttribute("cpu",cpu);
		model.addAttribute("ram",ram);
		model.addAttribute("harddrive",harddrive);
		model.addAttribute("vga",vga);
		model.addAttribute("laptop",lap);
		model.addAttribute("listSPLQ",sanPhamLienQuan);
		// đường dẫn tới file view
		return "customer/laptop"; // -> /WEB-INF/views/customer/index.jsp
	}
}
