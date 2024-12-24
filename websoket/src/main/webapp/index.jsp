<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chat</title>
</head>
<body>
    <h1>WebSocket Chat</h1>
    <div>
        <textarea id="messages" rows="10" cols="50" readonly></textarea><br>
        <input type="text" id="messageInput" placeholder="Enter your message">
        <button onclick="sendMessage()">Send</button>
    </div>
    <script>
        let socket = new WebSocket("ws://192.168.1.8:8080/game/chat");
        let socket1 = new WebSocket("ws://localhost:8080/game/chat");
        socket1.onmessage = function(event) {
            const messages1 = document.getElementById("messages");
            messages1.value += event.data + "\n";
        };

        function sendMessage() {
            const input1 = document.getElementById("messageInput");
            const message1 = input1.value;
            socket1.send(message1);
            input1.value = "";
        }
        
        
        
        
        socket.onmessage = function(event) {
            const messages = document.getElementById("messages");
            messages.value += event.data + "\n";
        };

        function sendMessage() {
            const input = document.getElementById("messageInput");
            const message = input.value;
            socket.send(message);
            input.value = "";
        }
    </script>
</body>
</html>
