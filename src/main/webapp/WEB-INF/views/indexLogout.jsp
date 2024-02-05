<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>

<html lang="en-us">

<head>
<meta charset="utf-8">
<title>PillowSurfing</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=5">
<meta name="description" content="This is a book website">
<meta name="author" content="Krist">
<link rel="shortcut icon" href="images/favicon.png" type="image/x-icon">
<link rel="icon" href="images/favicon.png" type="image/x-icon">
<link rel="icon" href="images/logo.ico" type="image/x-icon">

<!-- theme meta -->
<meta name="theme-name" content="pillowSurfing" />

<!-- # Main Style Sheet -->
<link rel="stylesheet" href="css/style.css">
</head>

<body>

	<!-- navigation -->
	<header class="navigation bg-tertiary">
		<nav class="navbar navbar-expand-xl navbar-light text-center py-3">
			<div class="container">
				<a class="navbar-brand" href="<c:url value="/login"></c:url>"> <img
					class="img-fluid" width="120" src="images/logo.png"
					alt="CouchSurfing" />
				</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav mx-auto mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link" href="index.html">首頁</a>
						</li>
						<li class="nav-item "><a class="nav-link" href="about.html">關於</a>
						</li>
						<li class="nav-item "><a class="nav-link"
							href="services.html">服務</a></li>
						<li class="nav-item "><a class="nav-link" href="contact.html">聯絡我們</a>
						</li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">頁面</a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item " href="blog.html">Blog</a></li>
								<li><a class="dropdown-item " href="blog-details.html">Blog
										Details</a></li>
								<li><a class="dropdown-item " href="service-details.html">Service
										Details</a></li>
								<li><a class="dropdown-item " href="faq.html">FAQ&#39;s</a>
								</li>
								<li><a class="dropdown-item " href="legal.html">Legal</a></li>
								<li><a class="dropdown-item " href="terms.html">Terms
										&amp; Condition</a></li>
								<li><a class="dropdown-item " href="privacy-policy.html">Privacy
										&amp; Policy</a></li>
							</ul></li>
					</ul>
					<a  href="<c:url value="/hostOrders"></c:url>" class="btn btn-outline-primary me-5" >切 換 房 東 模 式</a>
					<!-- account btn -->
					<%-- <a href="<c:url value="login"></c:url>" class="btn btn-outline-primary">登 入</a> --%>
					<!-- account btn -->
					<a href="<c:url value="/logout"></c:url>" class="btn btn-primary ms-2 ms-lg-3">登 出</a>
				</div>
			</div>
		</nav>
	</header>
	<!-- /navigation -->

	<div class="modal applyLoanModal fade" id="applyLoan" tabindex="-1"
		aria-labelledby="applyLoanLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header border-bottom-0">
					<h4 class="modal-title" id="exampleModalLabel">個 人 資 料</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="#!" method="post">
						<div class="row">
							<div class="col-lg-6 mb-4 pb-2">
								<div class="form-group">
									<label for="loan_amount" class="form-label">姓 名</label> <input
										type="text" class="form-control shadow-none" id="loan_amount"
										placeholder="ex: 克里斯">
								</div>
							</div>
							<div class="col-lg-6 mb-4 pb-2">
								<div class="form-group">
									<label for="loan_how_long_for" class="form-label">年 齡</label> <input
										type="number" class="form-control shadow-none"
										id="loan_how_long_for" placeholder="ex: 12">
								</div>
							</div>
							<div class="col-lg-12 mb-4 pb-2">
								<div class="form-group">
									<label for="loan_repayment" class="form-label">付 款 方 式</label>
									<input type="number" class="form-control shadow-none"
										id="loan_repayment" disabled>
								</div>
							</div>
							<div class="col-lg-6 mb-4 pb-2">
								<div class="form-group">
									<label for="loan_full_name" class="form-label">備 註</label> <input
										type="text" class="form-control shadow-none"
										id="loan_full_name">
								</div>
							</div>
							<div class="col-lg-6 mb-4 pb-2">
								<div class="form-group">
									<label for="loan_email_address" class="form-label">信 箱
										地 址</label> <input type="email" class="form-control shadow-none"
										id="loan_email_address">
								</div>
							</div>
							<div class="col-lg-12">
								<button type="submit" class="btn btn-primary w-100">提 交
									資 料</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>


	<section class="banner bg-tertiary position-relative overflow-hidden">
		<div class="container">
			<div class="row align-items-center justify-content-center">
				<div class="col-lg-6 mb-5 mb-lg-0">
					<div class="block text-center text-lg-start pe-0 pe-xl-5">
						<h1 class="text-capitalize mb-4">人生</h1>
						<br>
						<h1>從我們離開舒適圈開始</h1>
						<br>
						<h3>沙發衝浪 帶你體驗人生</h3>
						<p class="mb-4">你品嚐了夜的巴黎 你踏過下雪的北京 你熟記書本裡 每一句你最愛的真理</p>
						<a  class="btn btn-primary" href="<c:url value="/roomTableGallery"></c:url>"
							>房 間 列 表 <span
							style="font-size: 14px;" class="ms-2 fas fa-arrow-right"></span></a>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="ps-lg-5 text-center">
						<img loading="lazy" decoding="async" src="images/index_start.png"
							alt="banner image" class="w-100">
					</div>
				</div>
			</div>
		</div>
		<div class="has-shapes">
			<svg class="shape shape-left text-light" viewBox="0 0 192 752"
				fill="none" xmlns="http://www.w3.org/2000/svg">
      <path
					d="M-30.883 0C-41.3436 36.4248 -22.7145 75.8085 4.29154 102.398C31.2976 128.987 65.8677 146.199 97.6457 166.87C129.424 187.542 160.139 213.902 172.162 249.847C193.542 313.799 149.886 378.897 129.069 443.036C97.5623 540.079 122.109 653.229 191 728.495"
					stroke="currentColor" stroke-miterlimit="10" />
      <path
					d="M-55.5959 7.52271C-66.0565 43.9475 -47.4274 83.3312 -20.4214 109.92C6.58466 136.51 41.1549 153.722 72.9328 174.393C104.711 195.064 135.426 221.425 147.449 257.37C168.829 321.322 125.174 386.42 104.356 450.559C72.8494 547.601 97.3965 660.752 166.287 736.018"
					stroke="currentColor" stroke-miterlimit="10" />
      <path
					d="M-80.3302 15.0449C-90.7909 51.4697 -72.1617 90.8535 -45.1557 117.443C-18.1497 144.032 16.4205 161.244 48.1984 181.915C79.9763 202.587 110.691 228.947 122.715 264.892C144.095 328.844 100.439 393.942 79.622 458.081C48.115 555.123 72.6622 668.274 141.552 743.54"
					stroke="currentColor" stroke-miterlimit="10" />
      <path
					d="M-105.045 22.5676C-115.506 58.9924 -96.8766 98.3762 -69.8706 124.965C-42.8646 151.555 -8.29436 168.767 23.4835 189.438C55.2615 210.109 85.9766 236.469 98.0001 272.415C119.38 336.367 75.7243 401.464 54.9072 465.604C23.4002 562.646 47.9473 675.796 116.838 751.063"
					stroke="currentColor" stroke-miterlimit="10" />
    </svg>
			<svg class="shape shape-right text-light" viewBox="0 0 731 746"
				fill="none" xmlns="http://www.w3.org/2000/svg">
      <path
					d="M12.1794 745.14C1.80036 707.275 -5.75764 666.015 8.73984 629.537C27.748 581.745 80.4729 554.968 131.538 548.843C182.604 542.703 234.032 552.841 285.323 556.748C336.615 560.64 391.543 557.276 433.828 527.964C492.452 487.323 511.701 408.123 564.607 360.255C608.718 320.353 675.307 307.183 731.29 327.323"
					stroke="currentColor" stroke-miterlimit="10" />
      <path
					d="M51.0253 745.14C41.2045 709.326 34.0538 670.284 47.7668 635.783C65.7491 590.571 115.623 565.242 163.928 559.449C212.248 553.641 260.884 563.235 309.4 566.931C357.916 570.627 409.887 567.429 449.879 539.701C505.35 501.247 523.543 426.331 573.598 381.059C615.326 343.314 678.324 330.853 731.275 349.906"
					stroke="currentColor" stroke-miterlimit="10" />
      <path
					d="M89.8715 745.14C80.6239 711.363 73.8654 674.568 86.8091 642.028C103.766 599.396 150.788 575.515 196.347 570.054C241.906 564.578 287.767 573.629 333.523 577.099C379.278 580.584 428.277 577.567 465.976 551.423C518.279 515.172 535.431 444.525 582.62 401.832C621.964 366.229 681.356 354.493 731.291 372.46"
					stroke="currentColor" stroke-miterlimit="10" />
      <path
					d="M128.718 745.14C120.029 713.414 113.678 678.838 125.837 648.274C141.768 608.221 185.939 585.788 228.737 580.659C271.536 575.515 314.621 584.008 357.6 587.282C400.58 590.556 446.607 587.719 482.028 563.16C531.163 529.111 547.275 462.733 591.612 422.635C628.572 389.19 684.375 378.162 731.276 395.043"
					stroke="currentColor" stroke-miterlimit="10" />
      <path
					d="M167.564 745.14C159.432 715.451 153.504 683.107 164.863 654.519C179.753 617.046 221.088 596.062 261.126 591.265C301.164 586.452 341.473 594.402 381.677 597.465C421.88 600.527 464.95 597.872 498.094 574.896C544.061 543.035 559.146 480.942 600.617 443.423C635.194 412.135 687.406 401.817 731.276 417.612"
					stroke="currentColor" stroke-miterlimit="10" />
      <path
					d="M817.266 289.466C813.108 259.989 787.151 237.697 759.261 227.271C731.372 216.846 701.077 215.553 671.666 210.904C642.254 206.24 611.795 197.156 591.664 175.224C555.853 136.189 566.345 75.5336 560.763 22.8649C552.302 -56.8256 498.487 -130.133 425 -162.081"
					stroke="currentColor" stroke-miterlimit="10" />
      <path
					d="M832.584 276.159C828.427 246.683 802.469 224.391 774.58 213.965C746.69 203.539 716.395 202.246 686.984 197.598C657.573 192.934 627.114 183.85 606.982 161.918C571.172 122.883 581.663 62.2275 576.082 9.55873C567.62 -70.1318 513.806 -143.439 440.318 -175.387"
					stroke="currentColor" stroke-miterlimit="10" />
      <path
					d="M847.904 262.853C843.747 233.376 817.789 211.084 789.9 200.659C762.011 190.233 731.716 188.94 702.304 184.292C672.893 179.627 642.434 170.544 622.303 148.612C586.492 109.577 596.983 48.9211 591.402 -3.74766C582.94 -83.4382 529.126 -156.746 455.638 -188.694"
					stroke="currentColor" stroke-miterlimit="10" />
      <path
					d="M863.24 249.547C859.083 220.07 833.125 197.778 805.236 187.353C777.347 176.927 747.051 175.634 717.64 170.986C688.229 166.321 657.77 157.237 637.639 135.306C601.828 96.2707 612.319 35.6149 606.738 -17.0538C598.276 -96.7443 544.462 -170.052 470.974 -202"
					stroke="currentColor" stroke-miterlimit="10" />
    </svg>
		</div>
	</section>


	<section class="homepage_tab position-relative">
		<div class="section container">
			<div class="row justify-content-center">
				<div class="col-lg-8 mb-4">
					<div class="section-title text-center">
						<p class="text-primary text-uppercase fw-bold mb-3">Difference
							Of Us</p>
						<h1>關於為什麼你需要一段旅行</h1>
					</div>
				</div>
				<div class="col-lg-10">
					<ul
						class="payment_info_tab nav nav-pills justify-content-center mb-4"
						id="pills-tab" role="tablist">
						<li class="nav-item m-2" role="presentation"><a
							class="nav-link btn btn-outline-primary effect-none text-dark active"
							id="pills-how-much-can-i-recive-tab" data-bs-toggle="pill"
							href="#pills-how-much-can-i-recive" role="tab"
							aria-controls="pills-how-much-can-i-recive" aria-selected="true">旅行是什麼?</a></li>
						<li class="nav-item m-2" role="presentation"><a
							class="nav-link btn btn-outline-primary effect-none text-dark "
							id="pills-how-much-does-it-costs-tab" data-bs-toggle="pill"
							href="#pills-how-much-does-it-costs" role="tab"
							aria-controls="pills-how-much-does-it-costs" aria-selected="true">旅行的意義?</a></li>
						<li class="nav-item m-2" role="presentation"><a
							class="nav-link btn btn-outline-primary effect-none text-dark "
							id="pills-how-do-i-repay-tab" data-bs-toggle="pill"
							href="#pills-how-do-i-repay" role="tab"
							aria-controls="pills-how-do-i-repay" aria-selected="true">旅途的終點?</a></li>
					</ul>
					<div class="rounded shadow bg-white p-5 tab-content"
						id="pills-tabContent">
						<div class="tab-pane fade show active"
							id="pills-how-much-can-i-recive" role="tabpanel"
							aria-labelledby="pills-how-much-can-i-recive-tab">
							<div class="row align-items-center">
								<div class="col-md-6 order-1 order-md-0">
									<div class="content-block">
										<h3 class="mb-4">旅行是什麼?</h3>
										<div class="content">
											<p>旅行是心靈與身體的雙重旅程，它超越地理的界限，開啟心靈的視野。
												在旅途中，我們不僅體驗異國風情，更在旅途的每一步中找尋自我。</p>
											<p>旅行不是遠離日常生活的逃避，是一種尋找新視角的冒險。
												每一次的旅行，都是對未知的探索，讓我們的生活更加豐富多彩。</p>
										</div>
									</div>
								</div>
								<div class="col-md-6 order-0 order-md-1 mb-5 mt-md-0">
									<div class="image-block text-center">
										<img loading="lazy" decoding="async"
											src="images/payment-info.png" alt="How Much Can I Recive?"
											class="img-fluid">
									</div>
								</div>
							</div>
						</div>
						<div class="tab-pane fade " id="pills-how-much-does-it-costs"
							role="tabpanel"
							aria-labelledby="pills-how-much-does-it-costs-tab">
							<div class="row align-items-center">
								<div class="col-md-6 order-1 order-md-0">
									<div class="content-block">
										<h3 class="mb-4">旅行的意義?</h3>
										<div class="content">
											<p>旅行不僅是一種身體上的遷徙，更是心靈的一次深度探索。
											它讓我們跳脫日常生活的框架，體驗不同的文化與風俗。
											在旅途中，我們會遇見各種人，聽到不同的故事，這些經歷豐富了我們的人生視野，讓我們學會更加包容和理解。</p>
											<p>旅行是尋找自我、重新定義生活的過程。
											它不僅帶給我們暫時的放鬆和樂趣，更重要的是，它賦予我們新的視角來看待自己和周圍的世界。
											在旅行中，我們有機會挑戰自己，突破舒適區，這種成長是日常生活難以提供的。</p>
										</div>
									</div>
								</div>
								<div class="col-md-6 order-0 order-md-1 mb-5 mt-md-0">
									<div class="image-block text-center">
										<img loading="lazy" decoding="async"
											src="images/illustration-2.png" alt="How Much Does It Costs?"
											class="img-fluid">
									</div>
								</div>
							</div>
						</div>
						<div class="tab-pane fade " id="pills-how-do-i-repay"
							role="tabpanel" aria-labelledby="pills-how-do-i-repay-tab">
							<div class="row align-items-center">
								<div class="col-md-6 order-1 order-md-0">
									<div class="content-block">
										<h3 class="mb-4">旅途的終點?</h3>
										<div class="content">
											<p>旅途的終點，不僅是地理上的終點站，更是心靈的一次降落。
											走過千山萬水，我們學會了欣賞路途中的風景，也學會了放下過去的包袱。
											在這裡，我們找到了內心的平靜，感受到前所未有的自由。
											就像是長途跋涉後的深呼吸，每一次的旅行，都是向自己的心靈深處邁進的一步。</p>
											<p>每一段旅程都有它的終點，但真正的旅行從不因終點而結束。
											在旅途的最後一刻，我們回首來時路，感慨萬千。
											那些遇見的人、發生的事，都化為珍貴的回憶，銘刻在心。終點或許意味著暫時的休息，但更是新旅程的開始。
											未來的路，仍然漫長而美好，等待著我們去探索、去體驗。</p>
										</div>
									</div>
								</div>
								<div class="col-md-6 order-0 order-md-1 mb-5 mt-md-0">
									<div class="image-block text-center">
										<img loading="lazy" decoding="async"
											src="images/illustration-1.png" alt="How Do I Repay?"
											class="img-fluid">
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="has-shapes">
				<svg class="shape shape-left text-light" width="290" height="709"
					viewBox="0 0 290 709" fill="none"
					xmlns="http://www.w3.org/2000/svg">
        <path
						d="M-119.511 58.4275C-120.188 96.3185 -92.0001 129.539 -59.0325 148.232C-26.0649 166.926 11.7821 174.604 47.8274 186.346C83.8726 198.088 120.364 215.601 141.281 247.209C178.484 303.449 153.165 377.627 149.657 444.969C144.34 546.859 197.336 649.801 283.36 704.673"
						stroke="currentColor" stroke-miterlimit="10" />
        <path
						d="M-141.434 72.0899C-142.111 109.981 -113.923 143.201 -80.9554 161.895C-47.9878 180.588 -10.1407 188.267 25.9045 200.009C61.9497 211.751 98.4408 229.263 119.358 260.872C156.561 317.111 131.242 391.29 127.734 458.631C122.417 560.522 175.414 663.463 261.437 718.335"
						stroke="currentColor" stroke-miterlimit="10" />
        <path
						d="M-163.379 85.7578C-164.056 123.649 -135.868 156.869 -102.901 175.563C-69.9331 194.256 -32.086 201.934 3.9592 213.677C40.0044 225.419 76.4955 242.931 97.4127 274.54C134.616 330.779 109.296 404.957 105.789 472.299C100.472 574.19 153.468 677.131 239.492 732.003"
						stroke="currentColor" stroke-miterlimit="10" />
        <path
						d="M-185.305 99.4208C-185.982 137.312 -157.794 170.532 -124.826 189.226C-91.8589 207.919 -54.0118 215.597 -17.9666 227.34C18.0787 239.082 54.5697 256.594 75.4869 288.203C112.69 344.442 87.3706 418.62 83.8633 485.962C78.5463 587.852 131.542 690.794 217.566 745.666"
						stroke="currentColor" stroke-miterlimit="10" />
      </svg>
				<svg class="shape shape-right text-light" width="474" height="511"
					viewBox="0 0 474 511" fill="none"
					xmlns="http://www.w3.org/2000/svg">
        <path
						d="M601.776 325.899C579.043 348.894 552.727 371.275 520.74 375.956C478.826 382.079 438.015 355.5 412.619 321.6C387.211 287.707 373.264 246.852 354.93 208.66C336.584 170.473 311.566 132.682 273.247 114.593C220.12 89.5159 155.704 108.4 99.7772 90.3769C53.1531 75.3464 16.3392 33.2759 7.65012 -14.947"
						stroke="currentColor" stroke-miterlimit="10" />
        <path
						d="M585.78 298.192C564.28 319.945 539.378 341.122 509.124 345.548C469.472 351.341 430.868 326.199 406.845 294.131C382.805 262.059 369.62 223.419 352.278 187.293C334.936 151.168 311.254 115.417 275.009 98.311C224.74 74.582 163.815 92.4554 110.913 75.3971C66.8087 61.1784 31.979 21.3767 23.7639 -24.2362"
						stroke="currentColor" stroke-miterlimit="10" />
        <path
						d="M569.783 270.486C549.5 290.99 526.04 310.962 497.501 315.13C460.111 320.592 423.715 296.887 401.059 266.641C378.392 236.402 365.963 199.965 349.596 165.901C333.24 131.832 310.911 98.1265 276.74 82.0034C229.347 59.6271 171.895 76.4848 122.013 60.4086C80.419 47.0077 47.5905 9.47947 39.8431 -33.5342"
						stroke="currentColor" stroke-miterlimit="10" />
        <path
						d="M553.787 242.779C534.737 262.041 512.691 280.809 485.884 284.722C450.757 289.853 416.568 267.586 395.286 239.173C373.993 210.766 362.308 176.538 346.945 144.535C331.581 112.533 310.605 80.8723 278.502 65.7217C233.984 44.6979 180.006 60.54 133.149 45.4289C94.0746 32.8398 63.2303 -2.41965 55.9568 -42.8233"
						stroke="currentColor" stroke-miterlimit="10" />
        <path
						d="M537.791 215.073C519.964 233.098 499.336 250.645 474.269 254.315C441.41 259.126 409.422 238.286 389.513 211.704C369.594 185.13 358.665 153.106 344.294 123.17C329.923 93.2337 310.293 63.6078 280.258 49.4296C238.605 29.7646 188.105 44.5741 144.268 30.4451C107.714 18.6677 78.8538 -14.3229 72.0543 -52.1165"
						stroke="currentColor" stroke-miterlimit="10" />
      </svg>
			</div>
		</div>
	</section>


	<section class="section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-12">
					<div class="section-title text-center mb-5 pb-2">
						<p class="text-primary text-uppercase fw-bold mb-3">Questions
							You Have</p>
						<h1>關於你的旅行前準備</h1>
					</div>
				</div>
				<div class="col-lg-6">
					<div
						class="accordion shadow rounded py-5 px-0 px-lg-4 bg-white position-relative"
						id="accordionFAQ">
						<div class="accordion-item p-1 mb-2">
							<h2 class="accordion-header accordion-button h5 border-0 active"
								id="heading-ebd23e34fd2ed58299b32c03c521feb0b02f19d9"
								type="button" data-bs-toggle="collapse"
								data-bs-target="#collapse-ebd23e34fd2ed58299b32c03c521feb0b02f19d9"
								aria-expanded="true"
								aria-controls="collapse-ebd23e34fd2ed58299b32c03c521feb0b02f19d9">行程規劃與研究</h2>
							<div id="collapse-ebd23e34fd2ed58299b32c03c521feb0b02f19d9"
								class="accordion-collapse collapse border-0 show"
								aria-labelledby="heading-ebd23e34fd2ed58299b32c03c521feb0b02f19d9"
								data-bs-parent="#accordionFAQ">
								<div class="accordion-body py-0 content">在旅行前，仔細規劃行程是必不可少的步驟。
								研究目的地的文化、景點、當地美食及交通方式，可以幫助您更有效地利用旅行時間，並避免不必要的麻煩。</div>
							</div>
						</div>
						<div class="accordion-item p-1 mb-2">
							<h2 class="accordion-header accordion-button h5 border-0 "
								id="heading-a443e01b4db47b3f4a1267e10594576d52730ec1"
								type="button" data-bs-toggle="collapse"
								data-bs-target="#collapse-a443e01b4db47b3f4a1267e10594576d52730ec1"
								aria-expanded="false"
								aria-controls="collapse-a443e01b4db47b3f4a1267e10594576d52730ec1">預訂住宿與交通</h2>
							<div id="collapse-a443e01b4db47b3f4a1267e10594576d52730ec1"
								class="accordion-collapse collapse border-0 "
								aria-labelledby="heading-a443e01b4db47b3f4a1267e10594576d52730ec1"
								data-bs-parent="#accordionFAQ">
								<div class="accordion-body py-0 content">提前預訂住宿與交通工具不僅能節省費用，還能確保您的旅程更加順暢。
								比較不同的平台與優惠，找到最適合您的選擇，並留意任何取消政策或改變日期的條件。</div>
							</div>
						</div>
						<div class="accordion-item p-1 mb-2">
							<h2 class="accordion-header accordion-button h5 border-0 "
								id="heading-4b82be4be873c8ad699fa97049523ac86b67a8bd"
								type="button" data-bs-toggle="collapse"
								data-bs-target="#collapse-4b82be4be873c8ad699fa97049523ac86b67a8bd"
								aria-expanded="false"
								aria-controls="collapse-4b82be4be873c8ad699fa97049523ac86b67a8bd">打包行李與必需品</h2>
							<div id="collapse-4b82be4be873c8ad699fa97049523ac86b67a8bd"
								class="accordion-collapse collapse border-0 "
								aria-labelledby="heading-4b82be4be873c8ad699fa97049523ac86b67a8bd"
								data-bs-parent="#accordionFAQ">
								<div class="accordion-body py-0 content">根據目的地的氣候和文化準備合適的服裝，並確保攜帶所有必需品，如護照、旅行保險、充電器、適用於當地的插頭轉換器等。
									輕便而實用的打包方式可以讓您的旅程更加舒適。</div>
							</div>
						</div>
						<div class="accordion-item p-1 mb-2">
							<h2 class="accordion-header accordion-button h5 border-0 "
								id="heading-3e13e9676a9cd6a6f8bfbe6e1e9fc0881ef247b3"
								type="button" data-bs-toggle="collapse"
								data-bs-target="#collapse-3e13e9676a9cd6a6f8bfbe6e1e9fc0881ef247b3"
								aria-expanded="false"
								aria-controls="collapse-3e13e9676a9cd6a6f8bfbe6e1e9fc0881ef247b3">健康與安全措施</h2>
							<div id="collapse-3e13e9676a9cd6a6f8bfbe6e1e9fc0881ef247b3"
								class="accordion-collapse collapse border-0 "
								aria-labelledby="heading-3e13e9676a9cd6a6f8bfbe6e1e9fc0881ef247b3"
								data-bs-parent="#accordionFAQ">
								<div class="accordion-body py-0 content">了解目的地的健康和安全信息，如疫苗接種、當地的醫療服務及緊急聯絡方式。
									攜帶一個小型急救包，包含基本的醫療用品和個人藥物，以備不時之需。</div>
							</div>
						</div>
						<div class="accordion-item p-1 mb-2">
							<h2 class="accordion-header accordion-button h5 border-0 "
								id="heading-0c2f829793a1f0562fea97120357dd2d43319164"
								type="button" data-bs-toggle="collapse"
								data-bs-target="#collapse-0c2f829793a1f0562fea97120357dd2d43319164"
								aria-expanded="false"
								aria-controls="collapse-0c2f829793a1f0562fea97120357dd2d43319164">學習基本的當地語言</h2>
							<div id="collapse-0c2f829793a1f0562fea97120357dd2d43319164"
								class="accordion-collapse collapse border-0 "
								aria-labelledby="heading-0c2f829793a1f0562fea97120357dd2d43319164"
								data-bs-parent="#accordionFAQ">
								<div class="accordion-body py-0 content">學習一些基本的當地語言，如問候語、數字和常用短語，可以在旅行中大有幫助。
								這不僅是對當地文化的尊重，也能在需要幫助時讓溝通更順暢。</div>
							</div>
						</div>
						<div class="accordion-item p-1 mb-2">
							<h2 class="accordion-header accordion-button h5 border-0 "
								id="heading-8fe6730e26db16f15763887c30a614caa075f518"
								type="button" data-bs-toggle="collapse"
								data-bs-target="#collapse-8fe6730e26db16f15763887c30a614caa075f518"
								aria-expanded="false"
								aria-controls="collapse-8fe6730e26db16f15763887c30a614caa075f518">財務規劃與預算</h2>
							<div id="collapse-8fe6730e26db16f15763887c30a614caa075f518"
								class="accordion-collapse collapse border-0 "
								aria-labelledby="heading-8fe6730e26db16f15763887c30a614caa075f518"
								data-bs-parent="#accordionFAQ">
								<div class="accordion-body py-0 content">確定旅行預算並規劃您的開支。了解目的地的貨幣兌換率，以及信用卡和現金的使用情況。
								提前通知您的銀行您將前往海外，避免信用卡被錯誤地鎖定。</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 mt-4 mt-lg-0">
					<div
						class="shadow rounded py-5 px-4 ms-0 ms-lg-4 bg-white position-relative">
						<div class="block mx-0 mx-lg-3 mt-0">
							<h4 class="h5">Still Have Questions?</h4>
							<div class="content">
								Call Us We Will Be Happy To Help <br> <a
									href="tel:+3301563965">+3301563965</a> <br>Monday - Friday
								<br>9AM TO 8PM Eastern Time
							</div>
						</div>
						<div class="block mx-0 mx-lg-3 mt-4">
							<h4 class="h5">Canada Office</h4>
							<div class="content">
								231 Ross Street. <br>K7A 1C2. <br>Smiths Falls
							</div>
						</div>
						<div class="block mx-0 mx-lg-3 mt-4">
							<h4 class="h5">UK Office</h4>
							<div class="content">
								57 Folkestone Road. <br>AB54 5XQ, <br>Winston
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<footer class="section-sm bg-tertiary">
		<div class="container">
			<div class="row justify-content-between">
				<div class="col-lg-2 col-md-4 col-6 mb-4">
					<div class="footer-widget">
						<h5 class="mb-4 text-primary font-secondary">Service</h5>
						<<ul class="list-unstyled">
							<li class="mb-2"><a href="service-details.html">個人服務</a></li>
							<li class="mb-2"><a href="service-details.html">家庭服務</a></li>
							<li class="mb-2"><a href="service-details.html">學生專區</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-2 col-md-4 col-6 mb-4">
					<div class="footer-widget">
						<h5 class="mb-4 text-primary font-secondary">關於我們</h5>
						<ul class="list-unstyled">
							<li class="mb-2"><a href="#!">最有價值員工</a></li>
							<li class="mb-2"><a href="#!">我們的故事</a></li>
							<li class="mb-2"><a href="#!">我們團隊</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-2 col-md-4 col-6 mb-4">
					<div class="footer-widget">
						<h5 class="mb-4 text-primary font-secondary">協助</h5>
						<ul class="list-unstyled">
							<li class="mb-2"><a href="contact.html">聯繫我們</a></li>
							<li class="mb-2"><a href="faq.html">FAQs</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-4 col-md-12 newsletter-form">
					<div style="background-color: #F4F4F4; padding: 35px;">
						<h5 class="mb-4 text-primary font-secondary">訂閱我們</h5>
						<div class="pe-0 pe-xl-5">
							<form action="#!" method="post" name="mc-embedded-subscribe-form"
								target="_blank">
								<div class="input-group mb-3">
									<input type="text"
										class="form-control shadow-none bg-white border-end-0"
										placeholder="Email address"> <span
										class="input-group-text border-0 p-0">
										<button class="input-group-text border-0 bg-primary"
											type="submit" name="subscribe"
											aria-label="Subscribe for Newsletter">
											<i class="fas fa-arrow-right"></i>
										</button>
									</span>
								</div>
								<div style="position: absolute; left: -5000px;"
									aria-hidden="true">
									<input type="text"
										name="b_463ee871f45d2d93748e77cad_a0a2c6d074" tabindex="-1">
								</div>
							</form>
						</div>
						<p class="mb-0">訂閱即可享有生日訂房折扣(可保存一年)，還會收到每月全台各地高評價房間月報。</p>
					</div>
				</div>
			</div>
			<div class="row align-items-center mt-5 text-center text-md-start">
				<div class="col-lg-4">
					<a href="index.html"> <img loading="prelaod" decoding="async"
						class="img-fluid" width="160" src="images/logo.png" alt="Wallet">
					</a>
				</div>
				<div class="col-lg-4 col-md-6 mt-4 mt-lg-0">
					<ul class="list-unstyled list-inline mb-0 text-lg-center">
						<li class="list-inline-item me-4"><a class="text-black"
							href="privacy-policy.html">Privacy Policy</a></li>
						<li class="list-inline-item me-4"><a class="text-black"
							href="terms.html">Terms &amp; Conditions</a></li>
					</ul>
				</div>
				<div class="col-lg-4 col-md-6 text-md-end mt-4 mt-md-0">
					<ul class="list-unstyled list-inline mb-0 social-icons">
						<li class="list-inline-item me-3"><a
							title="Explorer Facebook Profile" class="text-black"
							href="https://facebook.com/"><i class="fab fa-facebook-f"></i></a>
						</li>
						<li class="list-inline-item me-3"><a
							title="Explorer Twitter Profile" class="text-black"
							href="https://twitter.com/"><i class="fab fa-twitter"></i></a></li>
						<li class="list-inline-item me-3"><a
							title="Explorer Instagram Profile" class="text-black"
							href="https://instagram.com/"><i class="fab fa-instagram"></i></a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</footer>


	<!-- # JS Plugins -->
	<script src="plugins/jquery/jquery.min.js"></script>
	<script src="plugins/bootstrap/bootstrap.min.js"></script>
	<script src="plugins/slick/slick.min.js"></script>
	<script src="plugins/scrollmenu/scrollmenu.min.js"></script>

	<!-- Main Script -->
	<script src="js/script.js"></script>

</body>
</html>
