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

    <!-- featured section -->
    <div class="main-index">
        <div class="container">
            <div class="slider">
                <input type="radio" name="s" id="s1" checked>
                <input type="radio" name="s" id="s2">
                <input type="radio" name="s" id="s3">
                <input type="radio" name="s" id="s4">
                <ul>
                    <li class="slide" id="slide1">
                        <a href="">
                            <img src="${base }/img/slide_1.jpg" alt="" width="100%">
                        </a>
                    </li>
                    <li class="slide" id="slide2">
                        <a href="">
                            <img src=".${base }/img/slide_2.jpg" alt="" width="100%">
                        </a>
                    </li>
                    <li class="slide" id="slide3">
                        <a href="">
                            <img src="${base }/img/slide_3.jpg" alt="" width="100%">
                        </a>
                    </li>
                    <li class="slide" id="slide4">
                        <a href="">
                            <img src="${base }/img/slide_4.jpg" alt="" width="100%">
                        </a>
                    </li>
                    
                </ul>
                <div class="label">
                    <label for="s1" class="circle"></label>
                    <label for="s2" class="circle"></label>
                    <label for="s3" class="circle"></label>
                    <label for="s4" class="circle"></label>
                </div>
            </div>
            <div class="hot">
                
            </div>
        </div>
        <script type="text/javascript">
            var n=1;
            setInterval(function(){
                document.getElementById('s'+n).checked=true;
                n++;
                if(n>4){
                    n=1;
                }
            },4000)
        </script>
    </div>
    <!-- End of featured section -->
    
    <!-- New Arrival type2-->
    <section>
        <div class="container">
            <div class="row">
                <div class="col">
                <!-- section title -->
                    <div class="section-title-wrap">
                        <div class="section-title">
                            <h2>Sản phẩm HOT</h2>
                        </div>
                    </div>
                <!-- End of section title -->
                </div>
            </div>
            <div class="row">
            	<c:forEach items="${sanPhamHots }" var="sanpham">
            		
	                <div class="col-md-6 col-sm-12 col-lg-4">
	                    <!-- single product -->
	                    <div class="single-product type2">
	                        <div class="product-item">
	                            <div class="product-thumb">
	                                <!-- Product Image -->
	                                <div class="product-image">
	                                    <c:choose>
											<c:when test="${sanpham.loaiSanPham == 1}">
												<a href="${base }/computer/${sanpham.id}">
											</c:when>
											<c:when test="${sanpham.loaiSanPham == 2 || sanpham.loaiSanPham == 5}">
												<a href="${base }/laptop/${sanpham.id}">
											</c:when>
											<c:when test="${sanpham.loaiSanPham == 3}">
												<a href="${base }/hardware/${sanpham.id}">
											</c:when>
											<c:when test="${sanpham.loaiSanPham == 4}">
												<a href="${base }/gear/${sanpham.id}">
											</c:when>
										</c:choose>
                                       	<c:choose>
                                       		<c:when test="${sanpham.avatar != null }">
                                       			<img class='normal-state' data-rjs="2" src="${base}/upload/${sanpham.avatar}" style="width: 350px; height: 330px;" alt="">
                                           		<img class='hover-state' data-rjs="2" src="${base}/upload/${sanpham.avatar}" style="width: 350px; height: 330px;" alt="">
                                       		</c:when>
                                       		<c:otherwise>
		                                        <img class='normal-state' data-rjs="2" src="${base }/img/product/product-1v2.jpg" alt="">
		                                        <img class='hover-state' data-rjs="2" src="${base }/img/product/product-1v2b.jpg" alt="">
	                                       	</c:otherwise>
                                      	</c:choose>
	                                     </a>
	                                </div>
	                                <!-- End of Product Image -->
	
	                                <!-- product button -->
	                                <div class="product-buttons">
	                                    
	
	                                    <div class="addto-cart-btn">
	                                        <div class="addto-icon-btn" onclick="AddToCart('${base}',${sanpham.id },1)">
	                                            <a href="#">
	                                                <span class="product-icon"><img src="${base }/img/icons/add-bag.svg" alt="" class="svg"></span>
	                                                <span class="icon-title">Add To Cart</span>
	                                            </a>
	                                        </div>
	                                    </div>
	                                    <div class="wishlist-btn">
	                                        <div class="wishlist-icon-btn">
	                                            <a href="#">
	                                            <span class="product-icon"><img src="${base }/img/icons/wishlist.svg" alt="" class="svg"></span>
	                                                <span class="icon-title">See Wish List</span>
	                                            </a>
	                                        </div>
	                                    </div>
	                                    
	                                </div>
	                                <!-- End of product button -->
	                                
	                                
	                                <c:choose>
	                                	<c:when test="${sanpham.trangThai == 0 || sanpham.soLuong <= 0 }">
	                                		<!-- sold item tag -->
			                                <div class="product-tag">
			                                    <div class="tag-text">
			                                        <span>Hết hàng</span>
			                                    </div>
			                                </div>
			                                <!-- End of sold item tag -->
	                                	</c:when>
	                                	<c:when test="${sanpham.giamGia > 0 && sanpham.soLuong > 0 }">
	                                		<!-- discount tag -->
	                                		<div class="product-tag discount-tag">
			                                    <div class="tag-text">
			                                        <span>-${sanpham.giamGia }%</span>
			                                    </div>
			                                </div>
			                                <!-- End of discount tag -->
	                                	</c:when>
	                                </c:choose>
	                                
                                
	                            </div>
	
	                            <!-- product info -->
	                            <div class="product-info">
	                                <div class="product-rating">
	                                    <div class="star-rating">
	                                        <span></span>
	                                    </div>
	                                </div>
	
	                                <!-- product title -->
	                                <div class="product-title">
	                                    <h4>
	                                    	<c:choose>
												<c:when test="${sanpham.loaiSanPham == 1}">
													<a href="${base }/computer/${sanpham.id}">${sanpham.tenSanPham }
												</c:when>
												<c:when test="${sanpham.loaiSanPham == 2 || sanpham.loaiSanPham == 5}">
													<a href="${base }/laptop/${sanpham.id}">${sanpham.tenSanPham }
												</c:when>
												<c:when test="${sanpham.loaiSanPham == 3}">
													<a href="${base }/hardware/${sanpham.id}">${sanpham.tenSanPham }
												</c:when>
												<c:when test="${sanpham.loaiSanPham == 4}">
													<a href="${base }/gear/${sanpham.id}">${sanpham.tenSanPham }
												</c:when>
											</c:choose>
                                         	</a>
                                    	</h4>
	                                </div>
	                                <!-- end of product title -->
	
	                                 <div class="product-price" style="width: 100%;"><h5>${sanpham.giaBanFormatted }</h5></div>
	                            </div>
	                             <!-- End of product info -->
	                        </div>
	                    </div>
	                    <!-- End of single product -->
	                </div>
            	</c:forEach>
               
            </div>
        </div>
    </section>
    <!-- End of New Arrival type2-->

    <!-- top sellers type2-->
    <section class="pt-100 pb-70">
        <div class="container">
            <div class="row">
            	
                <div class="col-6">
                <!-- section title -->
                    <div class="section-title-wrap">
                        <div class="section-title">
                            <h2>Sản phẩm </h2>
                        </div>
                    </div>
                <!-- End of section title -->
                </div>
                <div class="col-6" style="text-align: right;">
                <!-- section title -->
                    
                 	<a href="${base }/list">Xem thêm</a>
                 
                <!-- End of section title -->
                </div>
            </div>
            <div class="row">
                <c:forEach items="${sanPhams }" var="sanpham">
	                <div class="col-md-6 col-sm-12 col-lg-4">
	                    <!-- single product -->
	                    <c:choose>
	                    	<c:when test="${sanpham.trangThai == 0 || sanpham.soLuong <= 0 }">
	                    		<div class="single-product type2 sold-product-tag">
	                    	</c:when>
	                    	<c:otherwise>
	                    		<div class="single-product type2">
	                    	</c:otherwise>
	                    </c:choose>
	                        <div class="product-item">
	                            <div class="product-thumb">
	                                <!-- Product Image -->
	                                <div class="product-image">
	                                    <c:choose>
											<c:when test="${sanpham.loaiSanPham == 1}">
												<a href="${base }/computer/${sanpham.id}">
											</c:when>
											<c:when test="${sanpham.loaiSanPham == 2 || sanpham.loaiSanPham == 5}">
												<a href="${base }/laptop/${sanpham.id}">
											</c:when>
											<c:when test="${sanpham.loaiSanPham == 3}">
												<a href="${base }/hardware/${sanpham.id}">
											</c:when>
											<c:when test="${sanpham.loaiSanPham == 4}">
												<a href="${base }/gear/${sanpham.id}">
											</c:when>
										</c:choose>
                                       	<c:choose>
                                       		<c:when test="${sanpham.avatar != null }">
                                       			<img class='normal-state' data-rjs="2" src="${base}/upload/${sanpham.avatar}" style="width: 350px; height: 330px;" alt="">
                                           		<img class='hover-state' data-rjs="2" src="${base}/upload/${sanpham.avatar}" style="width: 350px; height: 330px;" alt="">
                                       		</c:when>
                                       		<c:otherwise>
		                                        <img class='normal-state' data-rjs="2" src="${base }/img/product/product-1v2.jpg" alt="">
		                                        <img class='hover-state' data-rjs="2" src="${base }/img/product/product-1v2b.jpg" alt="">
	                                       	</c:otherwise>
                                      	</c:choose>
	                                     </a>
	                                </div>
	                                <!-- End of Product Image -->
	
	                                <!-- product button -->
	                                <div class="product-buttons">
	                                    
	
	                                    <div class="addto-cart-btn">
	                                        <div class="addto-icon-btn" onclick="AddToCart('${base}',${sanpham.id },1)">
	                                            <a href="#">
	                                                <span class="product-icon"><img src="${base }/img/icons/add-bag.svg" alt="" class="svg"></span>
	                                                <span class="icon-title">Add To Cart</span>
	                                            </a>
	                                        </div>
	                                    </div>
	                                    <div class="wishlist-btn">
	                                        <div class="wishlist-icon-btn">
	                                            <a href="#">
	                                            <span class="product-icon"><img src="${base }/img/icons/wishlist.svg" alt="" class="svg"></span>
	                                                <span class="icon-title">See Wish List</span>
	                                            </a>
	                                        </div>
	                                    </div>
	                                    
	                                </div>
	                                <!-- End of product button -->
	                                
	                                
	                                <c:choose>
	                                	<c:when test="${sanpham.trangThai == 0 || sanpham.soLuong <= 0 }">
	                                		<!-- sold item tag -->
			                                <div class="product-tag">
			                                    <div class="tag-text">
			                                        <span>Hết hàng</span>
			                                    </div>
			                                </div>
			                                <!-- End of sold item tag -->
	                                	</c:when>
	                                	<c:when test="${sanpham.giamGia > 0 && sanpham.soLuong > 0 }">
	                                		<!-- discount tag -->
	                                		<div class="product-tag discount-tag">
			                                    <div class="tag-text">
			                                        <span>-${sanpham.giamGia }%</span>
			                                    </div>
			                                </div>
			                                <!-- End of discount tag -->
	                                	</c:when>
	                                </c:choose>
	                                
                                
	                            </div>
	
	                            <!-- product info -->
	                            <div class="product-info">
	                                <div class="product-rating">
	                                    <div class="star-rating">
	                                        <span></span>
	                                    </div>
	                                </div>
	
	                                <!-- product title -->
	                                <div class="product-title">
	                                    <h4>
	                                    	<c:choose>
												<c:when test="${sanpham.loaiSanPham == 1}">
													<a href="${base }/computer/${sanpham.id}">${sanpham.tenSanPham }
												</c:when>
												<c:when test="${sanpham.loaiSanPham == 2 || sanpham.loaiSanPham == 5}">
													<a href="${base }/laptop/${sanpham.id}">${sanpham.tenSanPham }
												</c:when>
												<c:when test="${sanpham.loaiSanPham == 3}">
													<a href="${base }/hardware/${sanpham.id}">${sanpham.tenSanPham }
												</c:when>
												<c:when test="${sanpham.loaiSanPham == 4}">
													<a href="${base }/gear/${sanpham.id}">${sanpham.tenSanPham }
												</c:when>
											</c:choose>
                                         	</a>
                                    	</h4>
	                                </div>
	                                <!-- end of product title -->
	
	                                 <div class="product-price" style="width: 100%;"><h5>${sanpham.giaBanFormatted }</h5></div>
	                            </div>
	                             <!-- End of product info -->
	                        </div>
	                    </div>
	                    <!-- End of single product -->
	                </div>
            	</c:forEach>
               
            </div>
        </div>
    </section>
    <!-- End of top sellers type2-->

    <!-- Subscribe area -->
    <section class="pt-70 pb-80 subscribe-bg type2" data-bg-img='${base }/img/subscribe-bg.jpg'>
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-6">
                    <!-- subscribe text -->
                    <div class="subscribe-text">
                        <h2>Theo dõi ngay!</h2>
                        <p>Nhận coupon giảm giá đến 5 triệu đồng.</p>
                    </div>
                    <!-- End of subscribe text -->
                </div>
                <div class="col-md-6 align-self-end">
                    <!-- subscribe form -->
                    <div class="primary-form parsley-validate subscribe-form">
                        <form action="https://themelooks.us13.list-manage.com/subscribe/post?u=79f0b132ec25ee223bb41835f&id=f4e0e93d1d" method='post' target="_blank" novalidate>
                            <input type="email" name="email" class="theme-input-style" placeholder="Nhập Email tại đây" required>
                            <button type="submit" class="subscribe-btn">Theo dõi</button>
                        </form>
                    </div>
                    <!-- End of subscribe form -->
                </div>
            </div>
        </div>
    </section>
    <!-- End of Subscribe area -->

    <jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>
    
    <jsp:include page="/WEB-INF/views/customer/layout/back-to-top.jsp"></jsp:include>
        
    
        <!-- Modal quick view-->
        <div class="modal-quickview-container">
            <div class="quick-view-content-wrap">
                <div class="modal-window-overlay"></div>
                <div class="quick-view-content">
                    <div class="modal-window-close">
                        <img src="${base }/img/icons/close-button.svg" class="svg" alt="">
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
                                                <img class='' src="${base }/img/shop/quick-view1.png" alt="" data-rjs="2" />
                                            </div>
                                            <div class="swiper-slide">
                                                <img class='' src="${base }/img/shop/quick-view2.png"  alt="" data-rjs="2" />
                                            </div>
                                            <div class="swiper-slide">
                                                <img class='' src="${base }/img/shop/quick-view3.png" alt="" data-rjs="2" />
                                            </div>
                                            <div class="swiper-slide">
                                                <img class='' src="${base }/img/shop/quick-view4.png" alt="" data-rjs="2" />
                                            </div>
                                        </div>
                                    </div>
                                     <!-- End of shop slider top side -->
                                    
                                    <!-- Start shop slider bottom side -->
                                    <div class="swiper-container quick-product-thumbs">
                                        <div class="swiper-wrapper">
                                            <div class="swiper-slide">
                                                <img src="${base }/img/shop/details-nav1.png" data-rjs="2" alt="">
                                            </div>
                                            <div class="swiper-slide">
                                                <img src="${base }/img/shop/details-nav3.png" data-rjs="2" alt="">
                                            </div>
                                            <div class="swiper-slide">
                                                <img src="${base }/img/shop/details-nav4.png" data-rjs="2" alt="">
                                            </div>
                                            <div class="swiper-slide">
                                                <img src="${base }/img/shop/details-nav5.png" data-rjs="2" alt="">
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
                                                        <span class="minus"><img src="${base }/img/icons/minus.svg" class="svg" alt=""></span>
                                                        <input type="text" value="0" class="product-quantity-list product-size">
                                                        <span class="plus"><img src="${base }/img/icons/plus.svg" class="svg" alt=""></span>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                        <!-- End of list product group -->
    
                                        <!-- product details btns -->
                                        <div class="product-details-btns">
                                            <div class="addto-bag-btn">
                                                <a href="#" class="btn btn-fill-type">
                                                    <span><img src="${base }/img/icons/add-bag.svg" alt="" class="svg"></span><span class="d-none d-lg-block mr-0">Add To Cart</span>
                                                </a>
                                            </div>
                                             <div class="wish-btn">
                                                <a href="#" class="btn btn-fill-type">
                                                    <span class=""><img src="${base }/img/icons/wishlist.svg" alt="" class="svg"></span><span class="d-none d-lg-block mr-0"></span>
                                                </a>
                                            </div>
                                            <div class="compare-btn">
                                                <a href="#" class="btn btn-fill-type">
                                                    <span><img src="${base }/img/icons/compare.svg" alt="" class="svg"></span>
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
        <div class="modal-addproduct-notifacition">
            <div class="add-notifacition-inner media align-items-center">
                
                <div class="add-noti-text media-body" id="messageDiv">
                    
                </div>
            </div>
        </div>
       
        <!-- add add to cart notifacition -->
        <div class="modal-wish-notifacition">
            <div class="wish-notifacition-inner media align-items-center">
                <div class="wish-noti-image">
                    <img src="${base }/img/product/add-note.jpg" alt="">
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