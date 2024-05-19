package com.devpro.javawebDATN.controller.customer;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.javawebDATN.controller.BaseController;
import com.devpro.javawebDATN.dto.DonHangSearchModel;
import com.devpro.javawebDATN.model.ChucVu;
import com.devpro.javawebDATN.model.DonHang;
import com.devpro.javawebDATN.model.DonHangSanPham;
import com.devpro.javawebDATN.model.SanPham;
import com.devpro.javawebDATN.model.TaiKhoan;
import com.devpro.javawebDATN.services.ChucVuService;
import com.devpro.javawebDATN.services.DonHangService;
import com.devpro.javawebDATN.services.PagerData;
import com.devpro.javawebDATN.services.SanPhamService;
import com.devpro.javawebDATN.services.TaiKhoanService;

// 1. Báo cho spring mvc biết đây là Controller
// 2. Tạo instance của controller này <=> HomeController hc = new HomeController()
// hc sẽ được lưu vào trong spring-container(kiểu dữ liệu List, Map)
@Controller
public class HomeController extends BaseController{
	
	@Autowired
	TaiKhoanService taiKhoanService = new TaiKhoanService();
	@Autowired
	ChucVuService chucVuService = new ChucVuService();
	@Autowired
	DonHangService donHangService = new DonHangService();
	@Autowired
	SanPhamService sanPhamService = new SanPhamService();
	
	@RequestMapping(value = { "","/" }, method = RequestMethod.GET)
	public String index(final Model model, 
	   				   final HttpServletRequest request, 
	   				   final HttpServletResponse response) {
		List<SanPham> sanPhamHots = sanPhamService.getEntitiesByNativeSQL("select * from sanpham where trang_thai = 2 order by id desc limit 6");
		List<SanPham> sanPhams = sanPhamService.getEntitiesByNativeSQL("select * from sanpham where trang_thai >= 0 order by id desc limit 6");
		model.addAttribute("sanPhamHots", sanPhamHots);
		model.addAttribute("sanPhams", sanPhams);
		// đường dẫn tới file view
		return "customer/index"; // -> /WEB-INF/views/customer/index.jsp
	}
	
	@RequestMapping(value = { "/index" }, method = RequestMethod.GET)
	public String home(final Model model, 
	   				   final HttpServletRequest request, 
	   				   final HttpServletResponse response) {
		List<SanPham> sanPhamHots = sanPhamService.getEntitiesByNativeSQL("select * from sanpham where trang_thai = 2 order by id desc limit 6");
		List<SanPham> sanPhams = sanPhamService.getEntitiesByNativeSQL("select * from sanpham where trang_thai >= 0 order by id desc limit 6");
		model.addAttribute("sanPhamHots", sanPhamHots);
		model.addAttribute("sanPhams", sanPhams);
		// đường dẫn tới file view
		return "customer/index"; // -> /WEB-INF/views/customer/index.jsp
	}
	
	
	
	
	
	@RequestMapping(value = { "/myaccount/order" }, method = RequestMethod.GET)
	public String order(final Model model, 
	   				   final HttpServletRequest request, 
	   				   final HttpServletResponse response) {
		
		if(!isLogined()) {
			return "redirect:/login";
		}
		// đường dẫn tới file view
		else {
			DonHangSearchModel searchModel = new DonHangSearchModel();
			searchModel.setPage(getCurrentPage(request));
			PagerData<DonHang> listDH = donHangService.findDonHangsByUserID(getUserLogined().getId(), searchModel);
			model.addAttribute("donHangs", listDH);
			return "customer/order"; // -> /WEB-INF/views/customer/index.jsp
		}
		
	}
	
	@RequestMapping(value = { "/myaccount/order/{madh}" }, method = RequestMethod.GET)
	public String orderDetail(final Model model, 
	   				   final HttpServletRequest request, 
	   				   final HttpServletResponse response,
	   				   @PathVariable("madh") String madh) {
		
		if(!isLogined()) {
			return "redirect:/login";
		}
		// đường dẫn tới file view
		else {
			DonHang donHang = donHangService.getEntityByNativeSQL("select * from donhang where madh = '" + madh + "'");
			model.addAttribute("donHang", donHang);
			return "customer/order-detail"; // -> /WEB-INF/views/customer/index.jsp
		}
		
	}
	
