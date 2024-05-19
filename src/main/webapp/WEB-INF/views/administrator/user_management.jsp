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
        <title>Quản lý người dùng</title>
        
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
                    
					<h1 class="mt-4">Thêm/Sửa tài khoản</h1>
                    <!-- Thêm mã HTML để hiển thị thông báo lỗi -->
						<c:if test="${not empty errorMessage}">
						    <div class="alert alert-danger" role="alert" style="text-align: center; color: red;">
						        ${errorMessage}
						    </div>
						</c:if>
							
						<sf:form method="post" action="${base}/admin/user/management" modelAttribute="user">
							
							<div class="row">
								<div class="form-group mb-2" >
									<label for="id">Id</label>
									<sf:input path="id" id="userId" class="form-control" readonly="true"></sf:input>
								</div>
							</div>
							
							<div class="row">
								<div class="form-group mb-2 col-6">
									<label for="username">Tên đăng nhập</label>
									<sf:input path="username" id="username" autocomplete="off" class="form-control"></sf:input>
								</div>
								<div class="form-group mb-2 col-6">
									<label for="password">Mật khẩu</label>
									<sf:input type="password" path="password" id="password" autocomplete="off" class="form-control"></sf:input>
								</div>
							</div>
							<div class="row">
								<div class="form-group mb-2 col-6">
									<label for="hoTen">Họ tên</label>
									<sf:input path="hoTen" id="hoTen" autocomplete="off" class="form-control"></sf:input>
								</div>
								<div class="form-group mb-2 col-6">
									<label for="sdt">Số điện thoại</label>
									<sf:input path="sdt" id="sdt" autocomplete="off" class="form-control"></sf:input>
								</div>
							</div>
							
							<div class="row">
								<div class="form-group mb-2 col-6">
									<label for="hoTen">Địa chỉ</label>
									<sf:input path="diaChi" id="diaChi" autocomplete="off" class="form-control"></sf:input>
								</div>
								<div class="form-group mb-2 col-6">
									<label for="sdt">Email</label>
									<sf:input type="email" path="email" id="email" autocomplete="off" class="form-control"></sf:input>
								</div>
							</div>
							
							
							<a href="${base }/admin/user" class="btn btn-secondary active" role="button" aria-pressed="true">Quay lại danh sách</a>
							<button type="submit" class="btn btn-primary">Lưu tài khoản</button>
							<c:if test="${user.trangThai<=0 }">
								<a role="button" class="btn btn-danger" onclick="UnBanUser(${user.id})">Mở khóa tài khoản</a>
							</c:if>
						</sf:form>

					                   
                    
                </div>
            </div>
        </div>
        
		<!-- JS -->
		<jsp:include page="/WEB-INF/views/administrator/layout/js.jsp"></jsp:include>
		
		<script type="text/javascript">
		function UnBanUser(userId) {
			// tạo javascript object.  
			var data = {
				id: userId,
			};
			
			// $ === jQuery
			// json == javascript object
			jQuery.ajax({
				url:  '${base}' + "/admin/user/unban",
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
		
    </body>
</html>
