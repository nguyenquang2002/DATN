<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- Preloader -->
<%--   <div class="preLoader">
        <div class="preloder-inner">
            <div class="sk-cube-grid">
                <div class="sk-cube sk-cube1"></div>
                <div class="sk-cube sk-cube2"></div>
                <div class="sk-cube sk-cube3"></div>
                <div class="sk-cube sk-cube4"></div>
                <div class="sk-cube sk-cube5"></div>
                <div class="sk-cube sk-cube6"></div>
                <div class="sk-cube sk-cube7"></div>
                <div class="sk-cube sk-cube8"></div>
                <div class="sk-cube sk-cube9"></div>
            </div>
        </div>
    </div> --%>
    <!-- End Of Preloader -->

    <!-- Catagory menu -->
    <div class="slidenav catagory-menu">
        <div class="menu-navigation">
            <div class="container-fluid">
                <div class="row">
                    <div class="col">
                        <div class="catagory-menu-header d-flex  align-items-center">
                            <div class="logo">
                                <a href="${base }/"><img class='default-logo' src="${base }/img/logo.png" style="height: 60px;" data-rjs="2" alt="ecommerce"></a>
                            </div>
                            <div class="menu-cancel">
                                <img src="${base }/img/icons/close-button.svg" class="svg" alt="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-md-8 offset-md-2">
                        <div class="search-bar primary-form parsley-validate">
                            <form action="${base }/list" method="get" >
                                <input type="text" name="keyword" class="theme-input-style" placeholder="Bạn đang tìm gì" value="${searchModel.keyword }" required>
                                <button style="margin-top: -20px;" type="submit" class="search-icon" name="btnSearch" value="Search"><img src="${base }/img/icons/search-button.svg"" class="svg" alt=""></button>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-lg-10 col-md-12 offset-lg-1">
                        <div class="catagory-menu-wrap">
                            <nav>
                                <ul class="list-unstyled">
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
                                    	<a href="${base }/list?loaiSP=3">Phần cywnsg</a>
                                        <ul>
                                            <c:forEach items="${brandPhanCung }" var="brand">
                                             <li><a href="${base }/list?loaiSP=3&brandID=${brand.id}">${brand.tenHang }</a></li>
                                        	</c:forEach>
                                        </ul>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End of Catagory menu -->