	@RequestMapping(value = { "/myaccount/order/delete" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> deleteDonHang(final Model model, 
															final HttpServletRequest request,
															final HttpServletResponse response, 
															final @RequestBody DonHang donHang) {
		
		DonHang donHangInDB = donHangService.getById(donHang.getId());
		for (DonHangSanPham donHangSP : donHangInDB.getDonHangSanPhams()) {
			SanPham sp = sanPhamService.getById(donHangSP.getSanPham().getId());
			sp.setSoLuong(sp.getSoLuong() + donHangSP.getSoLuong());
			sanPhamService.saveOrUpdate(sp);
			
		}
		donHangInDB.setTrangThai(0);
		donHangInDB.setNgayHuy(new Date());
		donHangInDB.setGhiChu(donHangInDB.getGhiChu()+" Người mua đã hủy!!!");
		donHangService.saveOrUpdate(donHangInDB);
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("message", "Đã xóa thành công");
		return ResponseEntity.ok(jsonResult);
		
	}
	
	@RequestMapping(value = { "/register" }, method = RequestMethod.POST)
	public String registerPost(final Model model,
					   final HttpServletRequest request,
					   final HttpServletResponse response,
					   final @ModelAttribute("user") TaiKhoan user) {
		
	    // Kiểm tra xem username hoặc email đã tồn tại hay không
	    if (taiKhoanService.findByUsername(user.getUsername()) != null) {
	        model.addAttribute("errorMessage", "Tên đăng nhập đã tồn tại. Vui lòng chọn tên đăng nhập khác.");
	        return "customer/login"; // Chuyển hướng về trang đăng nhập với thông báo lỗi
	    } else if (taiKhoanService.findByEmail(user.getEmail()) != null) {
	        model.addAttribute("errorMessage", "Email đã được sử dụng. Vui lòng sử dụng email khác.");
	        return "customer/login"; // Chuyển hướng về trang đăng nhập với thông báo lỗi
	    } else {
	        // Nếu không có lỗi, tiến hành lưu tài khoản và chuyển hướng đến trang đăng nhập
	        user.setPassword(new BCryptPasswordEncoder(4).encode(user.getPassword()));
	        ChucVu chucVu = chucVuService.getById(3);
	        user.setChucVu(chucVu);
	        taiKhoanService.saveOrUpdate(user);
	        return "redirect:/login";
	    }
	}
	
	@RequestMapping(value = { "/myaccount" }, method = RequestMethod.POST)
	public String myaccountPost(final Model model, 
	   				   final HttpServletRequest request, 
	   				   final HttpServletResponse response,
	   				   final @ModelAttribute("myTK") TaiKhoan myTK) throws IOException {
		// đường dẫn tới file view
		TaiKhoan u = taiKhoanService.getById(myTK.getId());
		myTK.setChucVu(u.getChucVu());
		myTK.setPassword(u.getPassword());
		myTK.setUsername(u.getUsername());
		taiKhoanService.saveOrUpdate(myTK);
		return "customer/myaccount"; // -> /WEB-INF/views/customer/index.jsp
	}
	@RequestMapping(value = { "/myaccount" }, method = RequestMethod.GET)
	public String myaccountGet(final Model model, 
	   				   final HttpServletRequest request, 
	   				   final HttpServletResponse response) throws IOException {
		
		if(!isLogined()) {
			return "redirect:/login";
		}
		// đường dẫn tới file view
		else {
			List<DonHang> listDH = donHangService.getEntitiesByNativeSQL("SELECT * FROM donhang WHERE taikhoan_id = " + getUserLogined().getId() +" ORDER BY madh DESC LIMIT 4;");
			model.addAttribute("donHangs", listDH);
			return "customer/myaccount"; // -> /WEB-INF/views/customer/index.jsp
		}
	}
	
	@RequestMapping(value = { "/wishlist" }, method = RequestMethod.GET)
	public String wishlist(final Model model, 
	   				   final HttpServletRequest request, 
	   				   final HttpServletResponse response) {
		// đường dẫn tới file view
		return "customer/wishlist"; // -> /WEB-INF/views/customer/index.jsp
	}
}
