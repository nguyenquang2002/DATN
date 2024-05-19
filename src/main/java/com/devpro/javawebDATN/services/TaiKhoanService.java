package com.devpro.javawebDATN.services;



import java.io.IOException;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.devpro.javawebDATN.dto.TaiKhoanSearchModel;
import com.devpro.javawebDATN.model.TaiKhoan;

@Service
public class TaiKhoanService extends BaseService<TaiKhoan>{

	@Override
	protected Class<TaiKhoan> clazz() {
		// TODO Auto-generated method stub
		return TaiKhoan.class;
	}
	
	public TaiKhoan loadUserByUsername(String userName) {
		String sql = "select * from taikhoan u where u.tai_khoan = '" + userName + "' and trang_thai = 1";
		return this.getEntityByNativeSQL(sql);
	}
	
	public TaiKhoan findByUsername(String userName) {
		List<TaiKhoan> list = this.getEntitiesByNativeSQL("select * from taikhoan");
		for (TaiKhoan taiKhoan : list) {
			if(taiKhoan.getUsername().equals(userName)) {
				return taiKhoan;
				
			}
		}
		return null;
	}
	
	public TaiKhoan findByEmail(String email) {
		List<TaiKhoan> list = this.getEntitiesByNativeSQL("select * from taikhoan");
		for (TaiKhoan taiKhoan : list) {
			if(taiKhoan.getEmail().equals(email)) {
				return taiKhoan;
				
			}
		}
		return null;
	}
	
	@Transactional
	public TaiKhoan add(TaiKhoan u) throws IllegalStateException, IOException {
		u.setPassword(new BCryptPasswordEncoder(4).encode(u.getPassword()));
		u.setTrangThai(1);
		return this.saveOrUpdate(u);
	}
	@Transactional
	public TaiKhoan update(TaiKhoan u) throws IllegalStateException, IOException {
		return this.saveOrUpdate(u);
	}
	
	public PagerData<TaiKhoan> search(TaiKhoanSearchModel searchModel, boolean isAdmin) {
		String sql = "SELECT * FROM taikhoan u WHERE 1=1";
		if(!isAdmin) {
			sql += " and chucvu_id > 2";
		}
		if (searchModel != null) {
			if(searchModel.getRoleId() != null && searchModel.getRoleId() > 0) {
				sql += " and chucvu_id = " + searchModel.getRoleId();
			}
			if (!StringUtils.isEmpty(searchModel.getKeyword())) {
				sql += " and (u.ho_ten like '%" + searchModel.getKeyword() + "%'" + 
							" or u.dia_chi like '%" + searchModel.getKeyword() + "%'" +
							" or u.tai_khoan like '%" + searchModel.getKeyword() + "%'" +
							" or u.email like '%" + searchModel.getKeyword() + "%'" +
						     " or u.sdt like '%" + searchModel.getKeyword() + "%')";
			}
		}
		sql+=" order by id desc";
		this.setSizeOfPage(5);
		return getEntitiesByNativeSQL(sql, searchModel.getPage());
	}
}
