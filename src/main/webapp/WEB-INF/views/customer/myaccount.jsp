<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!-- import JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<jsp:include page="/WEB-INF/views/customer/layout/head.jsp"></jsp:include>

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
                        <div class="page-title-heading"><h1 class="h2">Tài khoản của tôi<span>Thông tin</span></h1></div>
                        <ul class="list-unstyled mb-0">
                            <li><a href="${base}/index">Trang chủ</a></li>
                            <li class="active"><a href="${base}/myaccount">Tài khoản</a></li>
                        </ul>
                    </div>
                    <!-- End of page title inner -->
                </div>
            </div>
        </div>
    </section>
    <!-- End of page title -->
    
    <!-- logout register wrap -->
    <section class="pt-30 pb-100">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <!-- dash board nav-->
                    <div class="dashboard-inner">
                        <nav>
                            <ul class="nav-list nav">
                                
                                <li>
                                    <a class="dashboard-nav-item active" id='nav-adetails' data-toggle="tab" href="#adetails"><span><img src="${base}/img/icons/account3.svg" class="svg" alt=""></span>Thông tin tài khoản</a>
                                </li>
                                <li>
                                    <a class="dashboard-nav-item" id="nav-order" data-toggle="tab"  href="#order"><span><img src="${base}/img/icons/order.svg" class="svg" alt=""></span>Đơn hàng</a>
                                </li>
                                <li>
                                    <a class="dashboard-nav-item" id="nav-address" data-toggle="tab" href="#address"><span><img src="${base}/img/icons/address.svg" class="svg" alt=""></span>Đổi mật khẩu</a>
                                </li>
                                <li>
                                    <a class="dashboard-nav-item" href="${base }/logout"><span><img src="${base}/img/icons/logout.svg" class="svg" alt=""></span>Đăng xuất</a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                    <!-- End of dash board nav-->
                </div>
                <div class="col-lg-9">
                    <!-- dashboard content -->
                    <div class="deshboard-content-wrap">
                        <div class="tab-content dashboad-tab-content">
                            
                            <div class="tab-pane fade show active" id="adetails" role="tabpanel" aria-labelledby='nav-adetails'>
                                <!-- Account details-->
                                <div class="account-details">
                                    <!-- dashboard info -->
                                    <div class="dashboard-tab-info">
                                        <p>Hello ${userLogined.username} , <span>(not ${userLogined.username}? <a href="${base }/logout">Đăng xuất</a>)</span></p>
                                    </div>
                                    <!--End of dashboard info -->
                                    <sf:form action="${base }/myaccount" modelAttribute="userLogined" method="POST">
                                    	<div id="account" style="display: none;">
						                    <p>Account:</p>
						                    <sf:input path="id" type="text" name="id" class="form_control" id="signup_account" autocomplete="none" required="required" readonly="readonly"></sf:input>
						                </div>
                                        <div class="row">
                                            <div class="col-12">
                                                <!-- name -->
                                                <span class="woocommerce-input-wrapper">
                                                    <sf:input path="username" name="username" type="text" class="theme-input-style" placeholder="Họ tên" required="required"></sf:input>
                                                </span>
                                                <!--End of name -->
                                            </div>
                                            
                                        </div>
                                        <div class="row">
                                            <div class="col-12">
                                                <!-- address -->
                                                <span class="woocommerce-input-wrapper">
                                                    <sf:input path="diaChi" name="diaChi" type="text" class="theme-input-style" placeholder="Địa chỉ" required="required"></sf:input>
                                                </span>
                                                <!-- End of adđress -->
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12">
                                                <!-- Phone No -->
                                                <span class="woocommerce-input-wrapper">
                                                    <sf:input path="sdt" name="sdt" type="text" class="theme-input-style" placeholder="Số điện thọai" required="required"></sf:input>
                                                </span>
                                                <!-- End of Phone No -->
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12">
                                                <!-- Email Address -->
                                                <span class="woocommerce-input-wrapper">
                                                    <sf:input path="email" name="email" type="email" class="theme-input-style" placeholder="Email" required="required"></sf:input>
                                                </span>
                                                <!-- End of Email Address -->
                                            </div>
                                        </div>
                                        

                                        
                                        <button type="submit" class="btn btn-fill-type">Thay đổi thông tin</button>

                                    </sf:form>
                                </div>
                                <!-- End of Account details -->
                            </div>

                            <div class="tab-pane fade" id="order" role="tabpanel" aria-labelledby='nav-order'>
                                <!-- dashboard order -->
                                <div class="dashboard-tab-order">
                                    <!-- dashboard order table -->
                                    <table class="dashboard-order-table">
                                        <tbody>
                                            <tr>
                                                <th>Mã đơn hàng</th>
                                                <th>Ngày</th>
                                                <th>Trạng thái</th>
                                                <th>Tổng tiền</th>
                                                <th>Thao tác</th>
                                            </tr>
                                            
                                            <c:forEach var="donHang" items="${donHangs }">
                                            	<tr>
	                                                <td>${donHang.maDH }</td>
	                                                <c:choose>
	                                                	<c:when test="${donHang.trangThai == 0 }">
	                                                		<td>${donHang.ngayHuy }</td>
	                                                		<td style="color: red;">Đã hủy</td>
	                                                	</c:when>
	                                                	<c:when test="${donHang.trangThai == 1 }">
	                                                		<td>${donHang.ngayDatHang }</td>
	                                                		<td>Đã đặt hàng</td>
	                                                	</c:when>
	                                                	<c:when test="${donHang.trangThai == 2 }">
	                                                		<td>${donHang.ngayXacNhan }</td>
	                                                		<td style="color: blue;">Chuẩn bị hàng</td>
	                                                	</c:when>
	                                                	<c:when test="${donHang.trangThai == 3 }">
	                                                		<td>${donHang.ngayGiaoHang }</td>
	                                                		<td style="color: blue;">Đang giao hàng</td>
	                                                	</c:when>
	                                                	<c:when test="${donHang.trangThai == 4 }">
	                                                		<td>${donHang.ngayGiaoHangTC }</td>
	                                                		<td style="color: green;">Giao hàng thành công</td>
	                                                	</c:when>
	                                                </c:choose>
	                                                
	                                                <td>${donHang.tongTienFormatted } <span>(${donHang.soLuongSP } sản phẩm)</span></td>
	                                                <td><a href="${base }/myaccount/order/${donHang.maDH}">Xem chi tiết</a></td>
	                                            </tr>
	                                        
                                            </c:forEach>
                                            
                                            
                                        </tbody>
                                    </table>
                                    <!--End of dashboard order table -->
                                </div>
                                <div class="row">
                                	<a href="${base }/myaccount/order" class="btn btn-fill-type" style="margin-top: 20px; margin-left: 10px;">Xem thêm</a>
                                </div>
                                <!-- End of dashboard order -->
                            </div>

                            
                            <div class="tab-pane fade" id="address" role="tabpanel" aria-labelledby='nav-address'>
                                <!-- password -->
                                <form action="#" method="post">
                                    
                                        
                                    <!-- password change -->
                                    <div class="passwrd-change-wrap">
                                        <h5>Đổi mật khẩu</h5>
                                        <div class="row">
                                            <div class="col-12">
                                                <span class="woocommerce-input-wrapper">
                                                    <input type="password" class="theme-input-style" placeholder="Mật khẩu hiện tại" required>   
                                                </span>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12" style="margin-top: 20px;">
                                                <input type="password" class="theme-input-style" placeholder="Mật khẩu mới" required>   
                                            </div>
                                        </div>                                         
                                        <div class="row">
                                            <div class="col-12" style="margin-top: 20px;">
                                                <input type="password" class="theme-input-style" placeholder="Nhập lại mật khẩu" required>   
                                            </div>
                                        </div>
                                        <button type="submit" class="btn btn-fill-type" style="margin-top: 20px;">Đổi mật khẩu</button>
                                    
                                    <!-- End of password change -->
                                    </div>
                                    
                                </form>
                                <!-- End of password -->
                            </div>
                        </div>
                    </div>
                    <!-- End of dashboard content -->
                </div>
            </div>
        </div>
    </section>
    <!-- End of logout register wrap -->

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
    
        <!-- JS Files -->
       	<jsp:include page="/WEB-INF/views/customer/layout/js.jsp"></jsp:include>
    
    </body>
    </html>