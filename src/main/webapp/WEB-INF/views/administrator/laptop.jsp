<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- SPRING FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!-- import JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.84.0">
    <title>Admin Laptop</title>
    
   	<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
    

	<jsp:include page="/WEB-INF/views/administrator/layout/css.jsp"></jsp:include>
	<link href="dashboard.css" rel="stylesheet">
	
	<jsp:include page="/WEB-INF/views/administrator/layout/js.jsp"></jsp:include>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	<!-- ==== Custom js file==== -->
    <script src="${base }/js/custom.js"></script>
    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>

    
    <!-- Custom styles for this template -->
    
  </head>
<body>
	<jsp:include page="/WEB-INF/views/administrator/layout/header.jsp"></jsp:include>


	<div class="container-fluid">
	  <div class="row">
	    <jsp:include page="/WEB-INF/views/administrator/layout/nav.jsp"></jsp:include>
	
	    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
	    	<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
		        <h1 class="h2">Thêm/Sửa Laptop</h1>
		        <div class="btn-toolbar mb-2 mb-md-0">
	          		<div class="btn-group me-2">
	            
	          		</div>
	          
	        	</div>
	    	</div>
			<sf:form method="post" action="${base}/admin/product/laptop" modelAttribute="laptop" enctype="multipart/form-data">
							
				<div class="form-group mb-2 col-6" style="display: none;">
					<label for="productId">ID: </label>
					<sf:input path="id" id="id" class="form-control" readonly="true" ></sf:input>
				</div>
				<div class="row">
					<div class="form-group mb-2 col-6">
						<label for="productId">ID: </label>
						<sf:input path="id" id="id" class="form-control" readonly="true" ></sf:input>
					</div>
					<div class="form-group mb-2 col-6" >
						<label for="productId">ID sản phẩm: </label>
						<sf:input path="sanPham.id" id="productId" class="form-control" readonly="true"></sf:input>
					</div>
					
				</div>
				
				<div class="row">
					<div class="form-group mb-2 col-12">
						<label for="productName">Tên sản phẩm: </label>
						<sf:input type="text" path="sanPham.tenSanPham" id="productName" placeholder="Tên sản phẩm" class="form-control"></sf:input>
					</div>
				</div>
				<div class="row">
					<div class="form-group mb-2 col-6">
						<label for="price">Giá tiền(VNĐ): </label>
						<sf:input type="number" autocomplete="off" path="sanPham.giaTien" class="form-control" id="price" placeholder="Giá tiền" required="required"></sf:input>
					</div>
					
					<div class="form-group mb-2 col-6">
						<label for="price">Giảm giá(%): </label>
						<sf:input type="number" autocomplete="off" path="sanPham.giamGia" class="form-control" id="price" placeholder="Giá tiền" required="required"></sf:input>
					</div>
				</div>
				
				<div class="row">
					<div class="form-group mb-2 col-12">
						<label for="soLuong">Số lượng: </label>
						<sf:input type="text" path="sanPham.soLuong" id="soLuong" placeholder="Số lượng" class="form-control"></sf:input>
					</div>
				</div>
				<div class="row">
					<div class="form-group mb-2 col-6">
						<label for="trangThai">Trạng thái:</label>
						<c:choose>
							<c:when test="${laptop.sanPham.trangThai < -1 }">
								<sf:select path="sanPham.trangThai" class="form-control" id="trangThai">
									<sf:option value="-2">Đã xóa</sf:option>
								</sf:select>
							</c:when>
							<c:otherwise>
								<sf:select path="sanPham.trangThai" class="form-control" id="trangThai">
									<sf:option value="-1">Không bán lẻ</sf:option>
									<sf:option value="0">Hết hàng</sf:option>
									<sf:option value="1" selected="selected">Còn hàng</sf:option>
									<sf:option value="2">Hàng hot</sf:option>
								</sf:select>
							</c:otherwise>
						</c:choose>
						
					</div>
					
					<div class="form-group mb-2 col-6">
						<label for="brand">Brand:</label>
						<sf:select path="sanPham.brand.id" class="form-control" id="brand">
							<sf:options items="${brands }" itemValue="id" itemLabel="tenHang"/>
						</sf:select>
					</div>
				</div>
				<div class="row">
					<div class="form-group mb-2 col-6">
						<label for="cpu">CPU:</label>
						<select  class="form-control" id="cpu" name="cpu">
							<c:forEach items="${phanCungs}" var="phanCung">
					            <c:if test="${phanCung.loaiPhanCung.id == 2}">
					            	<c:choose>
					            		<c:when test="${cpu.sanPham.tenSanPham != NULL && cpu.id == phanCung.id}">
				            				<option value="${phanCung.id}" selected>${phanCung.sanPham.tenSanPham}</option>
					            		</c:when>
						            	<c:otherwise>
						            		<option value="${phanCung.id}">${phanCung.sanPham.tenSanPham}</option>
						            	</c:otherwise>
					            	</c:choose>
					                
					            </c:if>
					        </c:forEach>
						</select>
					</div>
					
					<div class="form-group mb-2 col-6">
						<label for="ram">RAM:</label>
						<select  class="form-control" id="ram" name="ram">
							<c:forEach items="${phanCungs}" var="phanCung">
					            <c:if test="${phanCung.loaiPhanCung.id == 3}">
					                <c:choose>
					            		<c:when test="${ram.sanPham.tenSanPham != NULL && ram.id == phanCung.id}">
				            				<option value="${phanCung.id}" selected>${phanCung.sanPham.tenSanPham}</option>
					            		</c:when>
						            	<c:otherwise>
						            		<option value="${phanCung.id}">${phanCung.sanPham.tenSanPham}</option>
						            	</c:otherwise>
					            	</c:choose>
					            </c:if>
					        </c:forEach>
						</select>
					</div>
				</div>
				
				<div class="row">
					<div class="form-group mb-2 col-6">
						<label for="harddrive">Ỏ cứng:</label>
						<select  class="form-control" id="harddrive" name="harddrive">
							<c:forEach items="${phanCungs}" var="phanCung">
					            <c:if test="${phanCung.loaiPhanCung.id == 5}">
					                <c:choose>
					            		<c:when test="${harddrive.sanPham.tenSanPham != NULL && harddrive.id == phanCung.id}">
				            				<option value="${phanCung.id}" selected>${phanCung.sanPham.tenSanPham}</option>
					            		</c:when>
						            	<c:otherwise>
						            		<option value="${phanCung.id}">${phanCung.sanPham.tenSanPham}</option>
						            	</c:otherwise>
					            	</c:choose>
					            </c:if>
					        </c:forEach>
						</select>
					</div>
					
					<div class="form-group mb-2 col-6">
						<label for="vga">VGA:</label>
						<select  class="form-control" id="vga" name="vga">
							<c:forEach items="${phanCungs}" var="phanCung">
					            <c:if test="${phanCung.loaiPhanCung.id == 4}">
					                <c:choose>
					            		<c:when test="${vga.sanPham.tenSanPham != NULL && vga.id == phanCung.id}">
				            				<option value="${phanCung.id}" selected>${phanCung.sanPham.tenSanPham}</option>
					            		</c:when>
						            	<c:otherwise>
						            		<option value="${phanCung.id}">${phanCung.sanPham.tenSanPham}</option>
						            	</c:otherwise>
					            	</c:choose>
					            </c:if>
					        </c:forEach>
						</select>
					</div>
				</div>
				
				<div class="row">
					<div class="form-group mb-2 col-6">
						<label for="loaiLaptop">Loại laptop:</label>
						<sf:select path="sanPham.loaiSanPham" class="form-control" id="trangThai">
							<sf:option value="2">Laptop</sf:option>
							<sf:option value="5">Laptop Gaming</sf:option>
						</sf:select>
					</div>
					<div class="form-group mb-2 col-6">
						<label for="manHinh">Màn hình: </label>
						<sf:input type="text" path="manHinh" id="manHinh" placeholder="Màn hình" class="form-control"></sf:input>
					</div>
				</div>
				<div class="row">
					<div class="form-group mb-2 col-12">
						<label for="productName">Cổng giao tiếp: </label>
						<sf:textarea type="text" path="congGiaoTiep" id="congGiaoTiep" placeholder="Cổng giao tiếp" class="form-control" ></sf:textarea>
					</div>
				</div>
				<div class="row">
					<div class="form-group mb-2 col-6">
						<label for="banPhim">Bàn phím: </label>
						<sf:input type="text" path="banPhim" id="banPhim" placeholder="Bàn phím" class="form-control"></sf:input>
					</div>
					<div class="form-group mb-2 col-6">
						<label for="audio">Audio: </label>
						<sf:input type="text" path="audio" id="audio" placeholder="Audio" class="form-control"></sf:input>
					</div>
				</div>
				<div class="row">
					<div class="form-group mb-2 col-6">
						<label for="chuanLAN">Chuẩn LAN: </label>
						<sf:input type="text" path="chuanLAN" id="chuanLAN" placeholder="Chuẩn LAN" class="form-control"></sf:input>
					</div>
					<div class="form-group mb-2 col-6">
						<label for="chuanWiFi">Chuẩn WiFi: </label>
						<sf:input type="text" path="chuanWiFi" id="chuanWiFi" placeholder="Chuẩn WiFi" class="form-control"></sf:input>
					</div>
				</div>
				<div class="row">
					<div class="form-group mb-2 col-6">
						<label for="bluetooth">Bluetooth: </label>
						<sf:input type="text" path="bluetooth" id="bluetooth" placeholder="Bluetooth" class="form-control"></sf:input>
					</div>
					<div class="form-group mb-2 col-6">
						<label for="webcam">Webcam: </label>
						<sf:input type="text" path="webcam" id="webcam" placeholder="Webcam" class="form-control"></sf:input>
					</div>
				</div>
				<div class="row">
					<div class="form-group mb-2 col-6">
						<label for="hdh">Hệ điều hành: </label>
						<sf:select path="hdh" class="form-control" id="hdh">
							<sf:option value="Windows 10">Windows 10</sf:option>
							<sf:option value="Windows 10 Home">Windows 10 Home</sf:option>
							<sf:option value="Windows 10 Pro">Windows 10 Pro</sf:option>
							<sf:option value="Windows 11">Windows 11</sf:option>
							<sf:option value="Windows 11 Home">Windows 11 Home</sf:option>
							<sf:option value="Windows 11 Pro">Windows 11 Pro</sf:option>
						</sf:select>
					</div>
					<div class="form-group mb-2 col-6">
						<label for="pin">Pin: </label>
						<sf:input type="text" path="pin" id="pin" placeholder="pin" class="form-control"></sf:input>
					</div>
				</div>
				<div class="row">
					<div class="form-group mb-2 col-6">
						<label for="trongLuong">Trọng lượng: </label>
						<sf:input type="number" path="trongLuong" id="trongLuong" placeholder="Trọng lượng" class="form-control"></sf:input>
					</div>
					<div class="form-group mb-2 col-6">
						<label for="mauSac">Màu sắc: </label>
						<sf:input type="text" path="mauSac" id="mauSac" placeholder="Màu sắc" class="form-control"></sf:input>
					</div>
				</div>
				<div class="row">
					<div class="form-group mb-2 col-12">
						<label for="kichThuoc">Kích thước: </label>
						<sf:input type="text" path="kichThuoc" id="kichThuoc" placeholder="Kích thước" class="form-control"></sf:input>
					</div>
				</div>
				<div class="row">
					<div class="form-group mb-2 col-12">
						<label for="moTa">Mô tả: </label>
						<sf:textarea path="sanPham.moTa" id="moTa" placeholder="Mô tả" class="form-control summernote"></sf:textarea>
					</div>
				</div>
				
				<!-- Pictures -->
				<div class="row">
					<div class="form-group mb-2">
						<label for="fileProductPictures">Hình ảnh(Nhiều)</label> 
						<input id="fileProductPictures" name="spAnh" type="file" class="form-control" multiple="multiple">
					</div>
					<div class="form-group mb-2">
						<c:forEach items="${laptop.sanPham.hinhAnhSanPhams }" var="hinhAnh">
							<img alt="" style="width: 100px; height: 100px;" src="${base }/upload/${hinhAnh.path}">
						</c:forEach>
					</div>
				</div>
				
				<!-- avatar -->
				<div class="row">
					<div class="form-group mb-2">
						<label for="fileSPAvatar">Avatar</label> 
						<input id="fileSPAvatar" name="spAvatar" type="file" class="form-control">
					</div>
					
					<div class="form-group">
						<img alt="" style="width: 100px; height: 100px;" src="${base }/upload/${laptop.sanPham.avatar}">
					</div>
				</div>
				
				<a href="${base }/admin/product" class="btn btn-secondary active" role="button" aria-pressed="true">Quay lại danh sách</a>
				<button type="submit" class="btn btn-primary">Lưu sản phẩm</button>
			</sf:form>
	    </main>
	  </div>
	</div>
	
	
	<jsp:include page="/WEB-INF/views/administrator/layout/js.jsp"></jsp:include>
	<!-- internal javascript -->
	<script type="text/javascript">
		$(document).ready(function() {
			$('#moTa').summernote();
		});
	</script>
</body>
</html>
