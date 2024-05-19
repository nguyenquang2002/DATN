<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- SPRING FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!-- import JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- Document Title -->
    <title>IT ERA - IT SHOP</title>

    <!-- Favicon -->
    <link rel="shortcut icon" type="image/png" href="favicon.png">

    <!-- CSS Files -->
    <!--==== Google Fonts ====-->
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900%7CRoboto+Condensed:300,400,700" rel="stylesheet">
    
    <!--==== Bootstrap css file ====-->
    <link rel="stylesheet" href="${base }/css/bootstrap.min.css">

    <!--==== Font-Awesome css file ====-->
    <link rel="stylesheet" href="${base }/css/font-awesome.min.css">

    <!-- Owl Carusel css file -->
    <link rel="stylesheet" href="${base }/plugins/owl-carousel/owl.carousel.min.css">

    <!-- Magnific-Popup css file -->
    <link rel="stylesheet" href="${base }/plugins/Magnific-Popup/magnific-popup.css">

    <!-- animate css file -->
    <link rel="stylesheet" href="${base }/plugins/animate-css/animate.min.css">

    <!-- swiper -->
    <link rel="stylesheet" href="${base }/plugins/swiper/swiper.min.css">

    <!--==== Style css file ====-->
    <link rel="stylesheet" href="${base }/css/style.css">

    <!--==== Responsive css file ====-->
    <link rel="stylesheet" href="${base }/css/responsive.css">

    <!--==== Custom css file ====-->
    <link rel="stylesheet" href="${base }/css/custom.css">
    
    <!-- page -->
	<link type="text/css" rel="stylesheet" href="${base }/css/simplePagination.css"/>
	
	<c:choose>
		<c:when test="${donHang.ngayXacNhan != null }">
			<style>
				.track-lines .col-md-3:nth-child(2) .single-tracking-inner:after,
				.track-lines .col-md-3:nth-child(3) .single-tracking-inner:after,
				.track-lines .col-md-3:nth-child(4) .single-tracking-inner:after {
				    display: none;
				}
			</style>
		</c:when>
		<c:when test="${donHang.ngayGiaoHang != null }">
			<style>
				.track-lines .col-md-3:nth-child(3) .single-tracking-inner:after,
				.track-lines .col-md-3:nth-child(4) .single-tracking-inner:after {
				    display: none;
				}
			</style>
		</c:when>
		<c:when test="${donHang.ngayGiaoHangTC != null }">
			<style>
				.track-lines .col-md-3:nth-child(4) .single-tracking-inner:after {
				    display: none;
				}
			</style>
		</c:when>
	</c:choose>
	<style type="text/css">
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
</head>

