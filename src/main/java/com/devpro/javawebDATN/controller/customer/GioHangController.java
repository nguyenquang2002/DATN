package com.devpro.javawebDATN.controller.customer;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.NumberFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.javawebDATN.controller.BaseController;
import com.devpro.javawebDATN.dto.Cart;
import com.devpro.javawebDATN.dto.CartItem;
import com.devpro.javawebDATN.model.DonHang;
import com.devpro.javawebDATN.model.DonHangSanPham;
import com.devpro.javawebDATN.model.SanPham;
import com.devpro.javawebDATN.model.TaiKhoan;
import com.devpro.javawebDATN.services.DonHangService;
import com.devpro.javawebDATN.services.SanPhamService;
import com.devpro.javawebDATN.services.TaiKhoanService;



@Controller
public class GioHangController extends BaseController{
	
	@Autowired
	SanPhamService sanPhamService = new SanPhamService();
	@Autowired
	DonHangService donHangService = new DonHangService();
	@Autowired
	TaiKhoanService taiKhoanService = new TaiKhoanService();

	@RequestMapping(value = { "/cart" }, method = RequestMethod.GET)
	public String cart(final Model model, 
						   final HttpServletRequest request, 
						   final HttpServletResponse response) throws IOException {
		return "customer/cart"; // -> đường dẫn tới View.
	}
	
