package com.devpro.javawebDATN.services;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.javawebDATN.dto.SanPhamSearchModel;
import com.devpro.javawebDATN.model.HinhAnhSanPham;
import com.devpro.javawebDATN.model.SanPham;

@Service
public class SanPhamService extends BaseService<SanPham>{
	
	@Autowired
	HinhAnhSanPhamService hinhAnhSanPhamService = new HinhAnhSanPhamService();
	
	@Override
	protected Class<SanPham> clazz() {
		// TODO Auto-generated method stub
		return SanPham.class;
	}
	
	private boolean isEmptyUploadFile(MultipartFile image) {
		return image == null || image.getOriginalFilename().isEmpty();
	}
	
	/**
	 * dùng để kiểm tra xem admin có upload ảnh product hay không
	 * @param images
	 * @return
	 */
	private boolean isEmptyUploadFile(MultipartFile[] images) {
		if (images == null || images.length <= 0)
			return true;

		if (images.length == 1 && images[0].getOriginalFilename().isEmpty())
			return true;

		return false;
	}
	
	private String getUniqueUploadFileName(String fileName) {
		String[] splitFileName = fileName.split("\\.");
		return splitFileName[0] + System.currentTimeMillis() + "." + splitFileName[1];
	}
	
	@Transactional
	public SanPham add(SanPham sp, MultipartFile spAvatar, String loaiSP, MultipartFile[] spAnh) throws IllegalStateException, IOException{
		
		if(sp.getTrangThai() == 0 && sp.getSoLuong() > 0) {
			sp.setTrangThai(1);
		}
		if(sp.getTrangThai() > 0 && sp.getSoLuong() <= 0) {
			sp.setTrangThai(0);
		}
		
		if (!isEmptyUploadFile(spAvatar)) { // có đẩy avatar lên.
			
			String fileName = getUniqueUploadFileName(spAvatar.getOriginalFilename());
			
			// tạo đường dẫn tới folder chứa avatar
			String pathToAvatar = "D:/upload/product/avatar/" + loaiSP + "/" + fileName;

			// lưu avatar vào đường dẫn trên
			spAvatar.transferTo(new File(pathToAvatar));

			sp.setAvatar("product/avatar/" + loaiSP + "/" + fileName);
		}
		
		// có đẩy pictures(product_images) ???
		if (!isEmptyUploadFile(spAnh)) { // có đẩy pictures lên.

			// nếu admin đẩy lên thì duyệt tất cả file đẩy lên và lưu trên server
			for (MultipartFile pic : spAnh) {
				String fileName = getUniqueUploadFileName(pic.getOriginalFilename());
				
				// lưu ảnh admin đẩy lên vào server
				pic.transferTo(new File("D:/upload/product/pictures/" + loaiSP + "/" + fileName));

				// tạo mới 1 bản ghi product_images
				HinhAnhSanPham hinhAnh = new HinhAnhSanPham();
				hinhAnh.setPath("product/pictures/" + loaiSP + "/" + fileName);
				hinhAnh.setTitle(fileName);
				
				sp.addHinhAnh(hinhAnh);
			}
		}

		// tạo seo: bổ sung thêm thời gian tính bằng miliseconds để tránh trùng seo
		// p.setSeo(new Slugify().slugify(p.getTitle() + "-" + System.currentTimeMillis()));
				
		return super.saveOrUpdate(sp);
	}
	
	@Transactional
	public SanPham update(SanPham sp, MultipartFile spAvatar, String loaiSP, MultipartFile[] spAnh) throws IllegalStateException, IOException{
		
		if(sp.getTrangThai() == 0 && sp.getSoLuong() > 0) {
			sp.setTrangThai(1);
		}
		if(sp.getTrangThai() > 0 && sp.getSoLuong() <= 0) {
			sp.setTrangThai(0);
		}
		
		String avaTemp = sp.getAvatar();
		SanPham spInDB = super.getById(sp.getId());
		
		// có đẩy avartar ??? => xóa avatar cũ đi và thêm avatar mới
		if (!isEmptyUploadFile(spAvatar)) {
			// xóa avatar trong folder lên
			new File("D:/upload/" + spInDB.getAvatar()).delete();

			// update avatar mới
			String fileName = getUniqueUploadFileName(spAvatar.getOriginalFilename());
			spAvatar.transferTo(new File("D:/upload/product/avatar/" + loaiSP + "/" + fileName));
			sp.setAvatar("product/avatar/" + loaiSP + "/" + fileName);
		} 
		else {
			// sử dụng lại avartar cũ
			sp.setAvatar(avaTemp);
		}
		// có đẩy pictures(product_images) ???
		if (!isEmptyUploadFile(spAnh)) { // có đẩy pictures lên.
			List<HinhAnhSanPham> hinhAnhTemp = new ArrayList<HinhAnhSanPham>();
			// Lặp qua danh sách hình ảnh cần xóa và thêm vào danh sách tạm thời
			for (HinhAnhSanPham hinhAnh : spInDB.getHinhAnhSanPhams()) {
				hinhAnhTemp.add(hinhAnh);
			}
			// xóa pictures cũ
			if(hinhAnhTemp != null && hinhAnhTemp.size() > 0) {
				for (HinhAnhSanPham hinhAnh : hinhAnhTemp) {
					// xóa avatar trong folder lên
					new File("D:/upload/" + hinhAnh.getPath()).delete();
					
					sp.deleteHinhAnh(hinhAnh);
					
					// xóa dữ liệu trong database
					hinhAnhSanPhamService.delete(hinhAnh);
				}
			}

			// update pictures mới
			for (MultipartFile pic : spAnh) {
				String fileName = getUniqueUploadFileName(pic.getOriginalFilename());
				
				// lưu ảnh admin đẩy lên vào server
				pic.transferTo(new File("D:/upload/product/pictures/" + loaiSP + "/" + fileName));

				// tạo mới 1 bản ghi product_images
				HinhAnhSanPham hinhAnh = new HinhAnhSanPham();
				hinhAnh.setPath("product/pictures/" + loaiSP + "/" + fileName);
				hinhAnh.setTitle(fileName);
				
				sp.addHinhAnh(hinhAnh);
			}
		}

		// tạo seo: bổ sung thêm thời gian tính bằng miliseconds để tránh trùng seo
		// p.setSeo(new Slugify().slugify(p.getTitle() + "-" + System.currentTimeMillis()));
		
		
		return super.saveOrUpdate(sp);
	}
	
