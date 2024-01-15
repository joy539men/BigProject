<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>WebSocket Example</title>
</head>
<body>
    <div>
        <input type="text" id="messageInput" placeholder="Enter your message">
        <button onclick="sendMessage()">Send Message</button>
    </div>
    <div id="messageArea"></div>

    <script>
        const socket = new WebSocket('ws://localhost:8080/pillowSurfing/my-websocket-endpoint');

        // Connection opened
        socket.addEventListener('open', (event) => {
            console.log('WebSocket connection opened!');
        });

        // Listen for messages
        socket.addEventListener('message', (event) => {
            const messageArea = document.getElementById('messageArea');
            messageArea.innerHTML += '<p>' + event.data + '</p>';
        });

        // Function to send a message
        function sendMessage() {
            const messageInput = document.getElementById('messageInput');
            const message = messageInput.value;
            if (message.trim() !== '') {
                socket.send(message);
                messageInput.value = '';
            }
        }
    </script>
</body>
</html>
