package com.devpro.javawebDATN.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.springframework.security.core.GrantedAuthority;

@Entity
@Table(name = "chucvu")
public class ChucVu extends BaseEntity implements GrantedAuthority{
	@Column(name = "chuc_vu", nullable = false)
    private String chucVu;

    @Column(name = "ghi_chu")
    private String ghiChu;

	public String getChucVu() {
		return chucVu;
	}

	public void setChucVu(String chucVu) {
		this.chucVu = chucVu;
	}

	public String getGhiChu() {
		return ghiChu;
	}

	public void setGhiChu(String ghiChu) {
		this.ghiChu = ghiChu;
	}

	@Override
	public String getAuthority() {
		// TODO Auto-generated method stub
		return this.chucVu;
	}
}
