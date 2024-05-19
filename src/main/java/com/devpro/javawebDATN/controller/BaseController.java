package com.devpro.javawebDATN.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.devpro.javawebDATN.model.Brand;
import com.devpro.javawebDATN.model.ChucVu;
import com.devpro.javawebDATN.model.SanPham;
import com.devpro.javawebDATN.model.TaiKhoan;
import com.devpro.javawebDATN.services.BrandService;
import com.devpro.javawebDATN.services.SanPhamService;

public class BaseController {

	@Autowired
	BrandService baseBrandService = new BrandService();
	
	
	/**
	 * Kiểm tra xem người dùng đã đăng nhập chưa?
	 * User logined có thể truy cập thông qua class SecurityContextHolder
	 * @return true|false, true nếu đã login ngược lại trả về false
	 */
	@ModelAttribute("isLogined")
	public boolean isLogined() {
		boolean isLogined = false;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal instanceof UserDetails) {
			isLogined = true;
		}
		
		return isLogined;
	}
	
	/**
	 * trả về entity User chính là user logined
	 * User logined có thể truy cập thông qua class SecurityContextHolder
	 * @return
	 */
	@ModelAttribute("userLogined")
	public TaiKhoan getUserLogined() {
		Object userLogined = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(userLogined != null && userLogined instanceof UserDetails)
			return (TaiKhoan) userLogined;
		
		return new TaiKhoan();
	}
	
	
	
	public Integer getInteger(HttpServletRequest request, String paramName) {
		try {
			return Integer.parseInt(request.getParameter(paramName));
		} catch (Exception e) {
			return null;
		}
	}
	
	public int getCurrentPage(HttpServletRequest request) {
		try {
			return Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
			return 1;
		}
	}
	
	@ModelAttribute("brandPC")
	public List<Brand> listBrandPC() {
		return baseBrandService.getEntitiesByNativeSQL("SELECT distinct b.* FROM brand b join"
				+ " sanpham sp on b.id = sp.brand_id where"
				+ " sp.loai_san_pham = 1 and sp.trang_thai >= 0;");
	}
	@ModelAttribute("brandLaptop")
	public List<Brand> listBrandLaptop() {
		return baseBrandService.getEntitiesByNativeSQL("SELECT distinct b.* FROM brand b join"
				+ " sanpham sp on b.id = sp.brand_id where"
				+ " sp.loai_san_pham = 2 and sp.trang_thai >= 0;");
	}
	@ModelAttribute("brandLaptopGaming")
	public List<Brand> listBrandLaptopGaming() {
		return baseBrandService.getEntitiesByNativeSQL("SELECT distinct b.* FROM brand b join"
				+ " sanpham sp on b.id = sp.brand_id where"
				+ " sp.loai_san_pham = 5 and sp.trang_thai >= 0;");
	}
	@ModelAttribute("brandPhanCung")
	public List<Brand> listBrandPhanCung() {
		return baseBrandService.getEntitiesByNativeSQL("SELECT distinct b.* FROM brand b join"
				+ " sanpham sp on b.id = sp.brand_id where"
				+ " sp.loai_san_pham = 3 and sp.trang_thai >= 0;");
	}
	@ModelAttribute("brandGear")
	public List<Brand> listBrandGear() {
		return baseBrandService.getEntitiesByNativeSQL("SELECT distinct b.* FROM brand b join"
				+ " sanpham sp on b.id = sp.brand_id where"
				+ " sp.loai_san_pham = 4 and sp.trang_thai >= 0;");
	}
	
	
}
