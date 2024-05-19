package com.devpro.javawebDATN.controller.administrator;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.javawebDATN.controller.BaseController;
import com.devpro.javawebDATN.dto.DonHangSearchModel;
import com.devpro.javawebDATN.model.DonHang;
import com.devpro.javawebDATN.model.DonHangSanPham;
import com.devpro.javawebDATN.model.SanPham;
import com.devpro.javawebDATN.services.DonHangService;
import com.devpro.javawebDATN.services.PagerData;
import com.devpro.javawebDATN.services.SanPhamService;

@Controller
public class AdminDonHangController extends BaseController{
	
	@Autowired
	DonHangService donHangService = new DonHangService();
	@Autowired
	SanPhamService sanPhamService = new SanPhamService();
	
	@RequestMapping(value = { "/admin/order" }, method = RequestMethod.GET)
	public String adminOrder(final Model model,
							   final HttpServletRequest request,
							   final HttpServletResponse response) {
		
		String keyword = request.getParameter("keyword");
		Integer orderStatus = getInteger(request, "status");
		
		DonHangSearchModel searchModel = new DonHangSearchModel();
		searchModel.setKeyword(keyword);
		searchModel.setTrangThai(orderStatus);
		searchModel.setPage(getCurrentPage(request));
		
		PagerData<DonHang> orders = donHangService.search(searchModel);
		
		model.addAttribute("orders", orders);
		model.addAttribute("searchModel", searchModel);
		
		return "/administrator/orders"; // -> /WEB-INF/views/administrator/home.jsp
	}
	
	@RequestMapping(value = { "/admin/order/detail/{orderID}"}, method = RequestMethod.GET)
	public String adminOrderEdit(final Model model,
								   final HttpServletRequest request,
								   final HttpServletResponse response,
								   @PathVariable("orderID") int orderID) throws IOException{
		
		// lấy product theo id
		DonHang order = donHangService.getById(orderID);
		model.addAttribute("order", order);
		
		
		
		return "/administrator/order_detail";						   
	}
	
	@RequestMapping(value = { "/admin/order/cancel" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> cancelOrder(final Model model, 
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
		donHangInDB.setGhiChu(donHangInDB.getGhiChu()+" Cửa hàng đã hủy đã hủy!!!");
		donHangService.saveOrUpdate(donHangInDB);
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("message", "Đã hủy thành công");
		return ResponseEntity.ok(jsonResult);
		
	}
	
	@RequestMapping(value = { "/admin/order/accept" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> acceptOrder(final Model model, 
															final HttpServletRequest request,
															final HttpServletResponse response, 
															final @RequestBody DonHang order) {
		
		DonHang orderInDB = donHangService.getById(order.getId());
		orderInDB.setTrangThai(2);
		orderInDB.setNgayXacNhan(new Date());
		donHangService.saveOrUpdate(orderInDB);
		
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("message", "Đã xác nhận");
		return ResponseEntity.ok(jsonResult);
		
	}
	
	@RequestMapping(value = { "/admin/order/shipping" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> shippingOrder(final Model model, 
															final HttpServletRequest request,
															final HttpServletResponse response, 
															final @RequestBody DonHang order) {
		
		DonHang orderInDB = donHangService.getById(order.getId());
		orderInDB.setTrangThai(3);
		orderInDB.setNgayGiaoHang(new Date());
		donHangService.saveOrUpdate(orderInDB);
		
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("message", "Đang giao hàng");
		return ResponseEntity.ok(jsonResult);
		
	}
	
	@RequestMapping(value = { "/admin/order/complete" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> completeOrder(final Model model, 
															final HttpServletRequest request,
															final HttpServletResponse response, 
															final @RequestBody DonHang order) {
		
		DonHang orderInDB = donHangService.getById(order.getId());
		orderInDB.setTrangThai(4);
		orderInDB.setNgayGiaoHangTC(new Date());
		donHangService.saveOrUpdate(orderInDB);
		
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("message", "Đã giao hàng thành công");
		return ResponseEntity.ok(jsonResult);
		
	}
}
