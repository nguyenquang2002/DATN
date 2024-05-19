package com.devpro.javawebDATN.model;

import java.math.BigDecimal;
import java.util.Date;
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
@Table(name = "donhang")
public class DonHang extends BaseEntity{
	@Column(name = "Ngay_dh", nullable = false)
    private Date ngayDatHang;
	
	@Column(name = "Ngay_xn")
    private Date ngayXacNhan;
	
	@Column(name = "Ngay_huy")
    private Date ngayHuy;
	
	@Column(name = "Ngay_gh")
    private Date ngayGiaoHang;
	
	@Column(name = "Ngay_ghtc")
    private Date ngayGiaoHangTC;
	
    @Column(name = "ghi_chu")
    private String ghiChu;

    @Column(name = "tong_tien", nullable = false)
    private BigDecimal tongTien;
    
    @Column(name = "HoTen", nullable = false)
    private String hoTen;

    @Column(name = "sdt")
    private String sdt;

    @Column(name = "DiaChi")
    private String diaChi;

    @Column(name = "Email")
    private String email;
    
    @Column(name = "trang_thai")
    private int trangThai;
    
    @Column(name = "madh")
    private String maDH;

    public int getTrangThai() {
		return trangThai;
	}
	public void setTrangThai(int trangThai) {
		this.trangThai = trangThai;
	}
	public String getMaDH() {
		return maDH;
	}
	public void setMaDH(String maDH) {
		this.maDH = maDH;
	}
	@ManyToOne
    @JoinColumn(name = "taikhoan_id", referencedColumnName = "id")
    private TaiKhoan taiKhoan;
    
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER,mappedBy = "donHang")
    private Set<DonHangSanPham> donHangSanPhams = new HashSet<DonHangSanPham>();
    public void addSanPham(DonHangSanPham donHangSanPham) {
    	donHangSanPham.setDonHang(this);
    	donHangSanPhams.add(donHangSanPham);
    }
    public void deleteSanPham(DonHangSanPham donHangSanPham) {
    	donHangSanPham.setDonHang(null);
    	donHangSanPhams.remove(donHangSanPham);
    }
	
	public String getGhiChu() {
		return ghiChu;
	}
	public void setGhiChu(String ghiChu) {
		this.ghiChu = ghiChu;
	}
	public BigDecimal getTongTien() {
		return tongTien;
	}
	public void setTongTien(BigDecimal tongTien) {
		this.tongTien = tongTien;
	}
	public String getHoTen() {
		return hoTen;
	}
	public void setHoTen(String hoTen) {
		this.hoTen = hoTen;
	}
	public String getSdt() {
		return sdt;
	}
	public void setSdt(String sdt) {
		this.sdt = sdt;
	}
	public String getDiaChi() {
		return diaChi;
	}
	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public TaiKhoan getTaiKhoan() {
		return taiKhoan;
	}
	
	public Date getNgayDatHang() {
		return ngayDatHang;
	}
	public Date getNgayXacNhan() {
		return ngayXacNhan;
	}
	public void setNgayXacNhan(Date ngayXacNhan) {
		this.ngayXacNhan = ngayXacNhan;
	}
	public Date getNgayHuy() {
		return ngayHuy;
	}
	public void setNgayHuy(Date ngayHuy) {
		this.ngayHuy = ngayHuy;
	}
	public void setNgayDatHang(Date ngayDatHang) {
		this.ngayDatHang = ngayDatHang;
	}
	public Date getNgayGiaoHangTC() {
		return ngayGiaoHangTC;
	}
	public void setNgayGiaoHangTC(Date ngayGiaoHangTC) {
		this.ngayGiaoHangTC = ngayGiaoHangTC;
	}
	public Date getNgayGiaoHang() {
		return ngayGiaoHang;
	}
	public void setNgayGiaoHang(Date ngayGiaoHang) {
		this.ngayGiaoHang = ngayGiaoHang;
	}
	
	public void setTaiKhoan(TaiKhoan taiKhoan) {
		this.taiKhoan = taiKhoan;
	}
	public Set<DonHangSanPham> getDonHangSanPhams() {
		return donHangSanPhams;
	}
	public void setDonHangSanPhams(Set<DonHangSanPham> donHangSanPhams) {
		this.donHangSanPhams = donHangSanPhams;
	}
	public int getSoLuongSP() {
		return this.getDonHangSanPhams().size();
	}
	
	public String getTongTienFormatted() {
        
        // Tạo Locale cho tiền tệ Việt Nam
        Locale localeVN = new Locale("vi", "VN");

        // Tạo NumberFormat cho tiền tệ Việt Nam
        NumberFormat vnCurrencyFormat = NumberFormat.getCurrencyInstance(localeVN);

        // Định dạng giá bán thành tiền tệ VNĐ và trả về
        return vnCurrencyFormat.format(this.getTongTien());
    }
}
