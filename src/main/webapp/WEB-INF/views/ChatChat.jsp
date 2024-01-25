<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Send Message</title>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>

<button onclick="sendMessage()">Send Message</button>

<script>
function sendMessage() {
    var roomId = 55;
    var messageContent = "Hello, this is a test message.";

    var messageData = {
        // 构造你的消息数据
        // 例如：roomId, messageContent等
    		key1: 'value1',
    	    key2: 'value2'
    };

    $.ajax({
        type: "POST",
        contentType: "application/json",
        url: "/pillowSurfing/send/" + roomId,
        data: JSON.stringify(messageData),
        success: function(response) {
            console.log(response);

            // 如果消息发送成功，跳转到聊天页面
            window.location.href = "/pillowSurfing/chat";  // 根据实际聊天页面路径进行调整
        },
        error: function(error) {
            console.error(error);
            // 处理错误的情况
        }
    });
}
</script>

</body>
</html>
