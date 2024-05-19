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
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Brand</title>
        
        <!-- Favicon-->
        <!-- <link rel="icon" type="image/x-icon" href="assets/favicon.ico" /> -->
		
		<!-- COMMON -->
		<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
		
        <!-- Core theme CSS (includes Bootstrap)-->
        <jsp:include page="/WEB-INF/views/administrator/layout/css.jsp"></jsp:include>
        
        <jsp:include page="/WEB-INF/views/administrator/layout/js.jsp"></jsp:include>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        
    </head>
    <body>
    	<jsp:include page="/WEB-INF/views/administrator/layout/header.jsp"></jsp:include>
    	
        <div class="d-flex" id="wrapper">
		<jsp:include page="/WEB-INF/views/administrator/layout/nav.jsp"></jsp:include>
            
            <!-- Page content wrapper-->
            <div id="page-content-wrapper">
                
                
                <!-- Page content-->
                <div class="container-fluid">
                    
					<h1 class="mt-4">Thêm nhãn hàng</h1>
                    <!-- Thêm mã HTML để hiển thị thông báo lỗi -->
						
							
						<sf:form method="post" action="${base}/admin/brand/add" modelAttribute="brand">
							
							<div class="row">
								<div class="form-group mb-2" >
									<label for="id">Id</label>
									<sf:input path="id" id="userId" class="form-control" readonly="true"></sf:input>
								</div>
							</div>
							
							<div class="row">
								<div class="form-group mb-2 col-6">
									<label for="tenHang">Tên hãng</label>
									<sf:input path="tenHang" id="tenHang" autocomplete="off" class="form-control"></sf:input>
								</div>
								<div class="form-group mb-2 col-6">
									<label for="ghiChu">Ghi chú</label>
									<sf:input path="ghiChu" id="ghiChu" autocomplete="off" class="form-control"></sf:input>
								</div>
							</div>
							
							
							
							<a href="${base }/admin/brand" class="btn btn-secondary active" role="button" aria-pressed="true">Quay lại nhãn hàng</a>
							<button type="submit" class="btn btn-primary">Lưu nhãn hàng</button>
							
						</sf:form>

					                   
                    
                </div>
            </div>
        </div>
        
		<!-- JS -->
		<jsp:include page="/WEB-INF/views/administrator/layout/js.jsp"></jsp:include>
		
		
		
    </body>
</html>
