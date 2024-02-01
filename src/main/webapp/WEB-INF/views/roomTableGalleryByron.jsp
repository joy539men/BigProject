<%@ page language="java" contentType="text/html; charset=UTF-8"  
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>


<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="utf-8">
<title>PillowSurfing | 出租模式</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=5">
<meta name="description" content="This is meta description">
<meta name="author" content="Themefisher">
<link rel="shortcut icon" href="../images/logo.ico" type="image/x-icon">
<link rel="icon" href="images/logo.ico" type="image/x-icon">

<!-- # CSS Plugins -->

<link rel="stylesheet" href="plugins/slick/slick.css">
<link rel="stylesheet" href="plugins/font-awesome/fontawesome.min.css">
<link rel="stylesheet" href="plugins/font-awesome/brands.css">
<link rel="stylesheet" href="plugins/font-awesome/solid.css">

<!-- # Main Style Sheet -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/providerStyle.css">






<!-- 篩選條件 -->


<link href="https://cdn.jsdelivr.net/npm/nouislider/distribute/nouislider.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/nouislider/distribute/nouislider.min.js"></script> 


<link rel="stylesheet" href="Test/calendar_css.css">
<script src="js/room-detail.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="Test/style123.css">


<link rel="stylesheet" href="Test/moreFilter.css">

</head>
<title>Image Gallery</title>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>

    /* function parse(a) {
        var str = a;
        console.log("str:", str); // 添加这行日志
        var roomId = parseInt(str.match(/\d+/)[0]);
        
        return roomId;
    } */
        
		// 	實作 Ajax 但重要的是回傳值一定會是 JSON 需要修改
        /* function getImageDetails(roomId) {
            // 使用jQuery的Ajax向后端发送请求
            $.ajax({
                type: "GET",
                url: "/pillowSurfing/getRoomDetails/" + roomId,
                dataType: false,
                success: function(response) {
                    // 在这里处理从后端返回的数据
                    alert("Room Details: " + response.otherDetails);
                },
                error: function(xhr, status, error) {
                    // 在这里处理请求失败的情况
                    console.error("Error fetching room details: " + error);
                }
            });
        } */

		// 改為直接頁面跳轉
		 function getRoomDetails(roomId) {
  			  window.location.href = 'getRoomDetailsAndBook/' + roomId;
		}

        
    </script>
