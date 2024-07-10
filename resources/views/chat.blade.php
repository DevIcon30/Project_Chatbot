<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chat Widget</title>
    <link rel="stylesheet" href="{{asset('widget/style.css')}}">
</head>
<body>
    <div class="chat-icon" id="chatIcon">
        <img src="{{asset('icon.png')}}" alt="Chat Icon">
    </div>
    <div class="chat-widget" id="chatWidget">
        <div class="chat-header">
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
            <button id="pesanButton">Pesan</button>
            <button>Bantuan</button>
        </div>
    </div>
</body>
<script src="{{asset('widget/conf.js')}}"></script>
</html>
