package com.devpro.javawebDATN.services;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.devpro.javawebDATN.dto.BrandSearchModel;
import com.devpro.javawebDATN.model.Brand;

@Service
public class BrandService extends BaseService<Brand>{

	@Override
	protected Class<Brand> clazz() {
		// TODO Auto-generated method stub
		return Brand.class;
	}
	
	public PagerData<Brand> search(BrandSearchModel searchModel){
		String sql = "SELECT * FROM brand b WHERE 1=1";
		if(searchModel != null) {
			if (!StringUtils.isEmpty(searchModel.getKeyword())) {
				sql += " and (b.ten_hang like '%" + searchModel.getKeyword() + "%'" + 
						     " or b.ghi_chu like '%" + searchModel.getKeyword() + "%')";
			}
		}
		return getEntitiesByNativeSQL(sql, searchModel.getPage());
	}
}
