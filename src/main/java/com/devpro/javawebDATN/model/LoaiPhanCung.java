package com.devpro.javawebDATN.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "loaiphancung")
public class LoaiPhanCung extends BaseEntity{
	@Column(name = "loai_phan_cung")
    private String loaiPhanCung;

    @Column(name = "ghi_chu")
    private String ghiChu;

	public String getLoaiPhanCung() {
		return loaiPhanCung;
	}

	public void setLoaiPhanCung(String loaiPhanCung) {
		this.loaiPhanCung = loaiPhanCung;
	}

	public String getGhiChu() {
		return ghiChu;
	}

	public void setGhiChu(String ghiChu) {
		this.ghiChu = ghiChu;
	}
    
}
