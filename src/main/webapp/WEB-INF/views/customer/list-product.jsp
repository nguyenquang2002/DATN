<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- SPRING FORM -->
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
                        <div class="page-title-heading"><h1 class="h2">Sản phẩm</h1></div>
                        <ul class="list-unstyled mb-0">
                            <li><a href="${base}/">Trang chủ</a></li>
                            <li class="active"><a href="${base}/list">Sản phẩm</a></li>
                        </ul>
                    </div>
                    <!-- End of page title inner -->
                </div>
            </div>
        </div>
    </section>
    <!-- End of page title -->
    
    <!-- product shop wrapper -->
    <section class="pt-100 pb-40">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <!-- shop toolbar wrap -->
                    <div class="shop-toolbar-wrap type2">
                        <div class="shop-toolbar-filter">
                            <div class="row align-items-center">
                                <div class="col-md-4 position-static">
                                    <div class="search-form position-relative">
                                        <form action="${base }/list" method="get">
                                        	<input id="page" placeholder="Số trang" name="page" class="form-control" value="${searchModel.page }" style="display: none;">
                                        	<input id="loaiSP" placeholder="Loại sản phẩm" name="loaiSP" class="form-control" value="${searchModel.loaiSP }" style="display: none;">
                                        	<input id="brandID" placeholder="Nhãn hàng" name="brandID" class="form-control" value="${searchModel.brandID }" style="display: none;">
                                        	<input id="price" placeholder="Giá bán" name="price" class="form-control" value="${searchModel.price }" style="display: none;">
                                            <input type="text" placeholder="Bạn đang tìm gì?" name="keyword" class="theme-input-style" value="${searchModel.keyword }">
                                            <button type="submit" id="btnSearch" name="btnSearch" value="Search"><img src="${base}/img/icons/search-button3.svg" class="svg" alt=""></button>
                                        </form>
                                    </div>
                                </div>
                                <div class="col-md-8 col-lg-7 col-xl-6 offset-xl-2 offset-lg-1 position-static">
                                    <!-- product filter inner -->
                                    <div class="product-filter-inner">
                                        <!-- product found -->
                                        <div class="product-found product-count">
                                            <span>Tổng cộng ${products.totalItems } kết quả</span>
                                        </div>
                                        <!-- End of product found -->

                                        <!-- product filter -->
                                        <div class="product-filter catalog-filter">
                                            <div class="product-filter-mobile">
                                                <a href="#" class="d-lg-none d-block"><i class="fa fa-sliders"></i></a>
                                            </div>
                                            <a href="#" class="d-none d-lg-block product-filter-btn"><i class="fa fa-filter"></i><span>Lọc</span><i class="fa fa-angle-down"></i></a>
                                            
                                            <!-- product filter menu -->
                                            <div class="product-filter-menu">
                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <div class="woocommerce-products-header">
                                                            <div class="shope-filter-item">
                                                                <ul>
                                                                    <li>
                                                                        <a>Loại sản phẩm</a>
                                                                        <ul class="category-list">
                                                                        	<li><a role="button" onclick="document.getElementById('loaiSP').value='0'" class="${searchModel.loaiSP == 0 ? 'active' : ''}" ><label for="btnSearch">ALL(${spCount })</label></a></li>
                                                                            <li><a role="button" onclick="document.getElementById('loaiSP').value='1'" class="${searchModel.loaiSP == 1 ? 'active' : ''}" ><label for="btnSearch">Desktop(${pcCount })</label></a></li>
                                                                            <li><a role="button" onclick="document.getElementById('loaiSP').value='2'" class="${searchModel.loaiSP == 2 ? 'active' : ''}" ><label for="btnSearch">Laptop(${laptopCount })</label></a></li>
                                                                            <li><a role="button" onclick="document.getElementById('loaiSP').value='5'" class="${searchModel.loaiSP == 5 ? 'active' : ''}" ><label for="btnSearch">Laptop Gaming(${laptopGamingCount })</label></a></li>
                                                                            <li><a role="button" onclick="document.getElementById('loaiSP').value='3'" class="${searchModel.loaiSP == 3 ? 'active' : ''}" ><label for="btnSearch">Phần cứng(${hardCount })</label></a></li>
                                                                            <li><a role="button" onclick="document.getElementById('loaiSP').value='4'" class="${searchModel.loaiSP == 4 ? 'active' : ''}" ><label for="btnSearch">Gear(${gearCount })</label></a></li>
                                                                        </ul>
                                                                    </li>
                                                                    <li>
                                                                        <a>Nhãn hiệu</a>
                                                                        <ul class="price-list">
                                                                        	<li><a role="button" onclick="document.getElementById('brandID').value='0'" class="${searchModel.brandID == 0 ? 'active' : ''}" ><label for="btnSearch">ALL</label></a></li>
                                                                        	<c:forEach items="${brands }" var="brand">
                                                                        		<li><a role="button" onclick="document.getElementById('brandID').value='${brand.id}'" class="${searchModel.brandID == brand.id ? 'active' : ''}" ><label for="btnSearch">${brand.tenHang }</label></a></li>
                                                                        	</c:forEach>
                                                                            
                                                                        </ul>
                                                                    </li>
                                                                    <li>
                                                                        <a>Giá</a>
                                                                        <ul class="price-list">
                                                                            <li>
                                                                            	<a role="button" onclick="document.getElementById('price').value=''">
                                                                            		<label for="btnSearch">ALL</label>
                                                                           		</a>
                                                                       		</li>
                                                                       		<li>
                                                                            	<a role="button" onclick="document.getElementById('price').value='0 and 1000000'">
                                                                            		<label for="btnSearch">0 - 1.000.000₫</label>
                                                                           		</a>
                                                                       		</li>
                                                                       		<li>
                                                                            	<a role="button" onclick="document.getElementById('price').value='between 1000000 and 2000000'">
                                                                            		<label for="btnSearch">1.000.000₫ - 2.000.000₫</label>
                                                                           		</a>
                                                                       		</li>
                                                                       		<li>
                                                                            	<a role="button" onclick="document.getElementById('price').value='between 2000000 and 3000000'">
                                                                            		<label for="btnSearch">2.000.000₫ - 3.000.000₫</label>
                                                                           		</a>
                                                                       		</li>
                                                                       		<li>
                                                                            	<a role="button" onclick="document.getElementById('price').value='between 3000000 and 5000000'">
                                                                            		<label for="btnSearch">3.000.000₫ - 5.000.000₫</label>
                                                                           		</a>
                                                                       		</li>
                                                                       		<li>
                                                                            	<a role="button" onclick="document.getElementById('price').value='between 5000000 and 10000000'">
                                                                            		<label for="btnSearch">5.000.000₫ - 10.000.000₫</label>
                                                                           		</a>
                                                                       		</li>
                                                                       		<li>
                                                                            	<a role="button" onclick="document.getElementById('price').value='between 10000000 and 15000000'">
                                                                            		<label for="btnSearch">10.000.000₫ - 15.000.000₫</label>
                                                                           		</a>
                                                                       		</li>
                                                                       		<li>
                                                                            	<a role="button" onclick="document.getElementById('price').value='> 15000000'">
                                                                            		<label for="btnSearch">15.000.000₫+</label>
                                                                           		</a>
                                                                       		</li>
                                                                        </ul>
                                                                    </li>
                                                                    
                                                                    
                                                                    
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- End of product filter menu -->
                                        </div>
                                        <!--End of product filter -->

                                        <!-- sort by newest -->
                                        <div class="newest-product">
                                            <a href="#" id="dropdownnewest" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-sort-amount-desc"></i><span>Sắp xếp theo <span class="sort-by">Mới nhất</span></span><i class="fa fa-angle-down"></i></a>
                                            <ul class="newest-product-option dropdown-menu-right dropdown-menu" aria-labelledby="dropdownnewest">
                                                <li><a href="#">Mới nhất</a></li>
                                                <li><a href="#">Giá: Từ thấp đến cao</a></li>
                                                <li><a href="#">Giá: Từ cao đến thấp</a></li>
                                            </ul>
                                        </div>
                                        <!-- End of sort by newest -->

                                        
                                    </div>
                                    <!-- product filter inner -->
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End of shop toolbar wrap -->
                    <div class="row">
                        <div class="col-12">
                            <div class="tab-content shop-tab-content">
                                <div class="tab-pane fade show active" role="tabpanel" id="fourcol" aria-labelledby="nav-four-col">
                                    <div class="row">
                                    	<c:forEach items="${products.data }" var="sanpham">
                                    	
                                        <div class="col-md-4 col-sm-12 col-lg-3">
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
                                                            <div class="product-price">
                                                            	<h5>${sanpham.giaBanFormatted }</h5>
                                                            </div>
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
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- phân trang -->
					<div class="row" style="width: 100%;">
						<div class="col-12 d-flex justify-content-center">
							<div id="paging"></div>
						</div>
					</div>
                </div>
            </div>
        
    </section>
    <!-- End of product shop wrapper -->
    
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
            	<%-- Kiểm tra xem có thông báo lỗi hay không --%>
				<%--<c:if test="${not empty errorMessage}">
				    <div class="alert alert-danger" role="alert">
				        ${errorMessage}
				    </div>
				</c:if> --%>
				
				<%-- Kiểm tra xem có thông báo thành công hay không --%>
				<%-- <c:if test="${not empty successMessage}">
				    <div class="alert alert-success" role="alert">
				        ${successMessage}
				    </div>
				</c:if> --%> 
                <<div class="add-noti-image">
                    <img src="${base}/img/product/add-note.jpg" alt="">
                </div> 
                <div class="add-noti-text media-body" id="messageDiv">
                    
                </div>
            </div>
        </div>
        <!-- add add to cart notifacition -->
    
        
    
        <!-- JS Files -->
       	<jsp:include page="/WEB-INF/views/customer/layout/js.jsp"></jsp:include>
       	<script type="text/javascript">
       	$( document ).ready(function() {
			
			$("#paging").pagination({
				currentPage: ${products.currentPage}, //trang hiện tại
		        items: ${products.totalItems},	//tổng số sản phẩm
		        itemsOnPage: ${products.sizeOfPage}, //số sản phẩm trên 1 trang
		        cssStyle: 'light-theme',
		        onPageClick: function(pageNumber, event) {
		        	$('#page').val(pageNumber);
		        	$('#btnSearch').trigger('click');
				},
		    });
		});
       	</script>
    
    </body>
    </html>