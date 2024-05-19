<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
                        <div class="page-title-heading"><h1 class="h2">Gear<span>Phần cứng</span></h1></div>
                        <ul class="list-unstyled mb-0">
                            <li><a href="${base}/index">Trang chủ</a></li>
                            <li><a href="${base}/list">Sản phẩm</a></li>
                            <li class="active"><a>${phanCung.sanPham.tenSanPham }</a></li>
                        </ul>
                    </div>
                    <!-- End of page title inner -->
                </div>
            </div>
        </div>
    </section>
    <!-- End of page title -->
    
    <!-- product details wrapper -->
    <section class="pt-100 pb-70">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-6">
                    <!-- Start shop product slider -->
                    <div class="shop-product-slider-wrap">
                        <!-- Start shop slider top side -->
                         <div class="swiper-container product-gallery">
                            <div class="swiper-wrapper">
                                <c:set var="anhCount" value="1" scope="page" />
                            	<c:forEach items="${phanCung.sanPham.hinhAnhSanPhams }" var="hinhAnh">
	                                <div class="swiper-slide">
	                                    <img id="zoom_0${anhCount }" class='' src="${base}/upload/${hinhAnh.path}" data-zoom-image="${base}/upload/${hinhAnh.path}" alt=""/>
	                                </div>
                            		<c:set var="anhCount" value="${anhCount + 1 }" scope="page" />
                            	</c:forEach>
                            </div>
                        </div>
                         <!-- End of shop slider top side -->
                        
                        <!-- Start shop slider bottom side -->
                        <div class="swiper-container product-thumbs">
                            <div class="swiper-wrapper">
                                <c:set var="navCount" value="1" scope="page" />
                            	<c:forEach items="${phanCung.sanPham.hinhAnhSanPhams }" var="hinhAnh">
	                                <div class="swiper-slide">
	                                    <img src="${base}/upload/${hinhAnh.path}" style="height: 50px; width: 50px;" data-rjs="2" alt="">
	                                </div>
                            		<c:set var="navCount" value="${navCount + 1 }" scope="page" />
                            	</c:forEach>
                            </div>
                        </div>
                        <!-- End of shop slider bottom side -->
                    </div>
                    <!-- End of shop product slider -->
                </div>

                <div class="col-md-6">
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
                                <h2><a>${phanCung.sanPham.tenSanPham }</a></h2>
                            </div>
                            <!-- end of product title -->

                             <div class="product-price">
                             	<h3 class="new-price">${phanCung.sanPham.giaBanFormatted }</h3>
                             	<c:if test="${phanCung.sanPham.giamGia > 0 }">
                             		<h5 class="old-price">${phanCung.sanPham.giaTienFormatted }</h5>
                             	</c:if>
                             </div>

                             <div class="product-description">
                                 <p>Nhãn hàng: ${phanCung.sanPham.brand.tenHang }</p>
                             </div>

                            <!-- list product group -->
                            <div class="list-product-group">
                                <ul class="mb-0 list-unstyled">
                                    
                                    
                                    <li class="quantity-group group">
                                        <span class="list-heading">Số lượng:</span>
                                        <div class="product-quantity">
                                            <span class="minus"><img src="${base}/img/icons/minus.svg" class="svg" alt=""></span>
                                            <input type="number" id="quantityInput" value="1" name="soLuong" class="product-quantity-list product-size">
                                            <span id="increaseQuantity"><img src="${base}/img/icons/plus.svg" class="svg" alt=""></span>
                                        </div>
                                    </li>
                                    <li class="available-group group">
                                        <span class="list-heading">hàng đang có:</span>
                                        <div class="product-available">
                                            <input type="text" value="${phanCung.sanPham.soLuong }" class="product-quantity-list product-size">
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <!-- End of list product group -->

                            <!-- product details btns -->
                            <div class="product-details-btns">
                                <div class="addto-cart-btn">
                                    <div onclick="AddToCart('${base}',${phanCung.sanPham.id },parseInt(document.getElementById('quantityInput').value))">
	                                    <a role="button" class="btn btn-fill-type " >
	                                        <span><img src="${base}/img/icons/add-bag.svg" alt="" class="svg"></span><span class="d-none d-lg-block mr-0">Thêm vào giỏ hàng</span>
	                                    </a>
                                    </div>
                                </div>
                                 <div class="wish-btn">
                                    <a href="#" class="btn btn-fill-type">
                                        <span class=""><img src="${base}/img/icons/wishlist.svg" alt="" class="svg"></span><span class="d-none d-lg-block mr-0">Thêm vào Wishlist</span>
                                    </a>
                                </div>
                                
                            </div>
                            <!-- product details btns -->

                            

                            <!-- product share -->
                            <div class="single-product-share">
                                <label>
                                    <span><i class="fa fa-share"></i></span>
                                </label>
                                <ul class="list-unstyled mb-0">
                                    <li><a href="#"><i class="fa fa-facebook-f"></i></a></li>
                                    <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                    <li><a href="#"><i class="fa fa-instagram"></i></a></li>
                                    <li><a href="#"><i class="fa fa-pinterest"></i></a></li>
                                    <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                                </ul>
                                
                            </div>
                            <!-- End of product share -->
                        </div>
                         <!-- End of product info -->
                    </div>
                    <!-- End of product details inner -->
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <!-- product details tab -->
                    <div class="product-details-tab-inner">
                        <div class="product-details-nav">
                            <nav class="nav text-center">
                                <a id="nav-dis-tab" data-toggle="tab" href="#dis" class="active">Mô tả</a>
                                <a id="nav-revc-tab" data-toggle="tab" href="#revc">Đánh giá(5)</a>
                            </nav>
                        </div>
                    </div>
                    <!-- End of product details tab -->
                </div>
                <div class="col-12">
                    <div class="row">
                        <div class="col-lg-12">
                            <!-- product details tab Contaent-->
                            <div class="tab-content single-product-tab">
                                <div class="tab-pane fade show active" id="dis" role="tabpanel" aria-labelledby="nav-dis-tab">
                                    <!-- description inner -->
                                    <div class="description-inner">
                                        <p>${phanCung.sanPham.moTa }</p>
                                    </div>
                                    <!-- End of description inner -->
                                </div>
                                
                                
                            </div>
                            <!--End of product details tab Contaent-->
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <!--kinen related products heading -->
                    <div class="related-product-heading text-center">
                        <h2>Sản phẩm liên quan</h2>
                    </div>
                    <!--End of kinen related products heading -->
                </div>
                
                <c:forEach items="${listSPLQ}" var="sanpham">
                	
	                <div class="col-sm-6 col-12 col-lg-3">
	                    <!-- single product -->
	                    <c:choose>
	                    	<c:when test="${sanpham.trangThai == 0 || sanpham.soLuong <= 0 }">
	                    		<div class="single-product sold-product-tag">
	                    	</c:when>
	                    	<c:otherwise>
	                    		<div class="single-product">
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
                                       			<img class='normal-state' data-rjs="2" src="${base}/upload/${sanpham.avatar}" style="width: 255px; height: 350px;" alt="">
                                           		<img class='hover-state' data-rjs="2" src="${base}/upload/${sanpham.avatar}" style="width: 255px; height: 350px;" alt="">
                                       		</c:when>
                                       		<c:otherwise>
                                       			<img class='normal-state' data-rjs="2" src="${base}/img/product/product-4.jpg" alt="">
                                           		<img class='hover-state' data-rjs="2" src="${base}/img/product/product-4b.jpg" alt="">
                                       		</c:otherwise>
                                       	</c:choose>        
                                        </a>
	                                </div>
	                                <!-- End of Product Image -->
	
	                                <!-- product button -->
	                                <div class="product-buttons">
	                                    <%--<div class="quick-btn">
	                                        <div class="quick-icon-btn">
	                                            <a href="#" class="quick_view">
	                                                <span class="product-icon"><i class="fa fa-eye" aria-hidden="true"></i></span>
	                                                <span class="icon-title">Quick View</span>
	                                            </a>
	                                        </div>
	                                    </div>--%>
	                                    <div class="addto-cart-btn">
	                                        <div class="addto-icon-btn" onclick="AddToCart('${base}',${sanpham.id },1)">
	                                            <a href="#">
	                                                <span class="product-icon"><img src="${base}/img/icons/add-bag.svg" alt="" class="svg"></span>
	                                                <span class="icon-title">Add To Cart</span>
	                                            </a>
	                                        </div>
	                                        
	                                    </div>
	                                    <div class="wishlist-btn">
	                                        <div class="wishlist-icon-btn">
	                                            <a href="#">
	                                            <span class="product-icon"><img src="${base}/img/icons/wishlist.svg" alt="" class="svg"></span>
	                                                <span class="icon-title">See Wish List</span>
	                                            </a>
	                                        </div>
	                                        
	                                    </div>
	                                    <%-- <div class="copmare-btn">
	                                        <div class="compare-icon-btn">
	                                            <a href="#">
	                                                <span class="product-icon"><img src="${base}/img/icons/compare.svg" alt="" class="svg"></span>
	                                                <span class="icon-title">Compare</span>
	                                            </a>
	                                        </div>
	                                        
	                                    </div>--%>
	                                </div>
	                                <!-- End of product button -->
	
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
	                                <div class="product-price"><h5>${sanpham.giaBanFormatted }</h5></div>
	                                <div class="product-rating">
	                                    <div class="star-rating">
	                                        <span></span>
	                                    </div>
	                                </div>
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
    <!-- End of product details wrapper -->

    <!-- footer area -->
    <jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>
    
    <jsp:include page="/WEB-INF/views/customer/layout/back-to-top.jsp"></jsp:include>
    <!-- back to top -->
    
        
        <!-- End of main wrapper -->
    
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
        <div class="modal-addproduct-notifacition">
            <div class="add-notifacition-inner media align-items-center">
                
                <div class="add-noti-text media-body" id="messageDiv">
                    
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
    	<script type="text/javascript">
	    	
	    	// Lấy phần tử input số lượng và nút tăng số lượng
	    	let quantityInput = document.getElementById("quantityInput");
	    	let increaseQuantityBtn = document.getElementById("increaseQuantity");
	
	    	// Thêm sự kiện click cho nút tăng số lượng
	    	increaseQuantityBtn.addEventListener("click", function() {
	    	    // Lấy giá trị hiện tại của input
	    	    let currentValue = parseInt(quantityInput.value);
	    	    // Kiểm tra nếu giá trị nhỏ hơn  thì tăng giá trị
	    	    if (currentValue < ${phanCung.sanPham.soLuong}) {
	    	        quantityInput.value = currentValue + 1;
	    	    }
	    	});
	    	
    	</script>
    </body>
    </html>