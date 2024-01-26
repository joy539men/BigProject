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
<!--     <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Rubik:wght@400;500;700&display=swap"
      rel="stylesheet"
    />
 -->
    <!-- # CSS Plugins -->
<!--     <link rel="stylesheet" href="plugins/slick/slick.css" />
    <link rel="stylesheet" href="plugins/font-awesome/fontawesome.min.css" />
    <link rel="stylesheet" href="plugins/font-awesome/brands.css" />
    <link rel="stylesheet" href="plugins/font-awesome/solid.css" /> -->

    <!-- # Main Style Sheet -->
   <!--  <link rel="stylesheet" href="css/style.css" /> -->

    <!-- # Bootstrap -->
  <!--   <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css"
    /> -->
    
    <link rel="stylesheet" href="css/main.css" />
    
  </head>

  <body>
    <!-- navigation -->
    <!-- <header class="navigation">
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
              account btn
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

    <hr /> -->

    <!-- Chat page -->
    <!-- <section class="section pt-1">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-4 border rounded me-3 vh-100 shadow-sm">
            <h3 class="text-center mt-2">訊息</h3>
            <div class="row border rounded m-2 mt-5">
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
            <h3 class="mt-4">我：</h3>
            <p>感謝您的訂單</p>
          </div>
        </div>
      </div>
    </section> -->

	<section>
		<div id="chatMessages"></div>
		<input type="text" id="messageInput" placeholder="Enter your message">
		<button onclick="sendMessage()">Send</button>
	</section>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	
	<div id="username-page">
        <div class="username-page-container">
            <h1 class="title">Type your username</h1>
            <form id="usernameForm" name="usernameForm">
                <div class="form-group">
                    <input type="text" id="name" placeholder="Username" autocomplete="off" class="form-control" />
                </div>
                <div class="form-group">
                    <button type="submit" class="accent username-submit">Start Chatting</button>
                </div>
            </form>
        </div>
    </div>

    <div id="chat-page" class="hidden">
        <div class="chat-container">
            <div class="chat-header">
                <h2>Spring WebSocket Chat Demo</h2>
            </div>
            <div class="connecting">
                Connecting...
            </div>
            <ul id="messageArea">

            </ul>
            <form id="messageForm" name="messageForm" nameForm="messageForm">
                <div class="form-group">
                    <div class="input-group clearfix">
                        <input type="text" id="message" placeholder="Type a message..." autocomplete="off" class="form-control"/>
                        <button type="submit" class="primary">Send</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.4/sockjs.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
    <script src="js/main.js"></script>

	<!-- # JS Plugins -->
    <!-- <script src="plugins/jquery/jquery.min.js"></script>
    <script src="plugins/bootstrap/bootstrap.min.js"></script>
    <script src="plugins/slick/slick.min.js"></script>
	<script src="plugins/scrollmenu/scrollmenu.min.js"></script>  -->

    <!-- Main Script -->
<!--     <script src="js/script.js"></script> -->
    
    <h1>WebSocket Example</h1>

<script>
   /*  const socket = new SockJS('pillowSurfing/Krist/ws');
    const stompClient = Stomp.over(socket);

    // 連接到 WebSocket
    stompClient.connect({}, function (frame) {
        console.log('Connected: ' + frame);

        // 訂閱主題
        stompClient.subscribe('/topic/messages', function (message) {
            console.log('Received message: ' + message.body);
            // 在前端處理接收到的訊息，例如將其顯示在畫面上
            const chatMessagesDiv = document.getElementById("chatMessages");
            chatMessagesDiv.innerHTML += "<p>" + message.body + "</p>";
        });
    });

    // 連接打開時的處理邏輯
    socket.onopen = function(event) {
        console.log("WebSocket connection opened");
    };

    // 接收到消息時的處理邏輯
    socket.onmessage = function(event) {
        console.log("Received message: " + event.data);
        // 在前端處理接收到的訊息，例如將其顯示在畫面上
        const chatMessagesDiv = document.getElementById("chatMessages");
        chatMessagesDiv.innerHTML += "<p>" + event.data + "</p>";
    };

    // 連接關閉時的處理邏輯
    socket.onclose = function(event) {
        console.log("WebSocket connection closed");
    };

    function sendMessage() {
        const messageInput = document.getElementById("messageInput");
        const message = messageInput.value;

        // 發送消息到後端
        stompClient.send("/app/sendMessage", {}, JSON.stringify({ content: message }));

        // 清空輸入框
        messageInput.value = "";
    } */
</script>
  </body>
</html>
