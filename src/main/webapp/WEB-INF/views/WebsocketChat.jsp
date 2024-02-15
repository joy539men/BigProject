<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>WebSocket Chat</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.0/sockjs.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
</head>
<body>
    <button onclick="connectAndOpenChat()">打开聊天</button>
    <div id="chatMessages"></div>
    <input type="text" id="messageInput" placeholder="输入消息">
    <button onclick="sendMessage()">发送消息</button>

    <script>
        var stompClient = null;

        function connectAndOpenChat() {
            var socket = new SockJS('/pillowSurfing/chat');
            stompClient = Stomp.over(socket);
            stompClient.connect({}, function(frame) {
                console.log('Connected: ' + frame);
                stompClient.subscribe('/topic/chat', function(message) {
                    showMessage(JSON.parse(message.body).content);
                });
            });
        }

        function showMessage(message) {
            var chatMessages = document.getElementById('chatMessages');
            chatMessages.innerHTML += '<p>' + message + '</p>';
        }

        function sendMessage() {
            var messageInput = document.getElementById('messageInput');
            var message = messageInput.value;
            stompClient.send("/app/send-message", {}, JSON.stringify({'content': message}));
            messageInput.value = ''; // 清空输入框
        }
    </script>
</body>
</html>

    