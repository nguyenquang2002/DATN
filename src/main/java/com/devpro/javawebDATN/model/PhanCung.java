package com.devpro.javawebDATN.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "phancung")
public class PhanCung extends BaseEntity{
	@OneToOne
    @JoinColumn(name = "sanpham_id", referencedColumnName = "id", nullable = false)
    private SanPham sanPham;

    @ManyToOne
    @JoinColumn(name = "loaiphancung_id", referencedColumnName = "id", nullable = false)
    private LoaiPhanCung loaiPhanCung;

    @Column(name = "ghi_chu", columnDefinition = "LONGTEXT")
    private String ghiChu;

	public SanPham getSanPham() {
		return sanPham;
	}

	public void setSanPham(SanPham sanPham) {
		this.sanPham = sanPham;
	}

	public LoaiPhanCung getLoaiPhanCung() {
		return loaiPhanCung;
	}

	public void setLoaiPhanCung(LoaiPhanCung loaiPhanCung) {
		this.loaiPhanCung = loaiPhanCung;
	}

	public String getGhiChu() {
		return ghiChu;
	}

	public void setGhiChu(String ghiChu) {
		this.ghiChu = ghiChu;
	}

	

	
}