	@Transactional
	public SanPham updateAfterCheckout(SanPham sp) {
		if(sp.getTrangThai() == 0 && sp.getSoLuong() > 0) {
			sp.setTrangThai(1);
		}
		if(sp.getTrangThai() > 0 && sp.getSoLuong() <= 0) {
			sp.setTrangThai(0);
		}
		return super.saveOrUpdate(sp);
	}
	
	public PagerData<SanPham> search(SanPhamSearchModel searchModel){
		// khởi tạo câu lệnh
			String sql = "SELECT * FROM sanpham p WHERE 1=1";

			if (searchModel != null) {
				
				// tìm kiếm theo category
				if(searchModel.getBrandID() != null && searchModel.getBrandID() > 0) {
					sql += " and brand_id = " + searchModel.getBrandID();
				}
				
				if(searchModel.getLoaiSP() != null && searchModel.getLoaiSP() > 0) {
					sql += " and loai_san_pham = " + searchModel.getLoaiSP();
				}
			
				// tìm theo seo
//							if (!StringUtils.isEmpty(searchModel.seo)) {
//								sql += " and p.seo = '" + searchModel.seo + "'";
//							}

				// tìm kiếm sản phẩm hot
//							if (searchModel.isHot != null) {
//								sql += " and p.is_hot = '" + searchModel.seo + "'";
//							}
				
				// tìm kiếm theo title và description
				if (!StringUtils.isEmpty(searchModel.getKeyword())) {
					sql += " and (p.ten_san_pham like '%" + searchModel.getKeyword() + "%'" + 
							     " or p.mo_ta like '%" + searchModel.getKeyword() + "%')";
				}
			}
			sql+=" order by id desc";
			this.setSizeOfPage(5);
		return getEntitiesByNativeSQL(sql, searchModel.getPage());
	}
	
	public PagerData<SanPham> listSP(SanPhamSearchModel searchModel){
		// khởi tạo câu lệnh
			String sql = "SELECT * FROM sanpham p WHERE trang_thai >= 0";

			if (searchModel != null) {
				
				// tìm kiếm theo category
				if(searchModel.getBrandID() != null && searchModel.getBrandID() > 0) {
					sql += " and brand_id = " + searchModel.getBrandID();
				}
				
				if(searchModel.getLoaiSP() != null && searchModel.getLoaiSP() > 0) {
					sql += " and loai_san_pham = " + searchModel.getLoaiSP();
				}
			
				// tìm theo seo
//							if (!StringUtils.isEmpty(searchModel.seo)) {
//								sql += " and p.seo = '" + searchModel.seo + "'";
//							}

				// tìm kiếm sản phẩm hot
//							if (searchModel.isHot != null) {
//								sql += " and p.is_hot = '" + searchModel.seo + "'";
//							}
				
				// tìm kiếm theo title và description
				if (!StringUtils.isEmpty(searchModel.getKeyword())) {
					sql += " and (p.ten_san_pham like '%" + searchModel.getKeyword() + "%'" + 
							     " or p.mo_ta like '%" + searchModel.getKeyword() + "%')";
				}
				
				if (!StringUtils.isEmpty(searchModel.getPrice())) {
					sql += " and gia_tien * (1 - giam_gia / 100) " + searchModel.getPrice();
				}
			}
			sql+=" order by id desc";
			this.setSizeOfPage(8);
		return getEntitiesByNativeSQL(sql, searchModel.getPage());
	}
}