	@RequestMapping(value = { "/ajax/addToCart" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_AddToCart(final Model model,
														      final HttpServletRequest request,
														      final HttpServletResponse response, 
														      final @RequestBody CartItem cartItem) {

		// để lấy session sử dụng thông qua request
		// session tương tự như kiểu Map và được lưu trên main memory.
		HttpSession session = request.getSession();

		// Lấy thông tin giỏ hàng. Đầu tiên giả sử giỏ hàng là null(chưa có giỏ hàng)
		Cart cart = null;
		
		// kiểm tra xem session có tồn tại đối tượng nào tên là "cart"
		if (session.getAttribute("cart") != null) { // tồn tại 1 giỏ hàng trên session
			cart = (Cart) session.getAttribute("cart");
		} else {// chưa có giỏ hàng nào trên session
			cart = new Cart(); //khởi tạo giỏ hàng mới
			session.setAttribute("cart", cart);
		}

		// Lấy danh sách sản phẩm đang có trong giỏ hàng
		List<CartItem> cartItems = cart.getCartItems();
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		// kiểm tra nếu sản phẩm muốn bổ sùng vào giỏ hàng có trong giỏ hàng nếu có thì tăng số lượng
		boolean isExists = false;
		for (CartItem item : cartItems) {
			if (item.getProductId() == cartItem.getProductId()) {
				isExists = true;
				// Kiểm tra trạng thái sản phẩm và số lượng sản phẩm
				SanPham sp = sanPhamService.getById(cartItem.getProductId());
				if(item.getQuanlity() + cartItem.getQuanlity() > sp.getSoLuong()) {
					// trả về kết quả
					
					jsonResult.put("code", 400);
					jsonResult.put("status", "error");
					jsonResult.put("errorMessage", "Số lượng sản phẩm " + item.getProductName() + " vượt quá số lượng có sẵn!");
					return ResponseEntity.ok(jsonResult);
				}
				// tăng số lượng sản phẩm lên
				item.setQuanlity(item.getQuanlity() + cartItem.getQuanlity());
				jsonResult.put("successMessage", "Sản phẩm " + item.getProductName() + " đã được thêm vào giỏ hàng!");
			}
		}

		// nếu sản phẩm chưa có trong giỏ hàng thì thực hiện add sản phẩm đó vào giỏ hàng
		if (!isExists) {
			// trước khi thêm mới thì lấy sản phẩm trong db
			// và thiết lập tên + đơn giá cho cartitem
			SanPham productInDb = sanPhamService.getById(cartItem.getProductId());
			
			if(productInDb.getTrangThai() <= 0) {
				// trả về kết quả
				
				jsonResult.put("code", 400);
				jsonResult.put("status", "error");
				jsonResult.put("errorMessage", "Sản phẩm " + productInDb.getTenSanPham() + " không còn có sẵn!");
				return ResponseEntity.ok(jsonResult);
			}
			
			cartItem.setProductName(productInDb.getTenSanPham());
			cartItem.setPriceUnit(productInDb.getGiaBan());
			cartItem.setAvatar(productInDb.getAvatar());
			cartItem.setLsp(productInDb.getLoaiSanPham());
			jsonResult.put("successMessage", "Sản phẩm " + cartItem.getProductName() + " đã được thêm vào giỏ hàng!");
			cart.getCartItems().add(cartItem); // thêm mới sản phẩm vào giỏ hàng
		}
		cart.setTotalPrice(this.calculateTotalPrice(request));
		// tính tổng tiền
		//this.calculateTotalPrice(request);
		
		// trả về kết quả
		
		jsonResult.put("code", 200);
		jsonResult.put("status", "success");
		
//		jsonResult.put("cartItemsHtml", cart.getCartItems());
//	    jsonResult.put("totalPrice", cart.getTotalPrice());
		jsonResult.put("totalItems", getTotalItems(request));
		
		// lưu totalItems vào session
		// tất cả các giá trị lưu trên session đều có thể truy cập được từ View
		session.setAttribute("totalItems", getTotalItems(request));
		
		return ResponseEntity.ok(jsonResult);
	}
	
	@RequestMapping(value = { "/ajax/updateQuanlityCart" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_UpdateQuanlityCart(final Model model, 
																	   final HttpServletRequest request,
																	   final HttpServletResponse response, 
																	   final @RequestBody CartItem cartItem) {

		// để lấy session sử dụng thông qua request
		// session tương tự như kiểu Map và được lưu trên main memory.
		HttpSession session = request.getSession();

		// Lấy thông tin giỏ hàng.
		Cart cart = null;
		// kiểm tra xem session có tồn tại đối tượng nào tên là "cart"
		if (session.getAttribute("cart") != null) {
			cart = (Cart) session.getAttribute("cart");
		} else {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}

		// Lấy danh sách sản phẩm có trong giỏ hàng
		List<CartItem> cartItems = cart.getCartItems();

		// kiểm tra nếu có trong giỏ hàng thì tăng số lượng
		BigDecimal total = null;
		int currentProductQuality = 0;
		for (CartItem item : cartItems) {
			if (item.getProductId() == cartItem.getProductId()) {
				SanPham sp = sanPhamService.getById(cartItem.getProductId());
				if(item.getQuanlity() + cartItem.getQuanlity() > sp.getSoLuong()) {
					// trả về kết quả
					Map<String, Object> jsonResult = new HashMap<String, Object>();
					jsonResult.put("code", 400);
					jsonResult.put("status", "error");
					jsonResult.put("errorMessage", "Số lượng sản phẩm " + item.getProductName() + " vượt quá số lượng có sẵn!");
					return ResponseEntity.ok(jsonResult);
				}
				
				if(item.getQuanlity() + cartItem.getQuanlity() < 1) {
					// trả về kết quả
					Map<String, Object> jsonResult = new HashMap<String, Object>();
					jsonResult.put("code", 400);
					jsonResult.put("status", "error");
					jsonResult.put("errorMessage", "Số lượng sản phẩm " + item.getProductName() + " tối thiểu là 1!");
					return ResponseEntity.ok(jsonResult);
				}
				currentProductQuality = item.getQuanlity() + cartItem.getQuanlity();
				item.setQuanlity(currentProductQuality);
				total = item.getPriceUnit().multiply(BigDecimal.valueOf(currentProductQuality));
			}
		}

		// tính tổng tiền
		this.calculateTotalPrice(request);
		cart.setTotalPrice(this.calculateTotalPrice(request));
		// trả về kết quả
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
		jsonResult.put("totalItems", getTotalItems(request));
		jsonResult.put("currentProductQuality", currentProductQuality);
		jsonResult.put("total", total);
		jsonResult.put("totalPrice", formatCurrency(calculateTotalPrice(request)));

		session.setAttribute("totalItems", getTotalItems(request));
		return ResponseEntity.ok(jsonResult);
	}
	
	@RequestMapping(value = { "/cart/deleteProduct" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> deleteProductCart(final Model model, 
															final HttpServletRequest request,
															final HttpServletResponse response, 
															final @RequestBody CartItem cartItem) {
		
		// để lấy session sử dụng thông qua request
		// session tương tự như kiểu Map và được lưu trên main memory.
		HttpSession session = request.getSession();

		// Lấy thông tin giỏ hàng.
		Cart cart = (Cart) session.getAttribute("cart");
		
		// Lấy danh sách sản phẩm có trong giỏ hàng
		List<CartItem> cartItems = cart.getCartItems();
		int index=0;
		for (CartItem ci : cartItems) {
			if(cartItem.getProductId()==ci.getProductId()) {
				break;
			}
			index++;
		}

		cartItems.remove(index);
		
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("message", "Đã xóa thành công");
		return ResponseEntity.ok(jsonResult);
		
	}
	
	@RequestMapping(value = { "/checkout" }, method = RequestMethod.GET)
	public String checkout(final Model model, 
	   				   final HttpServletRequest request, 
	   				   final HttpServletResponse response) {
		if(!isLogined()) {
			return "redirect:/login";
		}
		// đường dẫn tới file view
		return "customer/checkout"; // -> /WEB-INF/views/customer/index.jsp
	}
	
	@RequestMapping(value = { "/checkout" }, method = RequestMethod.POST)
	public String checkoutPost(final Model model, 
						   final HttpServletRequest request, 
						   final HttpServletResponse response) throws IOException {
		
		// Lấy thông tin khách hàng
		String hoTen = request.getParameter("hoTen");
		String diaChi = request.getParameter("diaChi");
		String sdt = request.getParameter("sdt");
		String email = request.getParameter("email");
		String ghiChu = request.getParameter("ghiChu");
		

		// tạo hóa đơn + với thông tin khách hàng lấy được
		DonHang donHang = new DonHang();
		donHang.setTrangThai(1);
		donHang.setHoTen(hoTen);
		donHang.setDiaChi(diaChi);
		donHang.setSdt(sdt);
		donHang.setEmail(email);
		donHang.setNgayDatHang(new Date());
		donHang.setGhiChu(ghiChu);
		donHang.setMaDH(String.valueOf(System.currentTimeMillis())); // mã hóa đơn
		
		if(isLogined()) {
			getUserLogined().addDonHang(donHang);
		}
		
		
		// lấy giỏ hàng
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		donHang.setTongTien(cart.getTotalPrice());
		
		// lấy sản phẩm trong giỏ hàng
		for (CartItem cartItem : cart.getCartItems()) {
			SanPham sp = sanPhamService.getById(cartItem.getProductId());
			if(sp.getTrangThai() > 0 && cartItem.getQuanlity() <= sp.getSoLuong()) {
				DonHangSanPham saleOrderProducts = new DonHangSanPham();
				saleOrderProducts.setSanPham(sp);
				saleOrderProducts.setSoLuong(cartItem.getQuanlity());
				sp.setSoLuong(sp.getSoLuong() - cartItem.getQuanlity());
				sanPhamService.updateAfterCheckout(sp);
				// sử dụng hàm tiện ích add hoặc remove đới với các quan hệ onetomany
				donHang.addSanPham(saleOrderProducts);
			} else {
				model.addAttribute("errorMessage", "Sản phẩm " + sp.getTenSanPham() + " không còn đủ số lượng hoặc không có sẵn!");
				return "customer/checkout";
			}

		}
		
		// lưu vào database
		donHangService.saveOrUpdate(donHang);
		
		// thực hiện reset lại giỏ hàng của Session hiện tại
		session.setAttribute("cart", null);
		session.setAttribute("totalItems", 0);
		
//		User user= getUserLogined();
//		if(user.getUsername() !=null) {
//			return "redirect:/account/order/"+user.getUsername()+"-"+user.getId(); // -> đường dẫn tới View.
//		} else 
		return "redirect:/cart";
		
		
		
	}
	
	private String formatCurrency(BigDecimal value) {
		Locale loc = new Locale("vi", "VN");
	    NumberFormat nf = NumberFormat.getCurrencyInstance(loc);
	    return nf.format(value);
	}
	
	//Tổng số item
	private int getTotalItems(final HttpServletRequest request) {
		HttpSession httpSession = request.getSession();

		if (httpSession.getAttribute("cart") == null) {
			return 0;
		}

		Cart cart = (Cart) httpSession.getAttribute("cart");
		List<CartItem> cartItems = cart.getCartItems();

		int total = 0;
		for (CartItem item : cartItems) {
			total += item.getQuanlity();
		}

		return total;
	}
	
	// Tổng tiền
	private BigDecimal calculateTotalPrice(final HttpServletRequest request) {

		// để lấy session sử dụng thông qua request
		// session tương tự như kiểu Map và được lưu trên main memory.
		HttpSession session = request.getSession();

		// Lấy thông tin giỏ hàng.
		Cart cart = null;
		if (session.getAttribute("cart") != null) {
			cart = (Cart) session.getAttribute("cart");
		} else {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}

		// Lấy danh sách sản phẩm có trong giỏ hàng
		List<CartItem> cartItems = cart.getCartItems();
		BigDecimal total = BigDecimal.ZERO;
		
		for(CartItem ci : cartItems) {
			total = total.add(ci.getPriceUnit().multiply(BigDecimal.valueOf(ci.getQuanlity())));
		}

		cart.setTotalPrice(total);
		
		return total;
	}
}
