package com.devpro.javawebDATN.controller.administrator;

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
import com.devpro.javawebDATN.dto.TaiKhoanSearchModel;
import com.devpro.javawebDATN.model.ChucVu;
import com.devpro.javawebDATN.model.TaiKhoan;
import com.devpro.javawebDATN.services.ChucVuService;
import com.devpro.javawebDATN.services.PagerData;
import com.devpro.javawebDATN.services.TaiKhoanService;

@Controller
public class AdminTaiKhoanController extends BaseController{
	
	@Autowired
	TaiKhoanService taiKhoanService = new TaiKhoanService();
	@Autowired
	ChucVuService chucVuService = new ChucVuService();
	
	@RequestMapping(value = { "/admin/user" }, method = RequestMethod.GET)
	public String adminUser(final Model model,
							   final HttpServletRequest request,
							   final HttpServletResponse response) {
		
		String keyword = request.getParameter("keyword");
		Integer roleId = getInteger(request, "roleId");
		
		boolean isAdmin = (getUserLogined().getChucVu().getId() == 1);
		
		TaiKhoanSearchModel searchModel = new TaiKhoanSearchModel();
		searchModel.setKeyword(keyword);
		searchModel.setRoleId(roleId);
		searchModel.setPage(getCurrentPage(request));
		List<ChucVu> chucVus = chucVuService.findAll();
		PagerData<TaiKhoan> users = taiKhoanService.search(searchModel,isAdmin);
		
		model.addAttribute("chucVus", chucVus);
		model.addAttribute("users", users);
		model.addAttribute("isAdmin",isAdmin);
		model.addAttribute("searchModel", searchModel);
		
		return "/administrator/users"; // -> /WEB-INF/views/administrator/home.jsp
	}
	
	@RequestMapping(value = { "/admin/user/management" }, method = RequestMethod.GET)
	public String adminManageUser(final Model model,
					  final HttpServletRequest request,
					  final HttpServletResponse response) {
		TaiKhoan user = new TaiKhoan();
		model.addAttribute("user", user);

		return "/administrator/user_management";
	}
	
	@RequestMapping(value = { "/admin/user/management/{userId}" }, method = RequestMethod.GET)
	public String adminUserEdit(final Model model,
					  final HttpServletRequest request,
					  final HttpServletResponse response,
					  @PathVariable("userId") int userID) {
		TaiKhoan user = taiKhoanService.getById(userID);
		model.addAttribute("user", user);

		return "/administrator/user_management";
	}
	
	@RequestMapping(value = { "/admin/user/management" }, method = RequestMethod.POST)
	public String adminManagementUserPost(final Model model,
											 final HttpServletRequest request,
											 final HttpServletResponse response,
											 final @ModelAttribute("user") TaiKhoan user)throws Exception {
		// Kiểm tra xem username hoặc email đã tồn tại hay không
	    if (taiKhoanService.findByUsername(user.getUsername()) != null) {
	        model.addAttribute("errorMessage", "Tên đăng nhập đã tồn tại");
	        return "/administrator/user_management"; // Chuyển hướng về trang đăng nhập với thông báo lỗi
	    } else if (taiKhoanService.findByEmail(user.getEmail()) != null) {
	        model.addAttribute("errorMessage", "Email đã được sử dụng");
	        return "/administrator/user_management"; // Chuyển hướng về trang đăng nhập với thông báo lỗi
	    } else {
	        // Nếu không có lỗi, tiến hành lưu tài khoản và chuyển hướng đến trang đăng nhập
	        if(user.getId() == null || user.getId() < 0 ) {
	        	ChucVu chucVu = chucVuService.getById(2);
		        user.setChucVu(chucVu);
		        taiKhoanService.add(user);
	        } else taiKhoanService.update(user);
	        
	        
	        taiKhoanService.saveOrUpdate(user);
	        return "redirect:/admin/user";
	    }
		 
	}
	
	@RequestMapping(value = { "/admin/user/delete" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> deleteUser(final Model model, 
															final HttpServletRequest request,
															final HttpServletResponse response, 
															final @RequestBody TaiKhoan user) {
		
		TaiKhoan userInDb = taiKhoanService.getById(user.getId());
		userInDb.setTrangThai(0);
		taiKhoanService.saveOrUpdate(userInDb);
		
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("message", "Đã xóa thành công");
		return ResponseEntity.ok(jsonResult);
		
	}
	
	@RequestMapping(value = { "/admin/user/unban" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> unbanUser(final Model model, 
															final HttpServletRequest request,
															final HttpServletResponse response, 
															final @RequestBody TaiKhoan user) {
		
		TaiKhoan userInDb = taiKhoanService.getById(user.getId());
		userInDb.setTrangThai(1);
		taiKhoanService.saveOrUpdate(userInDb);
		
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("message", "Đã xóa thành công");
		return ResponseEntity.ok(jsonResult);
		
	}
}
