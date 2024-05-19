package com.devpro.javawebDATN.services;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.devpro.javawebDATN.dto.DonHangSearchModel;
import com.devpro.javawebDATN.model.DonHang;

@Service
public class DonHangService extends BaseService<DonHang>{

	
	@Override
	protected Class<DonHang> clazz() {
		// TODO Auto-generated method stub
		return DonHang.class;
	}
	
	public PagerData<DonHang> findDonHangsByUserID(int taiKhoanID, DonHangSearchModel searchModel){
		String sql = "SELECT * FROM donhang WHERE taikhoan_id = " + taiKhoanID +" ORDER BY madh DESC";
		this.setSizeOfPage(5);
		return getEntitiesByNativeSQL(sql, searchModel.getPage());
	}
	
	public PagerData<DonHang> search(DonHangSearchModel searchModel){
		String sql = "SELECT * FROM donhang WHERE 1=1";
		if(searchModel != null) {
			
			if(searchModel.getTrangThai() != null && searchModel.getTrangThai()>-1) {
				sql += " and trang_thai = " + searchModel.getTrangThai();
			}
			if (!StringUtils.isEmpty(searchModel.getKeyword())) {
				sql += " and (o.madh like '%" + searchModel.getKeyword() + "%'" + 
							" or o.taikhoan_id like '%" + searchModel.getKeyword() + "%'" +
							" or o.ho_ten like '%" + searchModel.getKeyword() + "%'" +
							" or o.sdt like '%" + searchModel.getKeyword() + "%'" +
							" or o.email like '%" + searchModel.getKeyword() + "%'" +
						     " or o.dia_chi like '%" + searchModel.getKeyword() + "%')";
			}
		}
		sql+=" order by id desc";
		return getEntitiesByNativeSQL(sql, searchModel.getPage());
	}
}
