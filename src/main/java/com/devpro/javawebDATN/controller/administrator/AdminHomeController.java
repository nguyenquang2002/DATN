package com.devpro.javawebDATN.controller.administrator;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.javawebDATN.controller.BaseController;
import com.devpro.javawebDATN.model.Brand;
import com.devpro.javawebDATN.model.DonHang;
import com.devpro.javawebDATN.model.SanPham;
import com.devpro.javawebDATN.services.BrandService;
import com.devpro.javawebDATN.services.DonHangService;
import com.devpro.javawebDATN.services.SanPhamService;

@Controller
public class AdminHomeController extends BaseController{
	
	@Autowired
	SanPhamService sanPhamService = new SanPhamService();
	@Autowired
	BrandService brandService = new BrandService();
	@Autowired
	DonHangService donHangService = new DonHangService();
	
	@RequestMapping(value = { "/admin/index" }, method = RequestMethod.GET)
	public String home(final Model model, 
	   				   final HttpServletRequest request, 
	   				   final HttpServletResponse response) {
		List<Brand> listbrand = brandService.getEntitiesByNativeSQL("select * from brand");
		List<SanPham> listsp = sanPhamService.getEntitiesByNativeSQL("select * from sanpham where trang_thai >= 0");
		int total = 0;
		for (SanPham sanPham : listsp) {
			total += sanPham.getSoLuong();
		}
		model.addAttribute("brands", listbrand.size());
		model.addAttribute("products", listsp.size());
		model.addAttribute("productTotal", total);
		// đường dẫn tới file view
		return "administrator/index"; // -> /WEB-INF/views/customer/index.jsp
	}
	
	@RequestMapping(value = { "/admin" }, method = RequestMethod.GET)
	public String index(final Model model, 
	   				   final HttpServletRequest request, 
	   				   final HttpServletResponse response) {
		List<Brand> listbrand = brandService.getEntitiesByNativeSQL("select * from brand");
		List<SanPham> listsp = sanPhamService.getEntitiesByNativeSQL("select * from sanpham where trang_thai >= 0");
		int total = 0;
		for (SanPham sanPham : listsp) {
			total += sanPham.getSoLuong();
		}
		Date date = new Date();
		List<DonHang> listDH = donHangService.getEntitiesByNativeSQL("SELECT * FROM datn.donhang WHERE MONTH(ngay_ghtc) = "
				+ getMonth(date) + " AND YEAR(ngay_ghtc) = YEAR(CURDATE());");
		
		
		model.addAttribute("brands", listbrand.size());
		model.addAttribute("products", listsp.size());
		model.addAttribute("orders", listDH.size());
		model.addAttribute("productTotal", total);
		// đường dẫn tới file view
		return "administrator/index"; // -> /WEB-INF/views/customer/index.jsp
	}
	
	public int getMonth(Date date) {
        LocalDate localDate = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
        return localDate.getMonthValue();
    }
	
}
