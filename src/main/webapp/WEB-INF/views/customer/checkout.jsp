<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
                        <div class="page-title-heading"><h1 class="h2">Đặt hàng</h1></div>
                        <ul class="list-unstyled mb-0">
                            <li><a href="${base}/index">Trang chủ</a></li>
                            <li><a href="${base}/cart">Giỏ hàng</a></li>
                            <li class="active"><a href="${base}/checkout">Đặt hàng</a></li>
                        </ul>
                    </div>
                    <!-- End of page title inner -->
                </div>
            </div>
        </div>
    </section>
    <!-- End of page title -->
    
    <!-- check out wrap -->
    <section class="pt-100 pb-100">
        <div class="container">
            <div class="row">
                <div class="col-12">
                	<c:if test="${not empty errorMessage}">
					    <div class="alert alert-danger" role="alert" style="text-align: center; color: red;">
					        <p>${errorMessage}</p>
					        <p>Hãy kiểm tra lại sản phẩm</p>
					    </div>
					</c:if>
                    <!-- billing details wrap -->
                    <div class="billing-details-wrap">
                        <form action="${base }/checkout" method="POST">
                            <div class="row justify-content-center">
                                <div class="col-lg-6">
                                    <!-- billing details form-->
                                    <div class="billing-details">
                                        <div class="billing-heading">
                                            <h3>Thông tin hóa đơn</h3>
                                        </div>
                                        <div class="row">
                                            <div class="col-12">
                                                <!-- name -->
                                                <span class="woocommerce-input-wrapper">
                                                    <input type="text" value="${userLogined.hoTen }" name="hoTen" id="hoTen" class="theme-input-style" placeholder="Họ tên" required>
                                                </span>
                                                <!--End of name -->
                                            </div>
                                            
                                        </div>
                                        <div class="row">
                                            <div class="col-12">
                                                <!-- address -->
                                                <span class="woocommerce-input-wrapper">
                                                    <input type="text" value="${userLogined.diaChi }" name="diaChi" id="diaChi" class="theme-input-style" placeholder="Địa chỉ" required>
                                                </span>
                                                <!-- End of adđress -->
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12">
                                                <!-- Phone No -->
                                                <span class="woocommerce-input-wrapper">
                                                    <input type="number" value="${userLogined.sdt }" name="sdt" id="sdt" class="theme-input-style" placeholder="Số điện thọai" required>
                                                </span>
                                                <!-- End of Phone No -->
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12">
                                                <!-- Email Address -->
                                                <span class="woocommerce-input-wrapper">
                                                    <input type="email" value="${userLogined.email }" name="email" id="email" class="theme-input-style" placeholder="Email" required>
                                                </span>
                                                <!-- End of Email Address -->
                                            </div>
                                        </div>
                                        
                                        <div class="row">
                                            <div class="col-md-12">
                                                <!-- order note -->
                                                <label class="billing-textarea">
                                                    Ghi chú
                                                </label>
                                                <textarea name="textara" name="ghiChu" id="ghiChu" placeholder="Ghi chú thêm thông tin cho người giao hàng"></textarea>
                                                <!--End of order note -->
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End of billing details form-->
                                </div>
                                <div class="col-lg-6">
                                    <!-- your order -->
                                    <div class="checkout-review-order-wrap">
                                        <!-- checkout-review-order -->
                                        <div class="woocommerce-checkout-review-order">
                                            <div class="review-order-header">
                                                <h3>Đơn hàng của bạn</h3>
                                            </div>
                                            <table class="review-order-table">
                                                <tbody>
                                                    <tr>
                                                        <th>Sản phẩm</th>
                                                        <th>Tổng tiền</th>
                                                    </tr>
                                                    <c:forEach var="cartItem" items="${cart.cartItems }">
                                                    	<tr>
	                                                        <td>${cartItem.productName } <span>${cartItem.priceUnit}₫ X ${cartItem.quanlity }</span></td>
	                                                        <td>${cartItem.priceUnit * cartItem.quanlity}₫</td>
                                                    	</tr>
                                                    </c:forEach>
                                                    
                                                    <tr>
                                                        <td>Sub Total</td>
                                                        <td>${cart.totalPrice }₫</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <!-- checkout-review-order -->

                                        <!-- check Shipping warp -->
                                        <div class="check-shipping-wrap">
                                            <div class="check-shipping-heading">
                                                <h5>Shipping</h5>
                                            </div>
                                            <table class="check-shipping-table">
                                                <tbody>
                                                    <tr>
                                                        <td><label><input class="" type="radio" name='shipping-type' checked>
                                                            Freeship</label></td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                    
                                                    
                                                    <tr>
                                                        <td>Tổng tiền</td>
                                                        <td>${cart.totalPrice }₫</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <!-- End of check Shipping warp -->

                                        <!-- payment system -->
                                        <div class="payment-system-wrap">
                                            <div class="payment-system-heading">
                                                <h5>Phương thức thanh toán</h5>
                                            </div>
                                            <table class="payment-system-table">
                                                <tbody>
                                                    
                                                    <tr>
                                                        <td><label><input class="" type="radio" name="payment-type" data-parsley-multiple="payment-type" checked>Thanh toán khi nhận hàng</label></td>
                                                        
                                                    </tr>
                                                    

                                                </tbody>
                                            </table>
                                        </div>
                                        <!--End of payment system -->
                                    </div>
                                    <!--End of your order -->
                                </div>
                                <div class="col-md-7">
                                    <!-- woocommerce-terms-and-conditions-wrapper -->
                                    <div class="terms-and-conditions-wrapper text-center">
                                        <p>Thông tin cá nhân của bạn sẽ được sử dụng cho đơn hàng, giúp trải nghiệm<br> khi sử dụng trang web và những mục đích khác tốt hơn tại <a href="#">chính sách bảo mật</a>.</p>
                                        <label class="woocommerce-form__label woocommerce-form__label-for-checkbox checkbox">
                                            <input type="checkbox" class="woocommerce-form__input woocommerce-form__input-checkbox input-checkbox">
                                            <span>Tôi đồng ý với <a href="#">các điều khoản và điều kiện</a></span>
                                        </label>
                                        <button type="submit" class="billing-submit-button btn btn-fill-type">Đặt hàng</button>
                                    </div>
                                    <!-- End of woocommerce-terms-and-conditions-wrapper -->
                                </div>
                            </div>
                        </form>
                    </div>
                    <!-- End of billing details wrap -->
                </div>
            </div>
        </div>        
    </section>
    <!--End of check out wrap -->
    
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