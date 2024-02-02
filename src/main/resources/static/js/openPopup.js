$(document).ready(function() {
	$('#openPopup').on('click', function(event) {
		event.preventDefault(); // 防止跳轉
		// 顯示彈出框
		$('#overlay, #popup').show();
		showMap();
	});

	$('#overlay').on('click', function() {
		$('#overlay, #popup').hide();
	});
});
function sendEmail(userId) {

	Swal.fire({
		title: '確定要禁用編號為' + userId + '的帳號嗎？',
		icon: 'question',
		showCancelButton: true,
		confirmButtonText: '確定',
		cancelButtonText: '取消'
	}).then((result) => {
		// 如果使用者確定，則執行相應的操作
		if (result.isConfirmed) {
			// 通知用戶
			Swal.fire({
				title: '操作通知',
				text: '已發送Email通知',
				icon: 'success',
				 showConfirmButton: false,
				timer: 4000 
			})
				window.location.href = `/pillowSurfing/admin/sendEmail/${userId}`;
			
		}
	});
}

