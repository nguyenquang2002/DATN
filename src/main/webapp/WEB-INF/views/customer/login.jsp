<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

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
                        <div class="page-title-heading"><h1 class="h2">Đăng nhập<span>Đăng ký</span></h1></div>
                        <ul class="list-unstyled mb-0">
                            <li><a href="${base}/index">Trang chủ</a></li>
                            <li class="active"><a href="${base}/login">Đăng nhập</a></li>
                        </ul>
                    </div>
                    <!-- End of page title inner -->
                </div>
            </div>
        </div>
    </section>
    <!-- End of page title -->
    
    <!-- logout register wrap -->
    <section class="pt-100 pb-100">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-8 col-lg-6">
                    <!-- login register -->
                    <div class="login-register-wrap text-center main-log-regi">
                        <!-- login register nav -->
                        <div class="login-register-nav">
                            <nav class="nav lr-nav text-center">
                                <a id="nav-login-tab2" data-toggle="tab" href="#login2" class="active">Đăng nhập</a>
                                <a id="nav-register-tab2" data-toggle="tab" href="#reg2">Đăng ký</a>
                            </nav>
                        </div>
                        <!-- End of login register nav -->
						<!-- Thêm mã HTML để hiển thị thông báo lỗi -->
						<c:if test="${not empty errorMessage}">
						    <div class="alert alert-danger" role="alert" style="text-align: center; color: red;">
						        ${errorMessage}
						    </div>
						</c:if>
                        <!-- login register content -->
                        <div class="login-register-content tab-content">
                            <div class="tab-pane fade show active" id="login2" role="tabpanel" aria-labelledby="nav-login-tab2">
                                <div class="primary-form parsley-validate">
                                    <form action="${base }/login_processing_url" method="POST">
                                    	<c:if test="${not empty param.login_error}">
												<div class="alert alert-danger" role="alert" style="text-align: center; color: red;">
													Đăng nhập không thành công hãy thử lại
												</div>
										</c:if>
                                        <!-- loging input -->
                                        <div class="name-input input-field">
                                            <label>
                                                <img src="${base}/img/icons/account3.svg" class="svg" alt="">
                                            </label>
                                            <input type="text" placeholder='Tên đăng nhập' name="username" class="theme-input-style" required>
                                        </div>

                                        <div class="password-input input-field">
                                            <label>
                                                <img src="${base}/img/icons/regi-icon.svg" class="svg" alt="">
                                            </label>
                                            <input type="password" placeholder='Mật khẩu' name="password" class="theme-input-style" required>
                                        </div>
                                        <!-- loging input -->
                                        <button type="submit" class="btn btn-fill-type">Đăng nhập</button>
                                    </form>
                                    <p>Bạn chưa có tài khoản,<a id="nav-register-tab2" data-toggle="tab" href="#reg2">Đăng ký ngay!</a></p>
                                </div>
                            </div>

                            <div class="tab-pane fade" id="reg2" role="tabpanel" aria-labelledby="nav-register-tab2">
                                <div class="primary-form parsley-validate">
                                    <sf:form method="post" action="${base }/register" modelAttribute="user">
                                    
                                        <!-- register input -->
                                        <div class="name-input input-field">
                                            <label>
                                                <img src="${base}/img/icons/account-icon.svg" class="svg" alt="">
                                            </label>
                                            <sf:input type="text" path="username" name="username" placeholder='Tên đăng nhập' class="theme-input-style" required="required"></sf:input>
                                        </div>
                                        
                                        <div class="password-input input-field">
                                            <label>
                                                <img src="${base}/img/icons/regi-icon.svg" class="svg" alt="">
                                            </label>
                                            <sf:input type="password" path="password" name="password" placeholder='Mật khẩu' class="theme-input-style" required="required"></sf:input>
                                        </div>

                                        <div class="name-input input-field">
                                            <label>
                                                <img src="${base}/img/icons/account-icon.svg" class="svg" alt="">
                                            </label>
                                            <sf:input type="text" path="hoTen" name="hoTen" placeholder='Họ tên' class="theme-input-style" required="required"></sf:input>
                                        </div>

                                        <div class="name-input input-field">
                                            <label>
                                                <img src="${base}/img/icons/message.svg" class="svg" alt="">
                                            </label>
                                            <sf:input type="text" path="diaChi" name="diaChi" placeholder='Địa chỉ' class="theme-input-style" required="required"></sf:input>
                                        </div>

                                        <div class="email-input input-field">
                                            <label>
                                                <img src="${base}/img/icons/email-icon.svg" class="svg" alt="">
                                            </label>
                                            <sf:input type="email" path="email" name="email" placeholder='Email' class="theme-input-style" required="required"></sf:input>
                                        </div>

                                        <div class="name-input input-field">
                                            <label>
                                                <img src="${base}/img/icons/message.svg" class="svg" alt="">
                                            </label>
                                            <sf:input type="text" path="sdt" name="sdt" placeholder='Số điện thoại' class="theme-input-style" required="required"></sf:input>
                                        </div>

                                        
                                        <!-- register input -->
                                        <button type="submit" class="btn btn-fill-type" style="margin-top: 20px;">Đăng ký</button>
                                    </sf:form>
                                    
                                </div>
                            </div>
                        </div>
                        <!-- End of login register content -->
                    </div>
                    <!-- End of login register -->
                </div>
            </div>
        </div>
    </section>
    <!-- End of logout register wrap -->

    <!-- footer area -->
    <jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>
    
    <jsp:include page="/WEB-INF/views/customer/layout/back-to-top.jsp"></jsp:include>
    
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