<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>

<!--
 // WEBSITE: https://themefisher.com
 // TWITTER: https://twitter.com/themefisher
 // FACEBOOK: https://www.facebook.com/themefisher
 // GITHUB: https://github.com/themefisher/
-->

<html lang="en-us">
  <head>
    <meta charset="utf-8" />
    <title>Book page</title>
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, maximum-scale=5"
    />
    <meta name="description" content="This is meta description" />
    <meta name="author" content="Themefisher" />
    <link rel="shortcut icon" href="images/favicon.png" type="image/x-icon" />
    <link rel="icon" href="images/favicon.png" type="image/x-icon" />

    <!-- theme meta -->
    <meta name="theme-name" content="wallet" />

    <!-- # Google Fonts -->
    <!-- <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Rubik:wght@400;500;700&display=swap"
      rel="stylesheet"
    />

    # CSS Plugins
    <link rel="stylesheet" href="plugins/slick/slick.css" />
    <link rel="stylesheet" href="plugins/font-awesome/fontawesome.min.css" />
    <link rel="stylesheet" href="plugins/font-awesome/brands.css" />
    <link rel="stylesheet" href="plugins/font-awesome/solid.css" /> -->

    <!-- # Main Style Sheet -->
    <link rel="stylesheet" href="css/style.css" />
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.0/sockjs.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

    <!-- # Bootstrap -->
   <!--  <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css"
      
      
    /> -->
    
    <style>
        /* 左邊對話框樣式 */
		.my-message {
		    background-color: white; /* 左邊對話框的背景顏色 */
		    color: black; /* 文字顏色 */
		    padding: 10px; /* 內邊距 */
		    margin: 10px; /* 外邊距 */
		    border-radius: 10px; /* 圓角 */
		    float: left; /* 左浮動 */
		    clear: both; /* 清除浮動 */
		    max-width: 200px; /* 最大寬度 */
		}
		
		/* 右邊對話框樣式 */
		.other-message {
		    background-color: white; /* 右邊對話框的背景顏色 */
		    color: black; /* 文字顏色 */
		    padding: 10px; /* 內邊距 */
		    margin: 10px; /* 外邊距 */
		    border-radius: 10px; /* 圓角 */
		    float: right; /* 右浮動 */
		    clear: both; /* 清除浮動 */
		    max-width: 200px; /* 最大寬度 */
}
    </style>
  </head>

  <body>
    <!-- navigation -->
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
            <ul class="navbar-nav mx-auto mb-2 mb-lg-0">
              <li class="nav-item">
                <a class="nav-link" href="index.html">訂單</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="about.html">日曆</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="services.html">收件夾</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="contact.html">聯絡我們</a>
              </li>
              <li class="nav-item dropdown">
                <a
                  class="nav-link dropdown-toggle"
                  href="#"
                  id="navbarDropdown"
                  role="button"
                  data-bs-toggle="dropdown"
                  aria-expanded="false"
                  >選單</a
                >
                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                  <li><a class="dropdown-item" href="blog.html">Blog</a></li>
                  <li>
                    <a class="dropdown-item" href="blog-details.html"
                      >Blog Details</a
                    >
                  </li>
                  <li>
                    <a class="dropdown-item" href="service-details.html"
                      >Service Details</a
                    >
                  </li>
                  <li>
                    <a class="dropdown-item" href="faq.html">FAQ&#39;s</a>
                  </li>
                  <li><a class="dropdown-item" href="legal.html">Legal</a></li>
                  <li>
                    <a class="dropdown-item" href="terms.html"
                      >Terms &amp; Condition</a
                    >
                  </li>
                  <li>
                    <a class="dropdown-item" href="privacy-policy.html"
                      >Privacy &amp; Policy</a
                    >
                  </li>
                </ul>
              </li>
            </ul>
            <div>
              <!-- account btn -->
              <li class="dropdown">
                <a
                  class="p-3 border rounded-pill"
                  href="#"
                  id="navbarDropdown"
                  role="button"
                  data-bs-toggle="dropdown"
                  aria-expanded="false"
                  ><i class="bi w-50 bi-list pe-4" style="font-size: 20px"></i
                  ><img style="width: 50px" src="images/logo.png" alt=""
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
            </div>
          </div>
        </div>
      </nav>
    </header>

    <hr />

    <!-- Chat page -->
    <section class="section pt-1">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-4 border rounded me-3 vh-100 shadow-sm">
            <h3 class="text-center mt-2">訊息</h3>
            <div class="row border rounded m-2 mt-5">
              <div class="col-4">
                <img class="img-fluid m-1" src="images/logo.png" alt="" />
              </div>
              <div class="col-7">
                <h5 onclick="connectAndOpenChat()">Krist</h5>
              </div>
            </div>

            <div class="row border rounded m-2">
              <div class="col-4">
                <img class="img-fluid m-1" src="images/logo.png" alt="" />
              </div>
              <div class="col-7">
                <h5>Krist</h5>
              </div>
            </div>

            <div class="row border rounded m-2">
              <div class="col-4">
                <img class="img-fluid m-1" src="images/logo.png" alt="" />
              </div>
              <div class="col-7">
                <h5>Krist</h5>
              </div>
            </div>
          </div>
          <div class="col-7 border rounded shadow-sm">
          
         
          	<p class="mt-4" id = intoRoom></p>
          	
          	
            <h3 class="mt-4">我：</h3>
            <p>感謝您的訂單</p>
            
             <div id="chatMessages"></div>
            
           
          </div>
           <input class="mt-3" type="text" id="messageInput" placeholder="输入消息">
	  		<button class="btn btn-outline-primary" onclick="sendMessage()">发送消息</button>
	  		
	  	<%-- 	<a href="<c:url value="login"></c:url>" class="btn btn-outline-primary">登 入</a> --%>
        </div>
      </div>
      
      
    </section>
    
    
    <section>
    
    <!-- 	  <div>
       		 <input type="text" id="usernameInput" placeholder="输入用户名" value="DefaultUser">
      	     <button onclick="joinChatRoom()">加入聊天室</button>
    	</div>  -->
    
    </section>
    
    
    <section>
    	   <!--  <button onclick="connectAndOpenChat()">打开聊天</button>
		    <div id="chatMessages"></div>
		    <input type="text" id="messageInput" placeholder="输入消息">
		    <button onclick="sendMessage()">发送消息</button> -->
    </section>

    <!-- # JS Plugins -->
    <!-- <script src="plugins/jquery/jquery.min.js"></script>
    <script src="plugins/bootstrap/bootstrap.min.js"></script>
    <script src="plugins/slick/slick.min.js"></script>
    <script src="plugins/scrollmenu/scrollmenu.min.js"></script> -->
    
    <script>
    
        var stompClient = null;
        var currentUser = 19;

        function connectAndOpenChat() {
            var socket = new SockJS('/pillowSurfing/chat');
            stompClient = Stomp.over(socket);

            
              
            
            stompClient.connect({}, function(frame) {
                console.log('Connected: ' + frame);
                stompClient.subscribe('/topic/chat', function(message) {

                	var sender = JSON.parse(message.body).sender;
                    showMessage(JSON.parse(message.body).content, sender);
                });

                var intoRoom = document.getElementById("intoRoom");
                intoRoom.innerHTML += "歡迎 蔡硯丞 加入聊天室！";
            });
        } 

      /*  function showMessage(message) {
            var chatMessages = document.getElementById('chatMessages');
            
            chatMessages.innerHTML += "<h3 class='mt-4'>我：</h3>" + '<p>' + message + '</p>';
        } */

        function showMessage(message, sender) {
            
            var chatMessages = document.getElementById('chatMessages');
            var messageElement = document.createElement('div');
            
            if (parseInt(sender, 10) == 19) {
                // 如果 sender 與 currentUser 相同，將對話框顯示在右邊
                messageElement.classList.add('my-message'); // 可以自訂 my-message 的樣式
            } else {
                // 否則將對話框顯示在左邊
                messageElement.classList.add('other-message'); // 可以自訂 other-message 的樣式
            }

            messageElement.innerHTML = "<h3 class='mt-4'>" + sender + "：</h3>" + '<p>' + message + '</p>';
            chatMessages.appendChild(messageElement);
            console.log(typeof(sender));
        }

       
     

        function sendMessage() {
            var messageInput = document.getElementById('messageInput');
            var message = messageInput.value;
			
             
           // var currentUser = "乾乾乾";

           /* var userId = parseInt('${userId}', 10); */

            stompClient.send("/app/send-message", {}, JSON.stringify({'sender':${userId}, 'content': message}));
            /* var sender = ${userId}; */
            messageInput.value = ''; // 清空输入框
        } 
    </script>
  </body>
</html>
