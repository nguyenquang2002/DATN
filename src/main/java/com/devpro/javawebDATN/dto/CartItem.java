package com.devpro.javawebDATN.dto;

import java.math.BigDecimal;

/**
 * Biểu thị cho 1 sản phẩm trong giỏ hàng.
 * @author daing
 *
 */
public class CartItem {
	// mã sản phẩm 
	private int productId;
	
	// tên sản phẩme
	private String productName;
	
	// số lương sản phẩm
	private int quanlity;
	
	// đơn giá sản phẩm
	private BigDecimal priceUnit;
	
	// avatar sản phẩm
	private String avatar;
	
	// loại sp
	private int lsp;
	
	

	public int getLsp() {
		return lsp;
	}

	public void setLsp(int lsp) {
		this.lsp = lsp;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getQuanlity() {
		return quanlity;
	}

	public void setQuanlity(int quanlity) {
		this.quanlity = quanlity;
	}

	public BigDecimal getPriceUnit() {
		return priceUnit;
	}

	public void setPriceUnit(BigDecimal priceUnit) {
		this.priceUnit = priceUnit;
	}

}
