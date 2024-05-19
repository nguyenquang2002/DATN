package com.devpro.javawebDATN.model;

import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Locale;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.ibm.icu.text.NumberFormat;


@Entity
@Table(name = "sanpham")
public class SanPham extends BaseEntity{
	@Column(name = "TenSanPham")
    private String tenSanPham;

    @Column(name = "GiaTien")
    private BigDecimal giaTien;

    @Column(name = "GiamGia")
    private float giamGia;
    

    @Column(name = "SoLuong")
    private int soLuong;

    @Column(name = "LoaiSanPham")
    private int loaiSanPham;

    @Column(name = "TrangThai")
    private int trangThai;
    
    @Column(name = "mo_ta", columnDefinition = "LONGTEXT")
    private String moTa;
    
    

	@Column(name = "avatar")
    private String avatar;
    
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "sanPham")
    private Set<HinhAnhSanPham> hinhAnhSanPhams = new HashSet<HinhAnhSanPham>();
    public void addHinhAnh(HinhAnhSanPham hinhAnh) {
    	hinhAnh.setSanPham(this);
    	hinhAnhSanPhams.add(hinhAnh);
    }
    
    public void deleteHinhAnh(HinhAnhSanPham hinhAnh) {
    	hinhAnh.setSanPham(null);
    	hinhAnhSanPhams.remove(hinhAnh);
    }
    
    
    public Set<HinhAnhSanPham> getHinhAnhSanPhams() {
		return hinhAnhSanPhams;
	}

	public void setHinhAnhSanPhams(Set<HinhAnhSanPham> hinhAnhSanPhams) {
		this.hinhAnhSanPhams = hinhAnhSanPhams;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	@ManyToOne
    @JoinColumn(name = "Brand_id", nullable = false)
    private Brand brand;

	public String getTenSanPham() {
		return tenSanPham;
	}

	public void setTenSanPham(String tenSanPham) {
		this.tenSanPham = tenSanPham;
	}

	public BigDecimal getGiaTien() {
		return giaTien;
	}

	public void setGiaTien(BigDecimal giaTien) {
		this.giaTien = giaTien;
	}

	public float getGiamGia() {
		return giamGia;
	}

	public void setGiamGia(float giamGia) {
		this.giamGia = giamGia;
	}

	public int getSoLuong() {
		return soLuong;
	}

	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}

	public int getLoaiSanPham() {
		return loaiSanPham;
	}

	public void setLoaiSanPham(int loaiSanPham) {
		this.loaiSanPham = loaiSanPham;
	}

	public int getTrangThai() {
		return trangThai;
	}

	public void setTrangThai(int trangThai) {
		this.trangThai = trangThai;
	}
	
	public String getMoTa() {
		return moTa;
	}

	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}

	public Brand getBrand() {
		return brand;
	}

	public void setBrand(Brand brand) {
		this.brand = brand;
	}
    public BigDecimal getGiaBan() {
    	BigDecimal salePercent = new BigDecimal(this.getGiamGia()).divide(new BigDecimal(100));
    	return this.getGiaTien().multiply(BigDecimal.ONE.subtract(salePercent)).setScale(0);
	}
    public String getGiaBanFormatted() {
        BigDecimal salePercent = new BigDecimal(this.getGiamGia()).divide(new BigDecimal(100));
        BigDecimal giaSauGiamGia = this.getGiaTien().multiply(BigDecimal.ONE.subtract(salePercent)).setScale(0);

        // Tạo Locale cho tiền tệ Việt Nam
        Locale localeVN = new Locale("vi", "VN");

        // Tạo NumberFormat cho tiền tệ Việt Nam
        NumberFormat vnCurrencyFormat = NumberFormat.getCurrencyInstance(localeVN);

        // Định dạng giá bán thành tiền tệ VNĐ và trả về
        return vnCurrencyFormat.format(giaSauGiamGia);
    }
    public String getGiaTienFormatted() {
        

        // Tạo Locale cho tiền tệ Việt Nam
        Locale localeVN = new Locale("vi", "VN");

        // Tạo NumberFormat cho tiền tệ Việt Nam
        NumberFormat vnCurrencyFormat = NumberFormat.getCurrencyInstance(localeVN);

        // Định dạng giá bán thành tiền tệ VNĐ và trả về
        return vnCurrencyFormat.format(this.getGiaTien());
    }
    
}
