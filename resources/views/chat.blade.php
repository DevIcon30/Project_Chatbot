<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chat Widget</title>
    <link rel="stylesheet" href="./chat.css">
    <link rel="stylesheet" href="{{asset('widget/style.css')}}">
</head>
<body>
    <!-- <div class="chat-icon" id="chatIcon">
        <div class="img-icon">
            <img src="{{asset('widget/comment.png')}}" alt="Chat Icon">
        </div>
    </div>
    <div class="chat-widget" id="chatWidget">
        <div class="chat-header">
            <div class="">
                <h2>Hai 👋</h2>
                <p>Bagaimana kami dapat membantu?</p>
            </div>
        </div>
        <div class="chat-body">
            <input type="text" placeholder="Kirim kami pesan" class="input">
            <button><img src="{{asset('widget/send.png')}}" alt="" class="icon"></button>
        </div>
        <div class="chat-body">
            <input type="text" placeholder="Cari bantuan" class="input">
            <button><img src="{{asset('widget/search.png')}}" alt="search" class="icon"></button>
        </div>
        <div>
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
    </div> -->

    <!-- Live Helper Chat integration -->
    <script type="text/javascript">
        var LHCChatOptions = {};
        LHCChatOptions.opt = {widget_height:340,widget_width:300,popup_height:520,popup_width:500};
        (function() {
        var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
        var referrer = (document.referrer) ? encodeURIComponent(document.referrer.substr(document.referrer.indexOf('://')+1)) : '';
        var location  = (document.location) ? encodeURIComponent(window.location.href.substring(window.location.protocol.length)) : '';
        po.src = '//localhost:8000/index.php/chat/getstatus/(click)/internal/(position)/bottom_right/(ma)/br/(top)/350/(units)/pixels/(leaveamessage)/true/(department)/2?r='+referrer+'&l='+location;
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
        })();
        </script>

    <!-- <script>
        document.getElementById('chatIcon').addEventListener('click', function() {
            var chatWidget = document.getElementById('chatWidget');
            if (chatWidget.classList.contains('show')) {
                chatWidget.classList.remove('show');
            } else {
                chatWidget.classList.add('show');
            }
        });

        document.getElementById('pesanButton').addEventListener('click', function() {
            var chatWidget = document.getElementById('chatWidget');
            var conversationHistory = `
                <div class="chat-header">
                    <h2>Pesan</h2>
                </div>
                <div class="chat-body">
                    <div class="note-list">
                        <div class="note-item">
                            <div class="note-content">
                                <span>Emily • 11j lalu</span>
                                <p>Siap, silakan Kak</p>
                            </div>
                        </div>
                        <div class="note-item">
                            <div class="note-content">
                                <span>Aisha • 28p lalu</span>
                                <p>Nilai percakapan Anda</p>
                            </div>
                        </div>
                        <div class="note-item">
                            <div class="note-content">
                                <span>Ray • 40p lalu</span>
                                <p>Nilai percakapan Anda</p>
                            </div>
                        </div>
                        <div class="note-item">
                            <div class="note-content">
                                <span>Keysa • 41p lalu</span>
                                <p>Nilai percakapan Anda</p>
                            </div>
                        </div>
                        <div class="note-item">
                            <div class="note-content">
                                <span>Sasvia • 41p lalu</span>
                                <p>Nilai percakapan Anda</p>
                            </div>
                        </div>
                    </div>
                    <div class="chat-navigation">
                        <button>Layar utama</button>
                        <button id="pesanButton">Pesan</button>
                        <button>Bantuan</button>
                    </div>
                </div>
            `;
            chatWidget.innerHTML = conversationHistory;
        });
    </script> -->
</body>
</html>
