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
        </div>
        <div class="chat-navigation">
            <button class="backButton">Layar utama</button>
            <button id="pesanButton">Pesan</button>
            <button>Bantuan</button>
        </div>
    `;
    chatWidget.innerHTML = conversationHistory;

    // Menambahkan event listener untuk tombol "Kembali"
    var backButton = chatWidget.querySelector('.backButton');
    backButton.addEventListener('click', function() {
        // Kembali ke tampilan utama atau hapus konten riwayat percakapan
        chatWidget.innerHTML = '';
        // Alternatif: kembali ke tampilan sebelumnya dengan logika tertentu
        // chatWidget.innerHTML = originalChatContent;
    });

    // Menambahkan event listener untuk tombol "Kirim Pesan"
    var sendMessageButton = chatWidget.querySelector('#pesanButton'); // Memperbarui pemilihan dengan ID yang benar
    sendMessageButton.addEventListener('click', function() {
        // Logika untuk mengirim pesan dari riwayat percakapan
        console.log('Mengirim pesan dari riwayat percakapan...');
    });
});
