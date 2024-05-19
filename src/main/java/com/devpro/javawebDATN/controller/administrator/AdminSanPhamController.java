package com.devpro.javawebDATN.controller.administrator;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.javawebDATN.controller.BaseController;
import com.devpro.javawebDATN.dto.SanPhamSearchModel;
import com.devpro.javawebDATN.model.Brand;
import com.devpro.javawebDATN.model.CauHinhLaptop;
import com.devpro.javawebDATN.model.CauHinhPC;
import com.devpro.javawebDATN.model.Gear;
import com.devpro.javawebDATN.model.Laptop;
import com.devpro.javawebDATN.model.LoaiGear;
import com.devpro.javawebDATN.model.LoaiPhanCung;
import com.devpro.javawebDATN.model.PC;
import com.devpro.javawebDATN.model.PhanCung;
import com.devpro.javawebDATN.model.SanPham;
import com.devpro.javawebDATN.services.BrandService;
import com.devpro.javawebDATN.services.CauHinhLaptopService;
import com.devpro.javawebDATN.services.GearService;
import com.devpro.javawebDATN.services.LaptopService;
import com.devpro.javawebDATN.services.LoaiGearService;
import com.devpro.javawebDATN.services.LoaiPhanCungService;
import com.devpro.javawebDATN.services.PCService;
import com.devpro.javawebDATN.services.PagerData;
import com.devpro.javawebDATN.services.PhanCungService;
import com.devpro.javawebDATN.services.SanPhamService;

@Controller
public class AdminSanPhamController extends BaseController{
	
	@Autowired
	SanPhamService sanPhamService = new SanPhamService();
	@Autowired
	BrandService brandService = new BrandService();
	@Autowired
	LaptopService laptopService = new LaptopService();
	@Autowired
	PCService pcService = new PCService();
	@Autowired
	CauHinhLaptopService cauHinhLaptopService = new CauHinhLaptopService();
	@Autowired
	LoaiPhanCungService loaiPhanCungService = new LoaiPhanCungService();
	@Autowired
	PhanCungService phanCungService = new PhanCungService();
	@Autowired
	LoaiGearService loaiGearService = new LoaiGearService();
	@Autowired
	GearService gearService = new GearService();
	
	@RequestMapping(value = { "admin/product" }, method = RequestMethod.GET)
	public String listSP(final Model model, 
	   				   final HttpServletRequest request, 
	   				   final HttpServletResponse response) {
		
		String keyword = request.getParameter("keyword");
		Integer brandID = getInteger(request, "brandID");
		Integer lsp = getInteger(request, "loaiSP");
		
		SanPhamSearchModel searchModel = new SanPhamSearchModel();
		searchModel.setKeyword(keyword);
		searchModel.setBrandID(brandID);
		searchModel.setLoaiSP(lsp);
		searchModel.setPage(getCurrentPage(request));
		
		List<Brand> brands = brandService.findAll();
		PagerData<SanPham> listSP = sanPhamService.search(searchModel);
		model.addAttribute("products", listSP);
		model.addAttribute("brands", brands);
		model.addAttribute("searchModel", searchModel);
		// đường dẫn tới file view
		return "administrator/products"; // -> /WEB-INF/views/customer/index.jsp
	}
	
