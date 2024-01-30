package com.example.Krist.webSocketTest.Utils;

public class UserRoomContextHolder {
	private static final ThreadLocal<Integer> userIdContext = new ThreadLocal<>();
    private static final ThreadLocal<Integer> roomIdContext = new ThreadLocal<>();

    public static void setUserId(Integer userId) {
        userIdContext.set(userId);
    }

    public static Integer getUserId() {
        return userIdContext.get();
    }

    public static void setRoomId(Integer roomId) {
        roomIdContext.set(roomId);
    }

    public static Integer getRoomId() {
        return roomIdContext.get();
    }

    public static void clear() {
        userIdContext.remove();
        roomIdContext.remove();
    }
}