</head>
<body style="background-color: rgb(250, 250, 250,0);">
<input id="targetStartDate" type="hidden"  value=""/>
<input id="targetEndDate" type="hidden" value=""/>
<input id="targetMinPrice" type="hidden"  value=""/>
<input id="targetMaxPrice" type="hidden" value=""/>
<input id="targetLocation" type="hidden" value=""/>
  <div class="overlay"></div> 
	<header class="navigation">
      <nav class="navbar navbar-expand-xl navbar-light text-center py-3">
        <div class="container">
          <a class="navbar-brand" href="index.html">
            <img
              loading="prelaod"
              decoding="async"
              class="img-fluid"
              width="120"
              src="images/logo.png"
              alt="CouchSurfing"
            />
          </a>
          <button
            class="navbar-toggler"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent"
            aria-expanded="false"
            aria-label="Toggle navigation"
          >
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">


            
            <ul class="navbar-nav mx-auto mb-2 mb-lg-0 border rounded-lg  "  >
              <li class="nav-item">
                <a class="nav-link" id="show">風 格</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" id="show2">日 期</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" id="show3">人 數</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" ><i class="bi bi-search"></i></a>
              </li>
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">選單</a>
                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                  <li><a class="dropdown-item" href="blog.html">Blog</a></li>
                  <li>
                    <a class="dropdown-item" href="blog-details.html">Blog Details</a>
                  </li>
                  <li>
                    <a class="dropdown-item" href="service-details.html">Service Details</a>
                  </li>
                  <li>
                    <a class="dropdown-item" href="faq.html">FAQ&#39;s</a>
                  </li>
                  <li><a class="dropdown-item" href="legal.html">Legal</a></li>
                  <li>
                    <a class="dropdown-item" href="terms.html">Terms &amp; Condition</a>
                  </li>
                  <li>
                    <a class="dropdown-item" href="privacy-policy.html">Privacy &amp; Policy</a>
                  </li>
                </ul>
              </li>
            </ul>
            <div class="side " id="gayab" >
              <nav class="col-12 " >
                  <div >
                      <div class="btn-group mb-3" role="group" 
                           style="margin-left: 7px;
                                  margin-top: 67px;
                                  border-radius: 5px;">
                          <button class="btn btn-outline-secondary" 
                              type="button" 
                              class="searbutton1"
                              id="button1" 
                              style="height: 56px;width: 98px;">
                              任何地方
                          </button>
                          
                          <button class="btn btn-outline-secondary" 
                              type="button" 
                              class="searbutton2"
                              id="button2" 
                              style="height: 56px;width: 315px;">
                              任1週
                          </button>

                          <button class="btn btn-outline-secondary" 
                              type="button" 
                              class="searbutton3"
                              id="button3" 
                              style="height: 56px;width: 155px;">
                              新增人數
                          </button>
      
                          <button class="btn btn-outline-secondary searbutton4" 
                                  id="button4"
                                  style="height: 56px;width: 60px;">
                            <img src="images/magnifying-glass_icon-icons.com_73497.png" style="width: 22px;height: 22px;">
                        </button>
                      </div>
                  </div>



                  <div id="popupWindow" class="popupWindow" style="margin-top: 6%; margin-left: -3%;" >
                      <h5 style="margin-left: 54px; margin-top: 54px;font-size: 25px;">找風格?</h5>
                      
                      
                      <button class="square-button" style="margin-left: 4%;margin-top: 23px;" id="style1">
                          <img src="./找風格/古典.png">
                      </button>

                      <button class="square-button" id="style2">
                          <img src="./找風格/小木屋.png">
                      </button>

                      <button class="square-button" id="style3">
                          <img src="./找風格/時尚.png">
                      </button>

                      <button class="square-button"style="margin-left: 4%; margin-top: 33px;" id="style4">
                          <img src="./找風格/溫馨.png">
                      </button>

                      <button class="square-button" id="style5">
                          <img src="./找風格/背包客.png">
                      </button>

                      <button class="square-button" id="style6">
                          <img src="./找風格/質感.png">
                      </button>



                  </div>
                  <div id="secondPopupWindow" style="margin-top: 77px;">
                      <div class="poup2-container" >
                          
                          <div class="row">
                              <div class="col-md-12">
                                  <div class="calendar-section">
                              <div class="row no-gutters">
                                <div class="col-md-6">
              
                                  <div class="calendar calendar-first" id="calendar_first" style="border-radius: 5rem;">
                                    <div class="calendar_header">
                                      <button class="switch-month switch-left">
                                        <i class="fa fa-chevron-left"></i>
                                      </button>
                                      <h2 id="month1"></h2>
                                      <button class="switch-month switch-right">
                                        <i class="fa fa-chevron-right"></i>
                                      </button>
                                    </div>
                                    <div class="calendar_weekdays"></div>
                                    <div class="calendar_content"></div>
                                  </div>
                                </div>
                                <div class="col-md-6">
              
                                  <div class="calendar calendar-second" id="calendar_second" style="border-radius: 5rem;">
                                    <div class="calendar_header">
                                      <button class="switch-month switch-left">
                                        <i class="fa fa-chevron-left"></i>
                                      </button>
                                      <h2 id="month2"></h2>
                                      <button class="switch-month switch-right">
                                        <i class="fa fa-chevron-right"></i>
                                      </button>
                                    </div>
                                    <div class="calendar_weekdays"></div>
                                    <div class="calendar_content"></div>
                                  </div>            
              
                                </div>
              
                              </div> <!-- End Row -->
                                  
                            </div> <!-- End Calendar -->
                              </div>
                          </div>
                      </div>
                  </div>
                  <div  id="thirdPopupWindow" style="margin-top: -62px; margin-left: -30px;">
                      <div class="number-selector">
                          <br>
                          <div class="selector-item">
                              
                              <div>
                                  <div class="selector-title">旅客</div>
                                  <!-- <div class="selector-subtitle">年滿 13 歲</div> -->
                              </div>
                              <div>
                                  <span class="btn-counter" onclick="changeCount('adult', -1)">-</span>
                                  <span id="adult" class="counter-value">0</span>
                                  <span class="btn-counter" onclick="changeCount('adult', 1)">+</span>
                              </div>
                          </div>
                          <!-- <br>
                          <div class="selector-item">
                              <div>
                                  <div class="selector-title">兒童</div>
                                  <div class="selector-subtitle">2 - 12 歲</div>
                              </div>
                              <div>
                                  <span class="btn-counter" onclick="changeCount('child', -1)">-</span>
                                  <span id="child" class="counter-value">0</span>
                                  <span class="btn-counter" onclick="changeCount('child', 1)">+</span>
                              </div>
                          </div>
                          <br>
                          <div class="selector-item">
                              <div>
                                  <div class="selector-title">嬰幼兒</div>
                                  <div class="selector-subtitle">2 歲以下</div>
                              </div>
                              <div>
                                  <span class="btn-counter" onclick="changeCount('infant', -1)">-</span>
                                  <span id="infant" class="counter-value">0</span>
                                  <span class="btn-counter" onclick="changeCount('infant', 1)">+</span>
                              </div>
                              
                          </div> -->
                          
                          <div>
                              <button type="button" class="confirm" style="margin-right: 137px;">確認</button>
                          </div>
                      </div>
                  </div>

              </nav>
          </div>


            <!-- <div>
              account btn
              <li class="dropdown">
                <a
                  class="p-3 border rounded-pill pb-4"
                  href="#"
                  id="navbarDropdown"
                  role="button"
                  data-bs-toggle="dropdown"
                  aria-expanded="false"
                  ><i class="bi w-50 bi-list pe-4" style="font-size: 20px; color: grey;"></i
                  ><img style="width: 50px; padding-top:5px" src="images/logo.png" alt=""
                /></a>
                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                  <li class="dropdown-item">
                    <img
                      class="img-fluid"
                      style="width: 50px"
                      src="images/logo.png"
                      alt=""
                    />
                    <h4>Krist</h4>
                  </li>
                  <li class="dropdown-item">
                    <hr />
                  </li>
                  <li><a class="dropdown-item" href="blog.html">旅程</a></li>
                  <li class="dropdown-item">
                    <hr />
                  </li>
                  <li>
                    <a class="dropdown-item" href="blog-details.html">訊息</a>
                  </li>
                  <li>
                    <a class="dropdown-item" href="service-details.html"
                      >行程規劃</a
                    >
                  </li>
                  <li class="dropdown-item">
                    <hr />
                  </li>
                  <li><a class="dropdown-item" href="faq.html">幫助</a></li>
                  <li><a class="dropdown-item" href="legal.html">登出</a></li>
                </ul>
              </li>
            </div> -->
            <div>
					    <!-- account btn -->
					    <ul class="nav">
					        <li class="nav-item dropdown">
					            <a class="p-3 border rounded-pill "
					                href="#" id="navbarDropdown" role="button"
					                data-bs-toggle="dropdown" aria-expanded="false">
					                <img style="width: 15px" src="images/icon/fish.png" alt="" />
					                <img class="mb-1" style="width: 50px" src="images/logo.png" alt="" />
					            </a>
					            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
					                <li class="dropdown-item">
					                    <img class="img-fluid " style="width: 50px" src="images/logo.png" alt="" />
					                    <h4>Krist</h4>
					                </li>
					                <li class="dropdown-item">
					                    <hr />
					                </li>
					                <li><a class="dropdown-item" href="blog.html">旅程</a></li>
					                <li class="dropdown-item">
					                    <hr />
					                </li>
					                <li><a class="dropdown-item" href="blog-details.html">訊息</a></li>
					                <li><a class="dropdown-item" href="service-details.html">行程規劃</a></li>
					                <li class="dropdown-item">
					                    <hr />
					                </li>
					                <li><a class="dropdown-item" href="faq.html">幫助</a></li>
					                <li><a class="dropdown-item" href="legal.html">登出</a></li>
					            </ul>
					        </li>
					    </ul>
					</div>
          </div>
        </div>
      </nav>
  </header>
    
    <div class="row w-75 mx-auto  d-flex align-items-center"> 
        
      <div class="d-flex justify-content-evenly "> 
            <div class="scroll-buttons d-flex " style="width: 772px;">
                    <button class="arrow-button " style="max-width: 165%; background-color: #ffffff;" onclick="scrollaaa()">
                        <img src="./地區ICON/left-arrow.png" width="60px" height="60px">
                    </button>
                    <div class="wrapper" >
                        <button type="button" class="item" onclick="getLocation('屏東')"
                            style="border: 0px; background-color: rgb(250, 250, 250,0);outline: none;">
                            <img src="./地區ICON/屏東.png" style="max-width: 150px; height: 53px;"></button>
                        <button type="button" class="item" onclick="getLocation('澎湖')"
                            style="border: 0px; background-color: rgb(250, 250, 250,0);outline: none;">
                            <img src="./地區ICON/澎湖.png" style="max-width: 150px; height: 53px;"></button>
                        <button type="button" class="item" onclick="getLocation('高雄')"
                            style="border: 0px; background-color: rgb(250, 250, 250,0);outline: none;">
                            <img src="./地區ICON/高雄.png" style="max-width: 150px; height: 53px;"></button>
                        <button type="button" class="item" onclick="getLocation('台南')"
                            style="border: 0px; background-color: rgb(250, 250, 250,0);outline: none;">
                            <img src="./地區ICON/台南.png" style="max-width: 150px; height: 53px;"></button>
                        <button type="button" class="item" 
                            style="border: 0px; background-color: rgb(250, 250, 250,0);outline: none;">
                            <img src="./地區ICON/花蓮.png" style="max-width: 150px; height: 53px;"></button>
                        <button type="button" class="item" 
                            style="border: 0px; background-color: rgb(250, 250, 250,0);outline: none;">
                            <img src="./地區ICON/嘉義.png" style="max-width: 150px; height: 53px;"></button>
                        <button type="button" class="item" 
                            style="border: 0px; background-color: rgb(250, 250, 250,0);outline: none;">
                            <img src="./地區ICON/基隆.png" style="max-width: 150px; height: 53px;"></button>
                        <button type="button" class="item" 
                            style="border: 0px; background-color: rgb(250, 250, 250,0);outline: none;">
                            <img src="./地區ICON/宜蘭.png" style="max-width: 150px; height: 53px;"></button>
                        <button type="button" class="item" 
                            style="border: 0px; background-color: rgb(250, 250, 250,0);outline: none;">
                            <img src="./地區ICON/台東.png" style="max-width: 150px; height: 53px;"></button>
                        <button type="button" class="item" 
                            style="border: 0px; background-color: rgb(250, 250, 250,0);outline: none;">
                            <img src="./地區ICON/彰化.png" style="max-width: 150px; height: 53px;"></button>
                        <button type="button" class="item" 
                            style="border: 0px; background-color: rgb(250, 250, 250,0);outline: none;">
                            <img src="./地區ICON/新北.png" style="max-width: 150px; height: 53px;"></button>
                        <button type="button" class="item" 
                            style="border: 0px; background-color: rgb(250, 250, 250,0);outline: none;">
                            <img src="./地區ICON/新竹.png" style="max-width: 150px; height: 53px;"></button>
                        <button type="button" class="item" 
                            style="border: 0px; background-color: rgb(250, 250, 250,0);outline: none;">
                            <img src="./地區ICON/桃園.png" style="max-width: 150px; height: 53px;"></button>
                        <button type="button" class="item" 
                            style="border: 0px; background-color: rgb(250, 250, 250,0);outline: none;">
                            <img src="./地區ICON/台中.png" style="max-width: 150px; height: 53px;"></button>
                        <button type="button" class="item" 
                            style="border: 0px; background-color: rgb(250, 250, 250,0);outline: none;">
                            <img src="./地區ICON/台北.png" style="max-width: 150px; height: 53px;"></button>
                        <button type="button" class="item" 
                            style="border: 0px; background-color: rgb(250, 250, 250,0);outline: none;">
                            <img src="./地區ICON/連江.png" style="max-width: 150px; height: 53px;"></button>
                        <button type="button" class="item" 
                            style="border: 0px; background-color: rgb(250, 250, 250,0);outline: none;">
                            <img src="./地區ICON/苗栗.png" style="max-width: 150px; height: 53px;"></button>
                        <button type="button" class="item" 
                            style="border: 0px; background-color: rgb(250, 250, 250,0);outline: none;">
                            <img src="./地區ICON/金門.png" style="max-width: 150px; height: 53px;"></button>
                        <button type="button" class="item" 
                            style="border: 0px; background-color: rgb(250, 250, 250,0);outline: none;">
                            <img src="./地區ICON/雲林.png" style="max-width: 150px; height: 53px;"></button>
                        <button type="button" class="item" 
                            style="border: 0px; background-color: rgb(250, 250, 250,0);outline: none;">
                            <img src="./地區ICON/南投.png" style="max-width: 150px; height: 53px;"></button>
                        

                    </div>
                    <button class="arrow-button" style="max-width: 165%; background-color: #ffffff;" onclick="scrollRight()">
                        <img src="./地區ICON/right-arrow.png" width="60px" height="60px">
                    </button>
            </div>
            

            <div class="d-flex text-end  justify-content-end ">
              <a class="btn btn btn-outline-primary" 
                 style="margin-right: 31px; margin-top: 7px;height: 38px;" 
                 href="<c:url value = '/addRoomKrist'/>">
                 新增房源
              </a>
              <div>
              <a class="btn btn-primary " 
                 href="<c:url value = ''/>" 
                 data-toggle="modal" 
                 data-target="#priceRangeModal"
                 style="margin-top: 7px; "> 
                 篩選條件
              </a>
                <!--進階篩選-->
                <div class="modal" id="priceRangeModal" >
                  <div class="modal-dialog modal-lg" >
                    <div class="modal-content custom-modal"   style=" margin-left: 13px;height: 672px;">
                
                      <!-- Modal Header -->
                      <div class="modal-header">
                        <h4 class="modal-title">價格範圍</h4>
                        <button type="button" class="close" data-dismiss="modal">
                          <img src="images/xbutton.png" style="width: 30px;height:30px">
                        </button>
                      </div>
                
                      <!-- Modal Body -->
                      <div class="modal-body">
                        <div id="priceRangeSlider"></div>
                        <p style="font-size: 21px;">
                          Price range: <span id="priceRangeMin">$500</span> - <span id="priceRangeMax">$20000</span>
                        </p>
                        <div class="container">
                          <div class="row mb-2">
                              <div class="col">
                              <h5>房間</h5>
                              <div class="pbtn-group" role="group" aria-label="Bedrooms">
                                  <button type="button" class="button-pillow" data-group="bedroom">任何</button>
                                  <button type="button" class="button-pillow" data-group="bedroom">1</button>
                                  <button type="button" class="button-pillow" data-group="bedroom">2</button>
                                  <button type="button" class="button-pillow" data-group="bedroom">3</button>
                                  <button type="button" class="button-pillow" data-group="bedroom">4</button>
                                  <button type="button" class="button-pillow" data-group="bedroom">5</button>
                                  <button type="button" class="button-pillow" data-group="bedroom">6</button>
                                  <button type="button" class="button-pillow" data-group="bedroom">7</button>
                                  <button type="button" class="button-pillow" data-group="bedroom">8+</button>
                              </div>
                          </div>
                      </div>
                    
                      
                          <div class="row mb-2">
                              <div class="col">
                              <h5>床位</h5>
                              <div class="pbtn-group" role="group" aria-label="Living Rooms">
                                  <button type="button" class="button-pillow" data-group="living-room">任何</button>
                                  <button type="button" class="button-pillow" data-group="living-room">1</button>
                                  <button type="button" class="button-pillow" data-group="living-room">2</button>
                                  <button type="button" class="button-pillow" data-group="living-room">3</button>
                                  <button type="button" class="button-pillow" data-group="living-room">4</button>
                                  <button type="button" class="button-pillow" data-group="living-room">5</button>
                                  <button type="button" class="button-pillow" data-group="living-room">6</button>
                                  <button type="button" class="button-pillow" data-group="living-room">7</button>
                                  <button type="button" class="button-pillow" data-group="living-room">8+</button>
                              </div>
                              </div>
                          </div>
                    
                    
                          <div class="row">
                              <div class="col">
                              <h5>衛浴</h5>
                              <div class="pbtn-group" role="group" aria-label="Bathrooms">
                                  <button type="button" class="button-pillow" data-group="bathroom">任何</button>
                                  <button type="button" class="button-pillow" data-group="bathroom">1</button>
                                  <button type="button" class="button-pillow" data-group="bathroom">2</button>
                                  <button type="button" class="button-pillow" data-group="bathroom">3</button>
                                  <button type="button" class="button-pillow" data-group="bathroom">4</button>
                                  <button type="button" class="button-pillow" data-group="bathroom">5</button>
                                  <button type="button" class="button-pillow" data-group="bathroom">6</button>
                                  <button type="button" class="button-pillow" data-group="bathroom">7</button>
                                  <button type="button" class="button-pillow" data-group="bathroom">8+</button>
                              </div>
                              </div>
                          </div>
                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary close-modal " data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary close-modal" data-dismiss="modal" onclick=showRoom(false)>Save Changes</button>
                        </div>
                      </div>

                    </div>
                  </div>
                  </div>
                </div>
                <!--到這裡是進階篩選-->
             </div>
          </div>
      </div>
    </div>

   


	<div id="houseList" class="w-75 mx-auto row">
		<c:forEach var="room" items="${roomListByron}">
			<div class="col-4">
				<div id="houseA" class="card  houseCard mx-auto mb-5">
					<img class="card-img-top" src="<c:url value = '${room.filePath}'/>"
						onclick="getRoomDetails(${room.roomId})" />
					<div class="card-body">
						<h5 class="card-title ">${room.title}</h5>
						<span class="card-text">${room.type}</span><br> 
						<span class="card-text">${room.guestMax}人入住</span><br>
					</div>
					
				</div>
			</div>
		</c:forEach>
	</div>


	<script src="plugins/jquery/jquery.min.js"></script>
	<script src="plugins/bootstrap/bootstrap.min.js"></script>
	<script src="plugins/slick/slick.min.js"></script>
	<script src="plugins/scrollmenu/scrollmenu.min.js"></script>
	<script src="Test/moreFilter.js"></script>
	<script src="Test/jquery1.min.js"></script>
	<script src="Test/popper1.js"></script>
	<script src="Test/bootstrap1.min.js"></script>
	<script src="Test/main1.js"></script>
</body>
</html>