	@RequestMapping(value = { "/admin/product/delete" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> deleteProduct(final Model model, 
															final HttpServletRequest request,
															final HttpServletResponse response, 
															final @RequestBody SanPham sanPham) {
		
		SanPham productInDb = sanPhamService.getById(sanPham.getId());
		productInDb.setTrangThai(-2);
		sanPhamService.saveOrUpdate(productInDb);
		
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("message", "Đã xóa thành công");
		return ResponseEntity.ok(jsonResult);
		
	}
	
	@RequestMapping(value = { "admin/product/computer/{spid}" }, method = RequestMethod.GET)
	public String computer(final Model model, 
	   				   final HttpServletRequest request, 
	   				   final HttpServletResponse response,
	   				   @PathVariable("spid") int spid) {
		PhanCung mainboard = new PhanCung();
		PhanCung cpu = new PhanCung();
		PhanCung ram = new PhanCung();
		int soLuongRam = 1;
		PhanCung vga = new PhanCung();
		PhanCung harddrive = new PhanCung();
		PhanCung fan = new PhanCung();
		PhanCung psu = new PhanCung();
		PhanCung casePC = new PhanCung();
		List<Brand> brands = brandService.findAll();
		List<PhanCung> phanCungs = phanCungService.findAll();
		PC computer = pcService.findBySanPhamID(spid);
		
		for (CauHinhPC cauHinh : computer.cauHinhPCs) {
			if(cauHinh.getPhanCung().getLoaiPhanCung().getId() == 1) {
				mainboard = cauHinh.getPhanCung();
			}
			if(cauHinh.getPhanCung().getLoaiPhanCung().getId() == 2) {
				cpu = cauHinh.getPhanCung();
			}
			if(cauHinh.getPhanCung().getLoaiPhanCung().getId() == 3) {
				ram = cauHinh.getPhanCung();
				soLuongRam = cauHinh.getSoLuong();
			}
			if(cauHinh.getPhanCung().getLoaiPhanCung().getId() == 4) {
				vga = cauHinh.getPhanCung();
			}
			if(cauHinh.getPhanCung().getLoaiPhanCung().getId() == 5) {
				harddrive = cauHinh.getPhanCung();
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
		
		model.addAttribute("brands",brands);
		model.addAttribute("phanCungs",phanCungs);
		model.addAttribute("computer",computer);
		model.addAttribute("mainboard",mainboard);
		model.addAttribute("cpu",cpu);
		model.addAttribute("ram",ram);
		model.addAttribute("soLuongRam",soLuongRam);
		model.addAttribute("vga",vga);
		model.addAttribute("harddrive",harddrive);
		model.addAttribute("fan",fan);
		model.addAttribute("psu",psu);
		model.addAttribute("casePC",casePC);
		// đường dẫn tới file view
		return "administrator/computer"; // -> /WEB-INF/views/customer/index.jsp
	}
	
	@RequestMapping(value = { "admin/product/computer" }, method = RequestMethod.GET)
	public String computerNew(final Model model, 
	   				   final HttpServletRequest request, 
	   				   final HttpServletResponse response) {
		PhanCung mainboard = new PhanCung();
		PhanCung cpu = new PhanCung();
		PhanCung ram = new PhanCung();
		PhanCung vga = new PhanCung();
		PhanCung harddrive = new PhanCung();
		PhanCung fan = new PhanCung();
		PhanCung psu = new PhanCung();
		PhanCung casePC = new PhanCung();
		List<Brand> brands = brandService.findAll();
		List<PhanCung> phanCungs = phanCungService.findAll();
		PC computer = new PC();
		
		
		model.addAttribute("brands",brands);
		model.addAttribute("phanCungs",phanCungs);
		model.addAttribute("computer",computer);
		model.addAttribute("mainboard",mainboard);
		model.addAttribute("cpu",cpu);
		model.addAttribute("ram",ram);
		model.addAttribute("soLuongRam",1);
		model.addAttribute("vga",vga);
		model.addAttribute("harddrive",harddrive);
		model.addAttribute("fan",fan);
		model.addAttribute("psu",psu);
		model.addAttribute("casePC",casePC);
		// đường dẫn tới file view
		return "administrator/computer"; // -> /WEB-INF/views/customer/index.jsp
	}
	
	@RequestMapping(value = { "admin/product/computer" }, method = RequestMethod.POST)
	public String computerPost(final Model model, 
		   				   final HttpServletRequest request, 
		   				   final HttpServletResponse response,
		   				   @ModelAttribute("computer") PC pc,
		   				   final @RequestParam("spAvatar") MultipartFile spAvatar,
		   				   final @RequestParam("spAnh") MultipartFile[] spAnh) throws Exception {
		PhanCung cpu = phanCungService.getById(Integer.parseInt(request.getParameter("cpu")));
		PhanCung ram = phanCungService.getById(Integer.parseInt(request.getParameter("ram")));
		PhanCung vga = phanCungService.getById(Integer.parseInt(request.getParameter("vga")));
		PhanCung hd = phanCungService.getById(Integer.parseInt(request.getParameter("harddrive")));
		PhanCung mainboard = phanCungService.getById(Integer.parseInt(request.getParameter("mainboard")));
		PhanCung fan = phanCungService.getById(Integer.parseInt(request.getParameter("fan")));
		PhanCung psu = phanCungService.getById(Integer.parseInt(request.getParameter("psu")));
		PhanCung casePC = phanCungService.getById(Integer.parseInt(request.getParameter("casePC")));
		int soLuongRam = Integer.parseInt(request.getParameter("soLuongRam"));

		if(pc.getId() != null) {
			pcService.update(pc,spAvatar,spAnh,cpu,ram,hd,vga,mainboard,fan,psu,casePC,soLuongRam);
		}
		else {
			pcService.add(pc,spAvatar,spAnh,cpu,ram,hd,vga,mainboard,fan,psu,casePC,soLuongRam);
		}
		// đường dẫn tới file view
		return "redirect:/admin/product"; 
	}
	
	@RequestMapping(value = { "admin/product/laptop/{spid}" }, method = RequestMethod.GET)
	public String laptop(final Model model, 
	   				   final HttpServletRequest request, 
	   				   final HttpServletResponse response,
	   				   @PathVariable("spid") int spid) {
		PhanCung cpu = new PhanCung();
		PhanCung ram = new PhanCung();
		PhanCung harddrive = new PhanCung();
		PhanCung vga = new PhanCung();
		List<Brand> brands = brandService.findAll();
		List<PhanCung> phanCungs = phanCungService.findAll();
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
		
		
		model.addAttribute("brands",brands);
		model.addAttribute("phanCungs",phanCungs);
		model.addAttribute("laptop",lap);
		model.addAttribute("cpu",cpu);
		model.addAttribute("ram",ram);
		model.addAttribute("harddrive",harddrive);
		model.addAttribute("vga",vga);
		// đường dẫn tới file view
		return "administrator/laptop"; // -> /WEB-INF/views/customer/index.jsp
	}
	
	@RequestMapping(value = { "admin/product/laptop" }, method = RequestMethod.GET)
	public String laptopNew(final Model model, 
	   				   final HttpServletRequest request, 
	   				   final HttpServletResponse response) {
		PhanCung cpu = new PhanCung();
		PhanCung ram = new PhanCung();
		PhanCung harddrive = new PhanCung();
		PhanCung vga = new PhanCung();
		List<Brand> brands = brandService.findAll();
		Laptop laptop = new Laptop();
		List<PhanCung> phanCungs = phanCungService.findAll();
		model.addAttribute("phanCungs",phanCungs);
		model.addAttribute("brands",brands);
		model.addAttribute("laptop",laptop);
		model.addAttribute("cpu",cpu);
		model.addAttribute("ram",ram);
		model.addAttribute("harddrive",harddrive);
		model.addAttribute("vga",vga);
		// đường dẫn tới file view
		return "administrator/laptop"; // -> /WEB-INF/views/customer/index.jsp
	}
	
	@RequestMapping(value = { "admin/product/laptop" }, method = RequestMethod.POST)
	public String laptopPost(final Model model, 
		   				   final HttpServletRequest request, 
		   				   final HttpServletResponse response,
		   				   @ModelAttribute("laptop") Laptop laptop,
		   				   final @RequestParam("spAvatar") MultipartFile spAvatar,
		   				   final @RequestParam("spAnh") MultipartFile[] spAnh) throws Exception {
		PhanCung cpu = phanCungService.getById(Integer.parseInt(request.getParameter("cpu")));
		PhanCung ram = phanCungService.getById(Integer.parseInt(request.getParameter("ram")));
		PhanCung hd = phanCungService.getById(Integer.parseInt(request.getParameter("harddrive")));
		PhanCung vga = phanCungService.getById(Integer.parseInt(request.getParameter("vga")));
		
		if(laptop.getId() != null) {
			laptopService.update(laptop,spAvatar,spAnh,cpu,ram,hd,vga);
		}
		else {
			laptopService.add(laptop,spAvatar,spAnh,cpu,ram,hd,vga);
		}
		// đường dẫn tới file view
		return "redirect:/admin/product"; 
	}
	
	@RequestMapping(value = { "admin/product/hardware/{spid}" }, method = RequestMethod.GET)
	public String hardware(final Model model, 
	   				   final HttpServletRequest request, 
	   				   final HttpServletResponse response,
	   				   @PathVariable("spid") int spid) {
		
		List<Brand> brands = brandService.findAll();
		List<LoaiPhanCung> loaiPhanCungs = loaiPhanCungService.findAll();
		PhanCung hard = phanCungService.findBySanPhamID(spid);
		model.addAttribute("brands",brands);
		model.addAttribute("loaiPhanCungs",loaiPhanCungs);
		model.addAttribute("hardware",hard);
		// đường dẫn tới file view
		return "administrator/hardware"; // -> /WEB-INF/views/customer/index.jsp
	}
	
	@RequestMapping(value = { "admin/product/hardware" }, method = RequestMethod.GET)
	public String hardwareNew(final Model model, 
	   				   final HttpServletRequest request, 
	   				   final HttpServletResponse response) {
		
		List<LoaiPhanCung> loaiPhanCungs = loaiPhanCungService.findAll();
		List<Brand> brands = brandService.findAll();
		PhanCung phanCung = new PhanCung();
		
		model.addAttribute("brands",brands);
		model.addAttribute("loaiPhanCungs",loaiPhanCungs);
		model.addAttribute("hardware",phanCung);
		// đường dẫn tới file view
		return "administrator/hardware"; // -> /WEB-INF/views/customer/index.jsp
	}
	
	@RequestMapping(value = { "admin/product/hardware" }, method = RequestMethod.POST)
	public String hardwarePost(final Model model, 
		   				   final HttpServletRequest request, 
		   				   final HttpServletResponse response,
		   				   @ModelAttribute("hardware") PhanCung hardware,
		   				   final @RequestParam("spAvatar") MultipartFile spAvatar,
		   				   final @RequestParam("spAnh") MultipartFile[] spAnh) throws Exception {
		
		if(hardware.getId() != null) {
			phanCungService.update(hardware,spAvatar,spAnh);
		}
		else phanCungService.add(hardware,spAvatar,spAnh);
		// đường dẫn tới file view
		return "redirect:/admin/product"; // -> /WEB-INF/views/customer/index.jsp
	}
	
	@RequestMapping(value = { "admin/product/gear/{spid}" }, method = RequestMethod.GET)
	public String gear(final Model model, 
	   				   final HttpServletRequest request, 
	   				   final HttpServletResponse response,
	   				   @PathVariable("spid") int spid) {
		
		List<Brand> brands = brandService.findAll();
		List<LoaiGear> loaiGears = loaiGearService.findAll();
		Gear gear = gearService.findBySanPhamID(spid);
		model.addAttribute("brands",brands);
		model.addAttribute("loaiGears",loaiGears);
		model.addAttribute("gear",gear);
		// đường dẫn tới file view
		return "administrator/gear"; // -> /WEB-INF/views/customer/index.jsp
	}
	
	@RequestMapping(value = { "admin/product/gear" }, method = RequestMethod.GET)
	public String gearNew(final Model model, 
	   				   final HttpServletRequest request, 
	   				   final HttpServletResponse response) {
		
		List<Brand> brands = brandService.findAll();
		List<LoaiGear> loaiGears = loaiGearService.findAll();
		Gear gear = new Gear();
		
		model.addAttribute("brands",brands);
		model.addAttribute("loaiGears",loaiGears);
		model.addAttribute("gear",gear);
		// đường dẫn tới file view
		return "administrator/gear"; // -> /WEB-INF/views/customer/index.jsp
	}
	
	@RequestMapping(value = { "admin/product/gear" }, method = RequestMethod.POST)
	public String gearPost(final Model model, 
		   				   final HttpServletRequest request, 
		   				   final HttpServletResponse response,
		   				   @ModelAttribute("gear") Gear gear,
		   				   final @RequestParam("spAvatar") MultipartFile spAvatar,
		   				   final @RequestParam("spAnh") MultipartFile[] spAnh) throws Exception {
		
		if(gear.getId() != null) {
			gearService.update(gear,spAvatar,spAnh);
		}
		else gearService.add(gear,spAvatar,spAnh);
		// đường dẫn tới file view
		return "redirect:/admin/product"; // -> /WEB-INF/views/customer/index.jsp
	}
}
