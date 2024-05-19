package com.devpro.javawebDATN.controller.administrator;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.javawebDATN.controller.BaseController;
import com.devpro.javawebDATN.dto.BrandSearchModel;
import com.devpro.javawebDATN.model.Brand;
import com.devpro.javawebDATN.services.BrandService;
import com.devpro.javawebDATN.services.PagerData;

@Controller
public class AdminBrandController extends BaseController{
	@Autowired
	BrandService brandService = new BrandService();
	
	@RequestMapping(value = { "admin/brand" }, method = RequestMethod.GET)
	public String listBrand(final Model model, 
	   				   final HttpServletRequest request, 
	   				   final HttpServletResponse response) {
		
		String keyword = request.getParameter("keyword");
		
		
		BrandSearchModel searchModel = new BrandSearchModel();
		searchModel.setKeyword(keyword);
		
		searchModel.setPage(getCurrentPage(request));
		
		
		PagerData<Brand> brands = brandService.search(searchModel);
		
		model.addAttribute("brands", brands);
		model.addAttribute("searchModel", searchModel);
		// đường dẫn tới file view
		return "administrator/brands"; // -> /WEB-INF/views/customer/index.jsp
	}
	
	@RequestMapping(value = { "admin/brand/add" }, method = RequestMethod.GET)
	public String brandGet(final Model model, 
	   				   final HttpServletRequest request, 
	   				   final HttpServletResponse response) {
		Brand brand = new Brand();
		model.addAttribute("brand", brand);
		return "administrator/add_brand";
	}
	
	@RequestMapping(value = { "admin/brand/add" }, method = RequestMethod.POST)
	public String brandPost(final Model model, 
	   				   final HttpServletRequest request, 
	   				   final HttpServletResponse response,
	   				   final @ModelAttribute("brand") Brand brand) {
		brandService.saveOrUpdate(brand);
		return "redirect:/admin/brand";
	}
}
