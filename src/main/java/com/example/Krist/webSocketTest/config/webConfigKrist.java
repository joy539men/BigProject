//package com.example.Krist.webSocketTest.config;
//
//import org.springframework.context.annotation.Configuration;
//import org.springframework.messaging.simp.config.MessageBrokerRegistry;
//import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
//import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
//import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;
//
//@Configuration
//@EnableWebSocketMessageBroker
//public class webConfigKrist implements WebSocketMessageBrokerConfigurer {
//
//    @Override
//    public void registerStompEndpoints(StompEndpointRegistry registry) {
//    	
//    	// 此地方必須和前端互相對應
//        registry.addEndpoint("pillowSurfing/Krist/ws").withSockJS();
//    }
//
//    @Override
//    public void configureMessageBroker(MessageBrokerRegistry registry) {
//    	
//    	// 代表前綴詞，這條消息將被傳遞到控制器中使用@MessageMapping("/chat.sendMessage")進行處理。
//        registry.setApplicationDestinationPrefixes("/app");
//        
//        // 將使用/topic前綴。例如，如果應用程式向/topic/messages發送消息，所有訂閱了/topic/messages的客戶端都將收到這條消息。
//        registry.enableSimpleBroker("/topic");   // Enables a simple in-memory broker
//
//
//        //   Use this for enabling a Full featured broker like RabbitMQ
//
//        /*
//        registry.enableStompBrokerRelay("/topic")
//                .setRelayHost("localhost")
//                .setRelayPort(61613)
//                .setClientLogin("guest")
//                .setClientPasscode("guest");
//        */
//    }
//}
//
