package com.devpro.javawebDATN.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "donhang_sanpham")
public class DonHangSanPham extends BaseEntity{
	@ManyToOne
    @JoinColumn(name = "donhang_id", referencedColumnName = "id")
    private DonHang donHang;

    @ManyToOne
    @JoinColumn(name = "sanpham_id", referencedColumnName = "id")
    private SanPham sanPham;

    @Column(name = "SoLuong", nullable = false)
    private int soLuong;

	public DonHang getDonHang() {
		return donHang;
	}

	public void setDonHang(DonHang donHang) {
		this.donHang = donHang;
	}

	public SanPham getSanPham() {
		return sanPham;
	}

	public void setSanPham(SanPham sanPham) {
		this.sanPham = sanPham;
	}

	public int getSoLuong() {
		return soLuong;
	}

	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}
    
    
}
