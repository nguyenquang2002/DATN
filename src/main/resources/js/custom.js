/*==================================================================================
    Custom JS (Any custom js code you want to apply should be defined here).
====================================================================================*/

// Thêm sản phẩm vào trong giỏ hàng với productId và số lượng mua sản phẩm đó
function AddToCart(baseUrl, productId, quanlity) {
	// javascript object.  data la du lieu ma day len action cua controller
	let data = {
		productId: productId, // Id sản phẩm
		quanlity: quanlity, // Số lượng cho vào giỏ hàng
	};

	// $ === jQuery
	// json == javascript object
	jQuery.ajax({
		url: baseUrl + "/ajax/addToCart", //->action
		type: "post",
		contentType: "application/json",
		data: JSON.stringify(data),

		dataType: "json", // kieu du lieu tra ve tu controller la json
		success: function(jsonResult) {
			if (jsonResult.errorMessage) {
                // Nếu có lỗi, hiển thị thông báo lỗi
                $("#messageDiv").html("<div style='color: red;' role='alert'>" + jsonResult.errorMessage + "</div>");
            } else if (jsonResult.successMessage) {
                // Nếu thêm vào giỏ hàng thành công, hiển thị thông báo thành công
                $("#messageDiv").html("<div style='color: green;' role='alert'>" + jsonResult.successMessage + "</div>");
            }
            showAddCartNotification();
			//alert(jsonResult.totalItems)
			// tăng số lượng sản phẩm trong giỏ hàng trong icon			
			//$("#iconShowTotalItemsInCart").html(jsonResult.totalItems);

			/*$([document.documentElement, document.body]).animate({
				scrollTop: $("#iconShowTotalItemsInCart").offset().top
			}, 2000);*/
		},
		error: function(jqXhr, textStatus, errorMessage) {
			
		}
	});
}

function UpdateQuanlityCart(baseUrl, productId, quanlity) {
	
	// javascript object.  data la du lieu ma day len action cua controller
	let data = {
		productId: productId, // lay theo id	
		quanlity: quanlity
	};
	
	// $ === jQuery
	// json == javascript object
	jQuery.ajax({
		url: baseUrl + "/ajax/updateQuanlityCart", //->action
		type: "post",
		contentType: "application/json",
		data: JSON.stringify(data),

		dataType: "json", // kieu du lieu tra ve tu controller la json
		success: function(jsonResult) {
			if (jsonResult.errorMessage) {
                // Nếu có lỗi, hiển thị thông báo lỗi
                $("#messageDiv").html("<div style='color: red;' role='alert'>" + jsonResult.errorMessage + "</div>");
                showUpadteCartNotification();
            } else{
				// tăng số lượng sản phẩm trong giỏ hàng trong icon
				$( "#quanlity_" + productId ).html(jsonResult.currentProductQuality);
				$( ".totalPrice" ).html(jsonResult.totalPrice);
				$( "#totalPriceItem_" + productId).html(jsonResult.total + "₫");
			}
		},
		error: function(jqXhr, textStatus, errorMessage) {
			
		}
	});
}

function showUpadteCartNotification() {
    var modal = document.querySelector('.modal-update-notifacition');
    modal.style.visibility = 'visible';
    modal.style.opacity = 1; // Hiển thị modal

    // Tắt modal sau 2 giây
    setTimeout(function() {
        modal.style.visibility = 'hidden'; // Tắt modal
        modal.style.opacity = 0;
    }, 1500);
}

function showAddCartNotification() {
    var modal = document.querySelector('.modal-addproduct-notifacition');
    modal.style.visibility = 'visible';
    modal.style.opacity = 1; // Hiển thị modal

    // Tắt modal sau 2 giây
    setTimeout(function() {
        modal.style.visibility = 'hidden'; // Tắt modal
        modal.style.opacity = 0;
    }, 1500);
}

function formatPrice(total){
    return total.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,") + "₫";
}