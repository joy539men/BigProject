<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>WebSocket Example</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.1/sockjs.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
</head>
<body>

<h1>WebSocket Example</h1>

<script>
    const socket = new SockJS('/pillowSurfing/ws');
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
    }
</script>

<div id="chatMessages"></div>
<input type="text" id="messageInput" placeholder="Enter your message">
<button onclick="sendMessage()">Send</button>

</body>
</html>
