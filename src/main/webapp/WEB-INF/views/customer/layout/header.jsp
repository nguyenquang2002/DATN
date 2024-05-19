<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

	<!-- offcanvas menu-->

    <!-- offcanvas overlay -->
    <div class="offcanvas-overlay"></div>
    <!-- offcanvas overlay -->

   <!-- offcanvas mainmenu -->
    <div class="offcanvas offcanvas-mainmenu">
            <div class="offcanvas-cancel">
                <img src="${base }/img/icons/close-button.svg" class="svg" alt="">
            </div>
    </div> 
    <!-- offcanvas mainmenu -->

    <!-- wish list -->
   <%-- <div class="offcanvas offcanvas-wishlist" id="wishlist">
        <div class="offcanvas-head">
            <div class="head-text">
                <img src="${base }/img/icons/wishlist2.svg" class="svg" alt="">
                <h3>Wishlist</h3>
            </div>
            <div class="offcanvas-cancel">
                <img src="${base }/img/icons/close-button.svg" class="svg" alt="">
            </div>
        </div>
        
        <div class="offcanvas-inner">
            <div class="added-wish-list">
                <!-- single wish list -->
                <div class="single-added-list">
                    <!-- single wish list left -->
                    <div class="single-item-left media align-items-center">
                        <img src="${base }/img/clients/wishlist1.png" alt="">
                        <div class="single-item-details midea-body">
                            <h5><a href="#">Women's Strap Sandal</a></h5>
                            <p>$125</p>
                        </div>
                    </div>
                    <!-- End of single wish list left -->

                    <!-- Single wish list right -->
                    <div class="single-item-right text-right">
                        <a href="#"><img src="${base }/img/icons/remove.svg" alt="" class="svg"></a>
                        <a href="#" class="btn addto-cart-btn">Add To Cart</a>
                    </div>
                    <!-- End of Single wish list right -->
                </div>
                <!-- End of single wish list -->

                 <!-- single wish list -->
                <div class="single-added-list sold-item">
                    <!-- single wish list left -->
                    <div class="single-item-left media align-items-center">
                        <img src="${base }/img/clients/wishlist2.png" alt="">
                        <div class="single-item-details midea-body">
                            <h5><a href="#">Wilson Dynasty 29” Basketball</a></h5>
                            <p>$25</p>
                        </div>
                    </div>
                    <!-- End of single wish list left -->

                    <!-- Single wish list right -->
                    <div class="single-item-right text-right">
                        <a href="#"><img src="${base }/img/icons/remove.svg" alt="" class="svg"></a>
                        <a href="#" class="btn out-stock-btn">Out Of Stock</a>
                    </div>
                    <!-- End of Single wish list right -->
                </div>
                <!-- End of single wish list -->

                 <!-- single wish list -->
                <div class="single-added-list">
                    <!-- single wish list left -->
                    <div class="single-item-left media align-items-center">
                        <img src="${base }/img/clients/wishlist3.png" alt="">
                        <div class="single-item-details midea-body">
                            <h5><a href="#">HyperX Gaming Headset</a></h5>
                            <p>$15</p>
                        </div>
                    </div>
                    <!-- End of single wish list left -->

                    <!-- Single wish list right -->
                    <div class="single-item-right text-right">
                        <a href="#"><img src="${base }/img/icons/remove.svg" alt="" class="svg"></a>
                        <a href="#" class="btn addto-cart-btn">Add To Cart</a>
                    </div>
                    <!-- End of Single wish list right -->
                </div>
                <!-- End of single wish list -->

                <!-- add to button an support -->
                <div class="view-cart-check-btn text-center">
                    <a href="#" class='btn btn-fill-type'>View Cart List</a>
                    <a href="#" class='btn btn-fill-type'>Check Out</a>
                    <p>Free Shipping on All Orders Over $100!</p>
                </div>
                <div class="cart-support">
                    <p class="roboto">Support</p>
                    <ul class="list-unstyled">
                        <li>
                            <span><i class="fa fa-phone"></i></span>
                            Phone: +00 654 321 9874
                        </li>
                        <li>
                            <span><i class="fa fa-map-marker"></i></span>
                            1622 Colins Street West, Strawberry (Le), ITALY
                        </li>
                    </ul>
                </div>
                <!-- add to button an support -->
            </div>
        </div>
    </div> --%>
    <!-- End of wish list -->
    
    <!-- cart list -->
    <div class="offcanvas offcanvas-cart-list">
        <div class="offcanvas-head">
            <div class="head-text">
                <img src="${base }/img/icons/add-bag2.svg" class="svg" alt="">
                <h3>Giỏ hàng</h3>
            </div>
            <div class="offcanvas-cancel">
                <img src="${base }/img/icons/close-button.svg" class="svg" alt="">
            </div>
        </div>
        
        <div class="offcanvas-inner">
            <div class="added-cart-list">
            	<c:forEach var="cartItem" items="${cart.cartItems }">
            		<!-- single cart list --> 
	                <div class="single-added-list">
	                    <!-- single cart list left -->
	                    <div class="single-item-left media align-items-center">
	                        <img src="${base}/upload/${cartItem.avatar}" style="width: 80px; height: 80px;" alt="">
	                        <div class="single-item-details midea-body">
	                            <h5>
	                            	<c:choose>
										<c:when test="${cartItem.lsp == 1}">
											<a href="${base }/computer/${cartItem.productId}">${cartItem.productName }
										</c:when>
										<c:when test="${cartItem.lsp == 2 || cartItem.lsp == 5}">
											<a href="${base }/laptop/${cartItem.productId}">${cartItem.productName }
										</c:when>
										<c:when test="${cartItem.lsp == 3}">
											<a href="${base }/hardware/${cartItem.productId}">${cartItem.productName }
										</c:when>
										<c:when test="${cartItem.lsp == 4}">
											<a href="${base }/gear/${cartItem.productId}">${cartItem.productName }
										</c:when>
									</c:choose>
	                            	</a>
	                            </h5>
	                            <p>${cartItem.priceUnit }₫ x ${cartItem.quanlity }</p>
	                        </div>
	                    </div>
	                    <!-- End of single cart list left -->
	
	                    <!-- Single wish list right -->
	                    <div class="single-item-right text-right">
	                        <img src="${base }/img/icons/remove.svg" alt="" class="svg" onclick="DeleteProduct(${cartItem.productId})">
	                        <h6>${cartItem.priceUnit * cartItem.quanlity}₫</h6>
	                    </div>
	                    <!-- End of Single cart list right -->
	                </div>
	                <!-- End of single cart list -->
            	</c:forEach>
                

                 
            <!-- total price -->
            <div class="total-price">
                <h5>Tổng tiền</h5>
                <h3>${cart.totalPrice }₫</h3>
            </div>
            <!-- End of total price -->
            
            <!-- add to button an support -->
            <div class="view-cart-check-btn text-center">
                <a href="${base }/cart" class='btn btn-fill-type'>Đến giỏ hàng</a>
                <a href="${base }/checkout" class='btn btn-fill-type'>Thanh toán</a>
                <p>Miễn phí vận chuyển!!!</p>
            </div>
            <div class="cart-support">
                <p class="roboto">Hỗ trợ</p>
                <ul class="list-unstyled">
                    <li>
                        <span><i class="fa fa-phone"></i></span>
                        SĐT: 0374 xxx xxx
                    </li>
                    <li>
                        <span><i class="fa fa-map-marker"></i></span>
                        Trường Đại học Công nghiệp Hà Nội
                    </li>
                </ul>
            </div>
            <!-- add to button an support -->
        </div>
    </div>
    </div>
    <!-- End of cart list -->

   <!-- log in and register -->
   <%-- <div class="offcanvas offcanvas-account">
            <div class="offcanvas-head">
                <div class="head-text">
                    <img src="${base }/img/icons/account2.svg" class="svg" alt="">
                    <h3>Account</h3>
                </div>
                <div class="offcanvas-cancel">
                    <img src="${base }/img/icons/close-button.svg" class="svg" alt="">
                </div>
            </div>
            
            <div class="offcanvas-inner">
                <!-- login register -->
                <div class="login-register-wrap">
                    <!-- login register nav -->
                    <div class="login-register-nav">
                        <nav class="nav lr-nav text-center">
                            <a id="nav-login-tab" data-toggle="tab" href="#login" class="active">Log In</a>
                            <a id="nav-register-tab" data-toggle="tab" href="#reg">Register</a>
                        </nav>
                    </div>
                    <!-- End of login register nav -->
    
                    <!-- login register content -->
                    <div class="login-register-content tab-content">
                        <div class="tab-pane fade show active" id="login" role="tabpanel" aria-labelledby="nav-login-tab">
                            <div class="primary-form parsley-validate">
                                <form action="#">
                                    <!-- loging input -->
                                    <div class="name-input input-field">
                                        <label>
                                            <img src="${base }/img/icons/account3.svg" class="svg" alt="">
                                        </label>
                                        <input type="text" placeholder='User name / Email Address' class="theme-input-style" required>
                                    </div>
    
                                    <div class="password-input input-field">
                                        <label>
                                            <img src="${base }/img/icons/regi-icon.svg" class="svg" alt="">
                                        </label>
                                        <input type="password" placeholder='password' class="theme-input-style" required>
                                    </div>
                                    <!-- loging input -->
                                    <button type="submit" class="btn btn-fill-type">log In</button>
                                </form>
                                <p>Don’t have an account,<a href="#"> register now!</a></p>
                            </div>
                        </div>
    
                        <div class="tab-pane fade" id="reg" role="tabpanel" aria-labelledby="nav-login-tab">
                            <div class="primary-form parsley-validate">
                                <form action="#">
                                    <!-- register input -->
                                    <div class="name-input input-field">
                                        <label>
                                            <img src="${base }/img/icons/account-icon.svg" class="svg" alt="">
                                        </label>
                                        <input type="text" placeholder='User name / Email Address' class="theme-input-style" required>
                                    </div>
                                    
                                    <div class="email-input input-field">
                                        <label>
                                            <img src="${base }/img/icons/email-icon.svg" class="svg" alt="">
                                        </label>
                                        <input type="email" placeholder='email' class="theme-input-style" required>
                                    </div>
    
                                    <div class="password-input input-field">
                                        <label>
                                            <img src="${base }/img/icons/regi-icon.svg" class="svg" alt="">
                                        </label>
                                        <input type="password" placeholder='password' class="theme-input-style" required>
                                    </div>
                                    <!-- register input -->
                                    <button type="submit" class="btn btn-fill-type">Register</button>
                                </form>
                                <p>Have an account,<a href="#">Log In now!</a></p>
                            </div>
                        </div>
                    </div>
                    <!-- End of login register content -->
                </div>
                <!-- End of login register -->
                
                <!-- add to button an support -->
                <div class="cart-support">
                    <p class="roboto">Support</p>
                    <ul class="list-unstyled">
                        <li>
                            <span><i class="fa fa-phone"></i></span>
                            Phone: +00 654 321 9874
                        </li>
                        <li>
                            <span><i class="fa fa-map-marker"></i></span>
                            1622 Colins Street West, Strawberry (Le), ITALY
                        </li>
                    </ul>
                </div>
                <!-- add to button an support -->
            </div>
        </div> --%>
        <!-- End of log in and ragister -->

    <!-- End of offcanvas menu-->

    <!-- main header -->
    <header class="header">
        <div class="main-header-wraper relative-header main-header">
            <div class="container-fluid">
                <div class="row align-items-center">
                    <div class="col-6 col-sm-6 col-md-3 col-lg-2 col-xl-3">
                        <div class="logo-container">
                            <!-- Logo -->
                            <div class="logo">
                                <a href="${base }/">
                                    <img class='default-logo' src="${base }/img/logo.png" style="height: 60px;" data-rjs="2" alt="ecommerce">
                                    <img class='sticky-logo' src="${base }/img/logo.png" style="height: 60px;" data-rjs="2" alt="ecommerce">
                                </a>
                            </div>
                            <!-- End of Logo -->
                        </div>
                    </div>
                    <div class="col-6 col-sm-6 col-md-6 col-lg-7 col-xl-6">
                        <!-- menu container -->
                        <div class="menu-container">
                            <div class="menu-wraper">
                                <nav>
                                    <!-- Header-menu -->
                                    <div class="header-menu dosis">
                                        <div id="menu-button"><i class="fa fa-bars"></i></div>
                                        <ul>
                                            <li class="active">
                                                <a href="${base }/">Trang chủ</a>
                                            </li>
                                            <li>
                                                <a href="${base }/list?loaiSP=1">Desktop</a>
                                                <ul>
                                                	<c:forEach items="${brandPC }" var="brand">
	                                                    <li><a href="${base }/list?loaiSP=1&brandID=${brand.id}">${brand.tenHang }</a></li>
                                                	</c:forEach>
                                                </ul>
                                            </li>
                                            <li>
                                                <a href="${base }/list?loaiSP=2">Laptop</a>
                                                <ul>
                                                    <c:forEach items="${brandLaptop }" var="brand">
	                                                    <li><a href="${base }/list?loaiSP=2&brandID=${brand.id}">${brand.tenHang }</a></li>
                                                	</c:forEach>
                                                </ul>
                                            </li>
                                            <li>
                                            	<a href="${base }/list?loaiSP=5">Laptop Gaming</a>
                                                <ul>
                                                    <c:forEach items="${brandLaptopGaming }" var="brand">
	                                                    <li><a href="${base }/list?loaiSP=5&brandID=${brand.id}">${brand.tenHang }</a></li>
                                                	</c:forEach>
                                                </ul>
                                            </li>
                                            <li>
                                                <a href="${base }/list?loaiSP=4">Gear</a>
                                                <ul>
                                                    <li><a href="about.html">About</a></li>
                                                    <li><a href="cart-list.html">Cart List</a></li>
                                                    <li><a href="checkout.html">Check Out</a></li>
                                                    <li><a href="wish-list.html">Wish List</a></li>
                                                    <li><a href="faq.html">FAQ</a></li>
                                                    <li><a href="myaccount.html">My Account</a></li>
                                                    <li><a href="order-tracking.html">Order Tracking</a></li>
                                                    <li><a href="search-result.html">Search Results</a></li>
                                                    <li><a href="logout.html">Log Out</a></li>
                                                    <li><a href="#">Coming Soon</a>
                                                        <ul><li><a href="comming-soon.html">Coming Soon 01</a></li>
                                                            <li><a href="comming-soon2.html">Coming Soon 02</a></li>
                                                        </ul>
                                                    </li>
                                                    <li><a href="#">404 Page</a>
                                                        <ul>
                                                            <li><a href="error1.html">404 Page 1</a></li>
                                                            <li><a href="error2.html">404 Page 2</a></li>
                                                            <li><a href="error3.html">404 Page 3</a></li>
                                                        </ul>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li>
                                                <a href="${base }/list?loaiSP=3">Phần cứng</a>
                                                <ul>
                                                    <li><a href="blog-2clumn.html">Blog Layout</a></li>
                                                    
                                                    <li><a href="blog-2clumn-withbar.html">Blog Right Sidebar</a></li>
                                                    <li><a href="blog-pinterest.html">Blog Pinterest</a></li>
                                                    <li><a href="blog-pinterest-withbar.html">Blog Pinterest with Sidebar</a></li>
                                                    <li><a href="blog-list.html">Blog list</a></li><li><a href="blog-list-withbar.html">Blog list with Sidebar</a></li>
                                                    <li><a href="blog-details-withbar.html">Blog Details With Sidebar</a></li>
                                                    <li><a href="blog-details.html">Blog Details</a></li>
                                                </ul>
                                            </li>
                                            <li></li>
                                        </ul>
                                    </div>
                                    <!-- End of Header-menu -->
                                </nav>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-sm-12 col-md-3 top-order">
                        <!-- modal menu -->
                        <div class="modal-menu-container">
                            <ul class="list-unstyled mb-0">
                                <li>
                                    <div class="search-btn" title="search">
                                        <a href="#">
                                            <img src="${base }/img/icons/search-button.svg" alt="" class="svg">
                                        </a>
                                    </div>
                                </li>
                                <li>
                                    <div class="cart-btn" title="Cart list">
                                        <a href="login.html">
                                            <img src="${base }/img/icons/add-bag.svg" alt="" class="svg">
                                        </a>
                                    </div>
                                </li>
                                <li>
                                    <div class="wishlist-btn-off" title="Wish list">
                                        <a href="#">
                                            <img src="${base }/img/icons/wishlist.svg" alt="" class="svg">
                                        </a>
                                    </div>
                                </li>
                                <li>
                                    <%-- <div class="account-btn" title="account list"> --%>
                                    <div class="account-btn-menu">
                                    	<c:choose>
                                    		<c:when test="${isLogined }">
                                    			<a>
		                                            <img src="${base }/img/icons/account.svg" alt="" class="svg">
		                                        </a>
		                                        <div class="dropdown-content">
		                                        	<a>${userLogined.username }</a>
												    <a href="${base }/myaccount">Thông tin</a>
												    <a href="${base }/myaccount/order">Đơn hàng</a>
												    <a href="${base }/logout">Đăng xuất</a>
												  </div>
                                    		</c:when>
                                    		<c:otherwise>
                                    			<a href="${base }/login">
		                                            <img src="${base }/img/icons/account.svg" alt="" class="svg">
		                                        </a>
                                    		</c:otherwise>
                                    	</c:choose>
                                        
                                    </div>
                                    
                                </li>
                                <li>
                                    <div class="menu-btn" title="Category menu">
                                        <a href="#">
                                            <img src="${base }/img/icons/manu-button.svg" alt="" class="svg">
                                        </a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <!-- End of modal menu -->
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- End of main header -->
    
   	<script type="text/javascript">
	function DeleteProduct(productId) {
		// tạo javascript object.  
		var data = {
				productId: productId,
		};
		
		// $ === jQuery
		// json == javascript object
		jQuery.ajax({
			url:  '${base}' + "cart/deleteProduct",
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