<body>
   	<jsp:include page="/WEB-INF/views/customer/layout/menu.jsp"></jsp:include>
    
	<jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>

    <!-- page title -->
    <section class="page-title-inner" data-bg-img='${base}/img/page-titlebg.png'>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <!-- page title inner -->
                    <div class="page-title-wrap">
                        <div class="page-title-heading"><h1 class="h2">Đơn hàng</h1></div>
                        <ul class="list-unstyled mb-0">
                            <li><a href="${base}/index">Trang chủ</a></li>
                            <li><a href="${base}/myaccount">Tài khoản</a></li>
                            <li><a href="${base}/order">Đơn hàng</a></li>
                            <li class="active"><a href="#">${donHang.maDH }</a></li>
                        </ul>
                    </div>
                    <!-- End of page title inner -->
                </div>
            </div>
        </div>
    </section>
    <!-- End of page title -->
    
    

    <section class="pt-100 pb-100">
        <div class="container">
        	<div class="row track-lines">
                <div class="col-md-3 col-sm-3">
                    <!-- single tracking inner -->
                    <div class="single-tracking-inner text-center line-1">
                        <div class="single-tracking-img">
                            <img src="${base}/img/icons/torder.png" alt="">
                        </div>
                        <h5 class="lato">Đặt hàng</h5>
                      		<p>${donHang.ngayDatHang }</p>
                    </div>
                    <!-- End of single tracking inner -->
                </div>

                 <div class="col-md-3 col-sm-3">
                    <!-- single tracking inner -->
                    <div class="single-tracking-inner text-center line-2">
                        <div class="single-tracking-img">
                            <img src="${base}/img/icons/tpacked.png" alt="">
                        </div>
                        <h5 class="lato">Chuẩn bị hàng</h5>
                        <p>${donHang.ngayXacNhan }</p>
                    </div>
                    <!-- End of single tracking inner -->
                </div>

                <div class="col-md-3 col-sm-3">
                    <!-- single tracking inner -->
                    <div class="single-tracking-inner text-center line-2">
                        <div class="single-tracking-img">
                            <img src="${base}/img/icons/ttransit.png" alt="">
                        </div>
                        <h5 class="lato">Đang giao hàng</h5>
                        <p>${donHang.ngayGiaoHang }</p>
                    </div>
                    <!-- End of single tracking inner -->
                </div>

                <div class="col-md-3 col-sm-3">
                    <!-- single tracking inner -->
                    <div class="single-tracking-inner text-center line-2">
                        <div class="single-tracking-img">
                            <img src="${base}/img/icons/tdeliverd.png" alt="">
                        </div>
                        <h5 class="lato">Giao hàng thành công</h5>
                        <p>${donHang.ngayGiaoHangTC }</p>
                    </div>
                    <!-- End of single tracking inner -->
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <!--order deliverd date -->
                    <div class="order-deliverd-date text-center">
                    	<c:choose>
                    		<c:when test="${donHang.trangThai == 0 }">
		                        <p>Đơn hàng đã bị hủy vào <span>${donHang.ngayHuy}</span></p>
                    		</c:when>
                    		<c:when test="${donHang.trangThai == 1 }">
		                        <p>Đơn hàng đã đặt vào <span>${donHang.ngayDatHang}</span></p>
                    		</c:when>
                    		<c:when test="${donHang.trangThai == 2 }">
		                        <p>Đơn hàng đang được chuẩn bị</p>
                    		</c:when>
                    		<c:when test="${donHang.trangThai == 3 }">
		                        <p>Đơn hàng đang được giao đến chỗ bạn</p>
                    		</c:when>
                    		<c:when test="${donHang.trangThai == 4 }">
		                        <p>Đơn hàng đã giao thành công vào <span>${donHang.ngayGiaoHangTC}</span></p>
                    		</c:when>
                    	</c:choose>
                    </div>
                    <!--End of order deliverd date -->
                </div>
                <div class="col-12">
                    <!-- order details wrap -->
                    <div class="order-details-wrap">
                        <div class="order-details-heading">
                            <h5 class="lato">Thông tin đơn hàng:</h5>
                        </div>
                        <div class="order-address-details">
                            <div class="order-no">
                                <p>Mã đơn hàng: <span>${donHang.maDH }</span></p>
                            </div>
                            <div class="row">
                                <div class="col-md-11 offset-md-1">
                                    <!-- order address inner -->
                                    <div class="order-address-inner clearfix">
                                        <div class="shipping-to-area">
                                            <h5>Tới:</h5>
                                            <p>${donHang.taiKhoan.hoTen }</p>
                                            <p>${donHang.diaChi }<br>${donHang.sdt }</p>
                                        </div>
                                    </div>
                                    <!-- End of order address inner -->
                                </div>
                            </div>
                            
                        </div>
                    </div>
                    <!-- order details wrap -->
                
				</div>
			</div>
            <div class="row justify-content-center">
                <div class="col-12">
                    <!-- woocommerce -->
                    <div class="woocommerce">
                        <form action="#" method="POST" class="woocommerce-cart-form">
                            <!-- cart product wrap -->
                            <div class="cart-product-wrap">
                                <!-- cart table -->
                                <table class="shop_table shop_table_responsive cart woocommerce-cart-form__contents">
                                    <tbody>
                                        <!-- first table row -->
                                        <tr>
                                            <td class="product-name" colspan="2" style="text-align: center;">
                                                Sản phẩm
                                            </td>
                                            
                                            <td class="product-quantity">
                                                Số lượng
                                            </td>
                                            <td class="product-quantity">
                                                Giá tiền
                                            </td>
                                            
                                            <td>Tổng tiền</td>
                                        </tr>
                                        <!-- End of first table row -->
										<c:forEach items="${donHang.donHangSanPhams }" var="donHangSanPham">	                                        <!-- tr -->
	                                        <tr class="woocommerce-cart-form__cart-item cart_item">
	                                            <!-- product-thumbnail -->
	                                            <td class="product-thumbnail">
	                                                <div class="product-details">
	                                                    <c:choose>
															<c:when test="${donHangSanPham.sanPham.loaiSanPham == 1}">
																<a href="${base }/computer/${donHangSanPham.sanPham.id}" class="porduct-image-wrap">
															</c:when>
															<c:when test="${donHangSanPham.sanPham.loaiSanPham == 2 || donHangSanPham.sanPham.loaiSanPham == 5}">
																<a href="${base }/laptop/${cartItem.id}" class="porduct-image-wrap">
															</c:when>
															<c:when test="${donHangSanPham.sanPham.loaiSanPham == 3}">
																<a href="${base }/hardware/${cartItem.productid}" class="porduct-image-wrap">
															</c:when>
															<c:when test="${donHangSanPham.sanPham.loaiSanPham == 4}">
																<a href="${base }/gear/${cartItem.productid}" class="porduct-image-wrap">
															</c:when>
														</c:choose>
	                                                        <img src="${base}/upload/${donHangSanPham.sanPham.avatar}" style="width: 80px; height: 80px;" alt="" alt="">
	                                                    </a>
	                                                </div>
	                                            </td>
	                                            <!-- product-thumbnail -->
	
	                                            <!-- product-name -->
	                                            <td class="cart-product-name">
	                                                <div class="product-details">
	                                                    
	                                                    <c:choose>
															<c:when test="${donHangSanPham.sanPham.loaiSanPham == 1}">
																<a href="${base }/computer/${donHangSanPham.sanPham.id}">
															</c:when>
															<c:when test="${donHangSanPham.sanPham.loaiSanPham == 2 || donHangSanPham.sanPham.loaiSanPham == 5}">
																<a href="${base }/laptop/${donHangSanPham.sanPham.id}">
															</c:when>
															<c:when test="${donHangSanPham.sanPham.loaiSanPham == 3}">
																<a href="${base }/hardware/${donHangSanPham.sanPham.productid}">
															</c:when>
															<c:when test="${donHangSanPham.sanPham.loaiSanPham == 4}">
																<a href="${base }/gear/${donHangSanPham.sanPham.productid}">
															</c:when>
														</c:choose>
	                                                    	${donHangSanPham.sanPham.tenSanPham}
                                                    	</a>
	                                                </div>
	                                            </td>
	                                            <!-- product-name -->
	
	                                            
	
	                                            <td>${donHangSanPham.soLuong }</td>
	
	                                            <td>${donHangSanPham.sanPham.giaBanFormatted}</td>
	                                            
	
	                                            <td>${donHangSanPham.sanPham.giaBan * donHangSanPham.soLuong }₫</td>
	                                        </tr>
	                                        <!--End of tr -->
										</c:forEach>
                                    </tbody>
                                </table>
                                <!--End of cart table -->
                                <div class="cart-bottom-wrap">
                                    <div class="row">
                                        <div class="col-md-12 col-lg-5">
                                            <div class="btn-cupon-wrap">
                                                <!-- cart shoping button  -->
                                                <div class="cart-shoping-button">
                                                    <a href="${base }/myaccount/order" class="update-cart-btn btn btn-fill-type">Quay lại danh sách đơn hàng</a>
                                                    
                                                </div>
                                                <!-- End of cart shoping button  -->

                                               
                                            </div>
                                        </div>
                                        <div class="offset-lg-2 col-lg-4 col-md-12">
                                            <!-- shop total wrap -->
                                            <div class="shop-total-wrap">
                                                <table class="shop_table shop_table_responsive">
                                                    <tbody>
                                                        <tr class="cart-subtotal">
                                                            
                                                        </tr>
                                                        <tr class="order-total">
                                                            <th>
                                                                Tổng cộng
                                                            </th>
                                                            <td>
                                                                <span class="woocommerce-Price-amount amount totalPrice">${donHang.tongTienFormatted }</span>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <c:choose>
                                                	<c:when test="${donHang.trangThai == 0 }">
                                                		<h4 style="color: red; text-align: center; text-transform: uppercase;">Đơn hàng đã bị hủy!!!</h4>
                                                	</c:when>
                                                	<c:when test="${donHang.trangThai == 4 }">
                                                		<h4 style="color: green; text-align: center; text-transform: uppercase;">Đơn hàng đã giao thành công!!!</h4>
                                                	</c:when>
                                                	<c:otherwise>
		                                                <div class="wc-proceed-to-checkout">
		                                                    <a role="button" onclick="ShowModal()" class="update-cart-btn btn btn-fill-type" >Hủy đơn hàng</a>
		                                                </div>
                                                	</c:otherwise>
                                                </c:choose>
                                            </div>
                                            <!-- End of shop total wrap -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- cart product wrap -->
                        </form>
                    </div>
                    <!-- woocommerce -->
                </div>
            </div>
        </div>        
    	
    </section>

   	<!-- footer area -->
    <jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>
    
    <jsp:include page="/WEB-INF/views/customer/layout/back-to-top.jsp"></jsp:include>
   	<!-- back to top -->
    
        
    
        <!-- Modal quick view-->
        <div class="modal-quickview-container">
            <div class="quick-view-content-wrap">
                <div class="modal-window-overlay"></div>
                <div class="quick-view-content">
                    <div class="modal-window-close">
                        <img src="${base}/img/icons/close-button.svg" class="svg" alt="">
                    </div> 
                    <div class="quick-view-content-inner">
                        <div class="row align-items-center">
                            <div class="col-lg-7">
                                <!-- Start shop product slider -->
                                <div class="shop-product-slider-wrap">
                                    <!-- Start shop slider top side -->
                                     <div class="swiper-container quick-product-gallery">
                                        <div class="swiper-wrapper">
                                            <div class="swiper-slide">
                                                <img class='' src="${base}/img/shop/quick-view1.png" alt="" data-rjs="2" />
                                            </div>
                                            <div class="swiper-slide">
                                                <img class='' src="${base}/img/shop/quick-view2.png"  alt="" data-rjs="2" />
                                            </div>
                                            <div class="swiper-slide">
                                                <img class='' src="${base}/img/shop/quick-view3.png" alt="" data-rjs="2" />
                                            </div>
                                            <div class="swiper-slide">
                                                <img class='' src="${base}/img/shop/quick-view4.png" alt="" data-rjs="2" />
                                            </div>
                                        </div>
                                    </div>
                                     <!-- End of shop slider top side -->
                                    
                                    <!-- Start shop slider bottom side -->
                                    <div class="swiper-container quick-product-thumbs">
                                        <div class="swiper-wrapper">
                                            <div class="swiper-slide">
                                                <img src="${base}/img/shop/details-nav1.png" data-rjs="2" alt="">
                                            </div>
                                            <div class="swiper-slide">
                                                <img src="${base}/img/shop/details-nav3.png" data-rjs="2" alt="">
                                            </div>
                                            <div class="swiper-slide">
                                                <img src="${base}/img/shop/details-nav4.png" data-rjs="2" alt="">
                                            </div>
                                            <div class="swiper-slide">
                                                <img src="${base}/img/shop/details-nav5.png" data-rjs="2" alt="">
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End of shop slider bottom side -->
                                </div>
                                <!-- End of shop product slider -->
                            </div>
    
                            <div class="col-lg-5">
                                <!-- product details inner -->
                                <div class="product-details-inner">
                                    <!-- product info -->
                                    <div class="product-info">
                                        <div class="product-rating">
                                            <div class="star-rating">
                                                <span></span>
                                            </div>
                                        </div>
    
                                        <!-- product title -->
                                        <div class="product-title">
                                            <h2><a href="shop-details.html">Woven Throw Pillow</a></h2>
                                        </div>
                                        <!-- end of product title -->
    
                                         <div class="product-price"><h3 class="new-price">$25</h3><h5 class="old-price">$30.1</h5></div>
    
                                         <div class="product-description">
                                             <p>Ladyship it daughter securing procured or am moreover mr Put sir she exercise vicinity cheerful wondered.</p>
                                         </div>
    
                                        <!-- list product group -->
                                        <div class="list-product-group">
                                            <ul class="mb-0 list-unstyled">
                                                <li class="size-group group">
                                                    <span class="list-heading">size:</span>
                                                    <ul class="size-list mb-0 list-unstyled">
                                                        <li><a href="#" class="product-size"><span>L</span></a></li>
                                                        <li><a href="#" class="active product-size"><span>M</span></a></li>
                                                        <li><a href="#" class="product-size"><span>S</span></a></li>
                                                    </ul>
                                                </li>
                                                <li class="quantity-group group">
                                                    <span class="list-heading">quantity:</span>
                                                    <div class="product-quantity">
                                                        <span class="minus"><img src="${base}/img/icons/minus.svg" class="svg" alt=""></span>
                                                        <input type="text" value="0" class="product-quantity-list product-size">
                                                        <span class="plus"><img src="${base}/img/icons/plus.svg" class="svg" alt=""></span>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                        <!-- End of list product group -->
    
                                        <!-- product details btns -->
                                        <div class="product-details-btns">
                                            <div class="addto-bag-btn">
                                                <a href="#" class="btn btn-fill-type">
                                                    <span><img src="${base}/img/icons/add-bag.svg" alt="" class="svg"></span><span class="d-none d-lg-block mr-0">Add To Cart</span>
                                                </a>
                                            </div>
                                             <div class="wish-btn">
                                                <a href="#" class="btn btn-fill-type">
                                                    <span class=""><img src="${base}/img/icons/wishlist.svg" alt="" class="svg"></span><span class="d-none d-lg-block mr-0"></span>
                                                </a>
                                            </div>
                                            <div class="compare-btn">
                                                <a href="#" class="btn btn-fill-type">
                                                    <span><img src="${base}/img/icons/compare.svg" alt="" class="svg"></span>
                                                </a>
                                            </div>
                                        </div>
                                        <!-- product details btns -->
    
                                        <!-- more detailes -->
                                        <div class="more-details-button">
                                            <a href="shop-details.html" class="btn btn-line roboto">More Details</a>
                                        </div>
                                        <!-- End of more detailes -->
    
                                        <!-- product mata -->
                                        <div class="product_meta item-product-meta-info">
                                            <span class="sku_wrapper">
                                                <label>
                                                    SKU:
                                                    <span>N/A</span>
                                                </label>
                                            </span>
                                            <span class="posted_in">
                                                <span class="meta-item-list">
                                                    <a href="#">accessories</a>,
                                                    <a href="#">fashion</a>,
                                                    <a href="#">summer</a>
                                                </span>
                                            </span>
                                        </div>
                                        <!-- End of product mata -->
                                    </div>
                                     <!-- End of product info -->
                                </div>
                                <!-- End of product details inner -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div> 
        <!--End of Modal quick view-->
    
        <!-- add add to cart notifacition -->
        <div class="modal-add-notifacition">
            <div class="add-notifacition-inner media align-items-center">
                <div class="add-noti-image">
                    <img src="${base}/img/product/add-note.jpg" alt="">
                </div>
                <div class="add-noti-text media-body">
                    <span>Cat Eye Reading Glasses</span>
                    <p>Added To Your Cart Successfully!</p>
                </div>
            </div>
        </div>
        <!-- add add to cart notifacition -->
    
        <!-- add add to cart notifacition -->
        <div class="modal-wish-notifacition">
            <div class="wish-notifacition-inner media align-items-center">
                <div class="wish-noti-image">
                    <img src="${base}/img/product/add-note.jpg" alt="">
                </div>
                <div class="wish-noti-text media-body">
                    <span>Cat Eye Reading Glasses</span>
                    <p>Added To Your Wish Successfully!</p>
                </div>
            </div>
        </div>
        <!-- add add to cart notifacition -->
    	<!-- The Modal -->
		<div id="myModal${count }" class="modal">
		
		  <!-- Modal content -->
		  <div class="modal-content">
		    <div class="modal-header">
		      <span onclick="CloseModal()" class="close">&times;</span>
		      
		      
		    </div>
		    <div class="modal-body">
		      <p>Bạn có chắc muốn hủy đơn hàng ${donHang.maDH }</p>
		      
		    </div>
		    <div class="modal-footer">
		      <button type="button" class="btn btn-secondary" onclick="CloseModal()" id="cancel">Đóng</button>
		      <button type="button" class="btn btn-primary" onclick="DeleteDonHang(${donHang.id})">Đồng ý!</button>
		    </div>
		  </div>
		
		</div>
        <!-- JS Files -->
       	<jsp:include page="/WEB-INF/views/customer/layout/js.jsp"></jsp:include>
    	<script type="text/javascript">
			function ShowModal() {
				var modal = document.getElementById("myModal");
				modal.style.display = "block";
			}
			function CloseModal() {
				var modal = document.getElementById("myModal");
				modal.style.display = "none";
			}
			
			
			function DeleteDonHang(donHangId) {
				// tạo javascript object.  
				var data = {
					id: donHangId,
				};
				
				// $ === jQuery
				// json == javascript object
				jQuery.ajax({
					url:  '${base}' + "/myaccount/order/delete",
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