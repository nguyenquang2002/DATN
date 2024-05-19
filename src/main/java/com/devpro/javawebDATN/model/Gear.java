package com.devpro.javawebDATN.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "gear")
public class Gear extends BaseEntity{
	@OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "sanpham_id", referencedColumnName = "id")
    private SanPham sanPham;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "loaigear_id", referencedColumnName = "id")
    private LoaiGear loaiGear;

    @Column(name = "ghi_chu")
    private String ghiChu;

	public SanPham getSanPham() {
		return sanPham;
	}

	public void setSanPham(SanPham sanPham) {
		this.sanPham = sanPham;
	}

	public LoaiGear getLoaiGear() {
		return loaiGear;
	}

	public void setLoaiGear(LoaiGear loaiGear) {
		this.loaiGear = loaiGear;
	}

	public String getGhiChu() {
		return ghiChu;
	}

	public void setGhiChu(String ghiChu) {
		this.ghiChu = ghiChu;
	}
}
