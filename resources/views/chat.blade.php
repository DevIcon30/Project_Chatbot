<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chat Widget</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .chat-icon {
            position: fixed;
            bottom: 20px;
            right: 20px;
            background-color: #6c63ff;
            border-radius: 50%;
            width: 60px;
            height: 60px;
            display: flex;
            justify-content: center;
            align-items: center;
            cursor: pointer;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .chat-icon img {
            width: 30px;
            height: 30px;
        }

        .chat-widget {
            background-color: #ffffff;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 300px;
            overflow: hidden;
            display: none; /* Initially hidden */
            flex-direction: column;
            position: fixed;
            bottom: 90px;
            right: 20px;
        }

        .chat-header {
            background-color: #6c63ff;
            color: white;
            padding: 20px;
            text-align: center;
            border-top-left-radius: 15px;
            border-top-right-radius: 15px;
        }

        .chat-header .user-images {
            display: flex;
            justify-content: center;
            margin-bottom: 10px;
        }

        .chat-header .user-images img {
            width: 30px;
            height: 30px;
            border-radius: 50%;
            margin: 0 5px;
            border: 2px solid white;
        }

        .chat-body {
            display: flex;
            padding: 10px;
        }

        .chat-body input {
            flex: 1;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .chat-body button {
            background-color: #6c63ff;
            color: white;
            border: none;
            padding: 10px;
            margin-left: 10px;
            border-radius: 5px;
            cursor: pointer;
        }

        .chat-footer {
            padding: 20px;
            border-top: 1px solid #f0f0f0;
        }

        .chat-footer input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-bottom: 10px;
        }

        .chat-footer ul {
            list-style: none;
            padding: 0;
        }

        .chat-footer ul li {
            padding: 10px;
            border-bottom: 1px solid #f0f0f0;
        }

        .chat-navigation {
            display: flex;
            justify-content: space-around;
            padding: 10px;
            border-top: 1px solid #f0f0f0;
        }

        .chat-navigation button {
            background-color: #ffffff;
            border: none;
            cursor: pointer;
            padding: 10px;
        }

        .chat-navigation button:hover {
            background-color: #f0f0f0;
        }

    </style>
</head>
<body>
    <div class="chat-icon" id="chatIcon">
        <img src="{{asset('icon.png')}}" alt="Chat Icon">
    </div>
    <div class="chat-widget" id="chatWidget">
        <div class="chat-header">
            <!-- <div class="user-images">
                <img src="user1.jpg" alt="User 1">
                <img src="user2.jpg" alt="User 2">
                <img src="user3.jpg" alt="User 3">
            </div> -->
            <h2>Hai 👋</h2>
            <p>Bagaimana kami dapat membantu?</p>
        </div>
        <div class="chat-body">
            <input type="text" placeholder="Kirim kami pesan">
            <button>➔</button>
        </div>
        <div class="chat-footer">
            <input type="text" placeholder="Cari bantuan">
            <ul>
                <li>Bagaimana cara berlangganan produk</li>
                <li>Bagaimana cara melakukan integrasi</li>
            </ul>
        </div>
        <div class="chat-navigation">
            <button>Layar utama</button>
            <button>Pesan</button>
            <button>Bantuan</button>
        </div>
    </div>
</body>
<script>
    document.getElementById('chatIcon').addEventListener('click', function() {
    var chatWidget = document.getElementById('chatWidget');
    if (chatWidget.style.display === 'none' || chatWidget.style.display === '') {
        chatWidget.style.display = 'flex';
    } else {
        chatWidget.style.display = 'none';
    }
});

</script>
</html>
