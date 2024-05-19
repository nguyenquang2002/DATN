<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
                        <div class="page-title-heading"><h1 class="h2">Wishlist</h1></div>
                        <ul class="list-unstyled mb-0">
                            <li><a href="${base}/index">Trang chủ</a></li>
                            <li class="active"><a href="${base}/wishlist">Wishlist</a></li>
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
            <div class="row justify-content-center">
                <div class="col">
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
                                                Trạng thái
                                            </td>
                                            <td class="product-quantity">
                                                Giá tiền
                                            </td>
                                            
                                            <td>&nbsp;</td>
                                        </tr>
                                        <!-- End of first table row -->

                                        <!-- tr -->
                                        <tr class="woocommerce-cart-form__cart-item cart_item">
                                            <!-- product-thumbnail -->
                                            <td class="product-thumbnail">
                                                <div class="product-details">
                                                    <a href="#" class="porduct-image-wrap">
                                                        <img src="${base}/img/clients/cart3.png" alt="">
                                                    </a>
                                                </div>
                                            </td>
                                            <!-- product-thumbnail -->

                                            <!-- product-name -->
                                            <td class="cart-product-name">
                                                <div class="product-details">
                                                    
                                                    <a href="#">Women's Flexible Bottom Shoes aaaaaa aaaaaa aaaaaaaa aaaa aaaa </a>
                                                </div>
                                            </td>
                                            <!-- product-name -->

                                            

                                            <td class="instock">In Stock</td>

                                            <td>$125</td>
                                            

                                            <!-- product remove -->
                                            <td class="product-remove">
                                                <div class="remover-field">
                                                    <img src="${base}/img/icons/remove.svg" class='svg' alt="">
                                                </div>
                                            </td>
                                            <!--End of  product remove -->
                                        </tr>
                                        <!--End of tr -->

                                        <!-- tr -->
                                        <tr class="woocommerce-cart-form__cart-item cart_item">

                                            <!-- product-thumbnail -->
                                            <td class="product-thumbnail">
                                                <div class="product-details">
                                                    <a href="#" class="porduct-image-wrap">
                                                        <img src="${base}/img/clients/cart3.png" alt="">
                                                    </a>
                                                </div>
                                            </td>
                                            <!-- product-thumbnail -->

                                            <!-- product-name -->
                                            <td class="cart-product-name">
                                                <div class="product-details">
                                                    
                                                    <a href="#">Women's Flexible Bottom Shoes aaaaaa aaaaaa aaaaaaaa aaaa aaaa aaaaaaaaaaa</a>
                                                </div>
                                            </td>
                                            <!-- product-name -->

                                           

                                            <td class="instock">In Stock</td>

                                            <td>$155</td>
                                            

                                            <!-- product remove -->
                                            <td class="product-remove">
                                                <div class="remover-field">
                                                    <img src="${base}/img/icons/remove.svg" class='svg' alt="">
                                                </div>
                                            </td>
                                            <!-- product remove -->
                                        </tr>
                                        <!-- End of tr -->

                                        <!-- tr -->
                                        <tr class="woocommerce-cart-form__cart-item cart_item">
                                            <!-- product-thumbnail -->
                                            <td class="product-thumbnail">
                                                <div class="product-details">
                                                    <a href="#" class="porduct-image-wrap">
                                                        <img src="${base}/img/clients/cart3.png" alt="">
                                                    </a>
                                                </div>
                                            </td>
                                            <!-- product-thumbnail -->

                                            <!-- product-name -->
                                            <td class="cart-product-name">
                                                <div class="product-details">
                                                    
                                                    <a href="#">Women's Flexible Bottom Shoes aaaaaa aaaaaa aaaaaaaa aaaa aaaa </a>
                                                </div>
                                            </td>
                                            <!-- product-name -->

                                            <td class="instock">In Stock</td>
                                            <td>$15</td>
                                            

                                            <!-- product-remove -->
                                            <td class="product-remove">
                                                <div class="remover-field">
                                                    <img src="${base}/img/icons/remove.svg" class='svg' alt="">
                                                </div>
                                            </td>
                                            <!-- product-remove -->
                                        </tr>
                                        <!--End of tr -->

                                        <!-- tr -->
                                        <tr class="woocommerce-cart-form__cart-item cart_item">
                                            <!-- product-thumbnail -->
                                            <td class="product-thumbnail">
                                                <div class="product-details">
                                                    <a href="#" class="porduct-image-wrap">
                                                        <img src="${base}/img/clients/cart3.png" alt="">
                                                    </a>
                                                </div>
                                            </td>
                                            <!-- product-thumbnail -->

                                            <!-- product-name -->
                                            <td class="cart-product-name">
                                                <div class="product-details">
                                                    
                                                    <a href="#">Women's Flexible Bottom Shoes aaaaaa aaaaaa aaaaaaaa aaaa aaaa </a>
                                                </div>
                                            </td>
                                            <!-- product-name -->
                                            
                                            <td class="instock">In Stock</td>
                                            <td>$45</td>
                                            
                                            <td class="product-remove">
                                                <div class="remover-field">
                                                    <img src="${base}/img/icons/remove.svg" class='svg' alt="">
                                                </div>
                                            </td>
                                        </tr>
                                        <!-- end of tr -->
                                    </tbody>
                                </table>
                                <!--End of cart table -->

                                
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
    
        <!-- JS Files -->
       	<jsp:include page="/WEB-INF/views/customer/layout/js.jsp"></jsp:include>
    
    </body>
    </html>