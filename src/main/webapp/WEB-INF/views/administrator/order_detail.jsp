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
    <title>Admin Order</title>
    
   	<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
    

	<jsp:include page="/WEB-INF/views/administrator/layout/css.jsp"></jsp:include>
	<link href="dashboard.css" rel="stylesheet">
	<jsp:include page="/WEB-INF/views/administrator/layout/js.jsp"></jsp:include>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	
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
      
      .modal {
		  display: none; /* Hidden by default */
		  position: fixed; /* Stay in place */
		  z-index: 1; /* Sit on top */
		  padding-top: 100px; /* Location of the box */
		  left: 0;
		  top: 0;
		  width: 100%; /* Full width */
		  height: 100%; /* Full height */
		  overflow: auto; /* Enable scroll if needed */
		  background-color: rgb(0,0,0); /* Fallback color */
		  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
		}
		
		/* Modal Content */
		.modal-content {
		  position: relative;
		  background-color: #fefefe;
		  margin: auto;
		  padding: 0;
		  border: 1px solid #888;
		  width: 50%;
		  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
		  -webkit-animation-name: animatetop;
		  -webkit-animation-duration: 0.4s;
		  animation-name: animatetop;
		  animation-duration: 0.4s
		}
		
		/* Add Animation */
		@-webkit-keyframes animatetop {
		  from {top:-300px; opacity:0} 
		  to {top:0; opacity:1}
		}
		
		@keyframes animatetop {
		  from {top:-300px; opacity:0}
		  to {top:0; opacity:1}
		}
		
		/* The Close Button */
		.close {
		  color: #bfbfbf;
		  float: right;
		  font-size: 28px;
		  font-weight: bold;
		  margin-left: 95%;
		}
		
		.close:hover,
		.close:focus {
		  color: #000;
		  text-decoration: none;
		  cursor: pointer;
		}
		
		.modal-header {
		  padding: 2px 16px;
		  background-color: white;
		  color: white;
		}
		
		.modal-body {padding: 2px 16px;}
		
		.modal-footer {
		  padding: 2px 16px;
		  background-color: white;
		  
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
	        <h1 class="h2">Đơn hàng</h1>
	        
	      </div>

	      <h2>Thông tin đơn hàng</h2>
	      <div class="d-flex justify-content-between">
	      	<p style="font-weight: bold;">ID: <span style="font-weight: 400;">${order.id }</span></p>
	      	<p style="font-weight: bold;">Mã đơn hàng: <span style="font-weight: 400;">${order.maDH }</span></p>
	      </div>
	      <div class="d-flex justify-content-between">
	      	<c:choose>
            	<c:when test="${order.trangThai == 0 }">
            		<p style="font-weight: bold;">Ngày: <span style="font-weight: 400;">${order.ngayHuy }</span></p>
	      			<p style="font-weight: bold;">Trạng thái: <span style="font-weight: 400; color: red;">Đã hủy</span></p>
            	</c:when>
            	<c:when test="${order.trangThai == 1 }">
            		<p style="font-weight: bold;">Ngày: <span style="font-weight: 400;">${order.ngayDatHang }</span></p>
	      			<p style="font-weight: bold;">Trạng thái: <span style="font-weight: 400;">Đã đặt hàng</span></p>
            	</c:when>
            	<c:when test="${order.trangThai == 2 }">
            		<p style="font-weight: bold;">Ngày: <span style="font-weight: 400;">${order.ngayXacNhan }</span></p>
	      			<p style="font-weight: bold;">Trạng thái: <span style="font-weight: 400; color: blue;">Chuẩn bị hàng</span></p>
            	</c:when>
            	<c:when test="${order.trangThai == 3 }">
            		<p style="font-weight: bold;">Ngày: <span style="font-weight: 400;">${order.ngayGiaoHang }</span></p>
	      			<p style="font-weight: bold;">Trạng thái: <span style="font-weight: 400; color: blue;">Đang giao hàng</span></p>
            	</c:when>
            	<c:when test="${order.trangThai == 4 }">
            		<p style="font-weight: bold;">Ngày: <span style="font-weight: 400;">${order.ngayGiaoHangTC }</span></p>
	      			<p style="font-weight: bold;">Trạng thái: <span style="font-weight: 400; color: green;">Giao hàng thành công</span></p>
            	</c:when>
            </c:choose>
	      </div>
	      <div class="d-flex justify-content-between">
	      	<p style="font-weight: bold;">Họ tên: <span style="font-weight: 400;">${order.hoTen }</span></p>
	      	<p style="font-weight: bold;">Số điện thoại: <span style="font-weight: 400;">${order.sdt }</span></p>
	      	<p style="font-weight: bold;">Địa chi: <span style="font-weight: 400;">${order.diaChi }</span></p>
	      </div>
	      
	      <div class="d-flex justify-content-between">
	      	<h2>Sản phẩm: </h2>
	      	
	      </div>
	      
	      <table class="table table-striped table-sm">
	          <thead>
	            <tr>
	              <th scope="col">Avatar</th>
	              <th scope="col">Sản phẩm</th>
	              <th scope="col">Số lượng</th>
	              <th scope="col">Giá tiền</th>
	              <th scope="col">Tổng tiền</th>
	            </tr>
	          </thead>
	          <tbody>
	          	<c:set var="count" value="0" scope="page" />
	              <c:forEach items="${order.donHangSanPhams }" var="product">
	              	<tr>
	              		<td>
	              			<img alt="" style="width: 100px; height: 100px;" src="${base }/upload/${product.sanPham.avatar}">
	              		</td>
	              		<td>${product.sanPham.tenSanPham }</td>
	              		<td><span>${product.soLuong }</span></td>
	              		<td>${product.sanPham.giaBanFormatted }</td>
	              		<td>${product.sanPham.giaBan * product.soLuong }₫</td>
	              		
	              </c:forEach>
	          </tbody>
	          <tfoot>
	          	
	          	<tr>
	          		<th colspan="4">Tổng cộng:</th>
	          		<td>${order.tongTienFormatted }</td>
	          	</tr>
	          </tfoot>
	        </table>
	      
	      
	      <div class="d-flex justify-content-between">
	      	<a href="${base }/admin/order" class="btn btn-secondary">Quay lại danh sách</a>
	      	<div>
	      		<c:if test="${order.trangThai>0 && order.trangThai<4 }">
	      			<a role="button" class="btn btn-danger" id="myBtn" >Hủy đơn hàng</a>
	      			<!-- The Modal -->
					<div id="myModal" class="modal">
								
					<!-- Modal content -->
					<div class="modal-content">
					    <div class="modal-header">
					      <span class="close">&times;</span>
					      
					    </div>
					    <div class="modal-body">
					      <p>Bạn muốn hủy đơn hàng này ?</p>
					      
					    </div>
					    <div class="modal-footer">
					      <button type="button" class="btn btn-secondary" id="cancel">Không</button>
					      <button type="button" class="btn btn-danger" onclick="CancelOrder(${order.id})">Có!</button>
					    </div>
					  </div>
					
					</div>
	      		</c:if>
	      		<c:if test="${order.trangThai==1 }">
	      			<a role="button" class="btn btn-primary" onclick="AcceptOrder(${order.id})" >Xác nhận đơn hàng!</a>
	      		</c:if>
	      		<c:if test="${order.trangThai==2 }">
	      			<a role="button" class="btn btn-success" onclick="ShippingOrder(${order.id})" >Bắt đầu giao hàng!</a>
	      		</c:if>
	      		<c:if test="${order.trangThai==3 }">
	      			<a role="button" class="btn btn-success" onclick="CompleteOrder(${order.id})" >Xác nhận giao hàng thành công!</a>
	      		</c:if>
	      	</div>
	      </div>
	    </main>
	  </div>
	</div>
	
	
		
		<jsp:include page="/WEB-INF/views/administrator/layout/js.jsp"></jsp:include>
		<!-- Paging -->
		<script src="${base}/js/jquery.simplePagination.js"></script>
		
		<script type="text/javascript">
		// Get the modal
		var modal = document.getElementById("myModal");

		// Get the button that opens the modal
		var btn = document.getElementById("myBtn");

		// Get the <span> element that closes the modal
		var span = document.getElementsByClassName("close")[0];
		
		//
		var cancel = document.getElementById("cancel")

		// When the user clicks on the button, open the modal
		btn.onclick = function() {
		  modal.style.display = "block";
		}

		// When the user clicks on <span> (x), close the modal
		span.onclick = function() {
		  modal.style.display = "none";
		}
		
		cancel.onclick = function() {
		  modal.style.display = "none";
		}

		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
		  if (event.target == modal) {
		    modal.style.display = "none";
		  }
		}
			/* function ShowModal(i) {
				var modal = document.getElementById("myModal"+i);
				modal.style.display = "block";
			}
			function CloseModal(i) {
				var modal = document.getElementById("myModal"+i);
				modal.style.display = "none";
			} */
			
			function CancelOrder(orderID) {
				// tạo javascript object.  
				var data = {
					id: orderID,
				};
				
				// $ === jQuery
				// json == javascript object
				jQuery.ajax({
					url:  '${base}' + "/admin/order/cancel",
					type: "post",						
					contentType: "application/json",
					data: JSON.stringify(data),
	
					dataType: "json", 
					success: function(jsonResult) {
						location.reload(); //refresh lại trang web
					},
					error: function(jqXhr, textStatus, errorMessage) {
						alert("error");
					}
				});
			}
			
			function ShippingOrder(orderID) {
				// tạo javascript object.  
				var data = {
					id: orderID,
				};
				
				// $ === jQuery
				// json == javascript object
				jQuery.ajax({
					url:  '${base}' + "/admin/order/shipping",
					type: "post",						
					contentType: "application/json",
					data: JSON.stringify(data),
	
					dataType: "json", 
					success: function(jsonResult) {
						location.reload(); //refresh lại trang web
					},
					error: function(jqXhr, textStatus, errorMessage) {
						alert("error");
					}
				});
			}
			
			function AcceptOrder(orderID) {
				// tạo javascript object.  
				var data = {
					id: orderID,
				};
				
				// $ === jQuery
				// json == javascript object
				jQuery.ajax({
					url:  '${base}' + "/admin/order/accept",
					type: "post",						
					contentType: "application/json",
					data: JSON.stringify(data),
	
					dataType: "json", 
					success: function(jsonResult) {
						location.reload(); //refresh lại trang web
					},
					error: function(jqXhr, textStatus, errorMessage) {
						alert("error");
					}
				});
			}
			
			function CompleteOrder(orderID) {
				// tạo javascript object.  
				var data = {
					id: orderID,
				};
				
				// $ === jQuery
				// json == javascript object
				jQuery.ajax({
					url:  '${base}' + "/admin/order/complete",
					type: "post",						
					contentType: "application/json",
					data: JSON.stringify(data),
	
					dataType: "json", 
					success: function(jsonResult) {
						location.reload(); //refresh lại trang web
					},
					error: function(jqXhr, textStatus, errorMessage) {
						alert("error");
					}
				});
			}
			
			
		</script>
</body>
</html>
