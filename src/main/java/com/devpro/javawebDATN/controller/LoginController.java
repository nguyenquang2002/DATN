package com.devpro.javawebDATN.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.javawebDATN.model.TaiKhoan;

@Controller
public class LoginController extends BaseController{

	@RequestMapping(value = { "/login" }, method = RequestMethod.GET)
	public String login(final Model model, 
	   				   final HttpServletRequest request, 
	   				   final HttpServletResponse response) {
		
		TaiKhoan user = new TaiKhoan();
		model.addAttribute("user", user);
		// đường dẫn tới file view
		return "customer/login"; // -> /WEB-INF/views/customer/index.jsp
	}
}
