/*Deskripsi dari setiap tempat, tergantung dari kondisinya */

deskripsi(ruang_kenaikan_pangkat) :-
	at(lencana, in_hand),
	write('Hari ini adalah harimu! Seluruh negara menjadi saksi atas kehebatanmu.'), nl,
	write('Lencana Kapolri telah tertempel di bahumu. Tetapi, ini adalah awal yang baru.'), nl,
	write('Musuh akan terus ada, dan semua itu menjadi tantanganmu.'), nl,
	write('Selamat atas gelar barumu, Bapak Kapolri!'), nl,
	finish.

deskripsi(mabes_polri) :-
	write('Saat ini kamu ada di markas besar polisi. Jangan pernah'), nl,
	write('lupakan cita-citamu untuk menjadi seorang Kapolri yang hebat!'), nl,
	write('Di utara ada Ruang Kapolri, di sebelah timur ada Jalan in Aja,'), nl,
	write('dan di sebelah selatan ada Jalan Kesepian. Ingat, masyarakat'), nl,
	write('amat membutuhkan bantuanmu!'), nl.

deskripsi(ruang_kapolri) :-
	write('Jaga perilakumu di depan Bapak Kapolri! Bicaralah padanya, banyak'), nl,
	write('informasi yang bisa kamu dapatkan darinya, terutama untuk menggapai cita-citamu'), nl,
	write('menjadi seorang Kapolri! Di sebelah timur ada Kantin Kapolri, di sebelah selatan'), nl,
	write('ada Markas Besar Polri, di sebelah barat ada Gudang Senjata, dan di sebelah utara'), nl,
	write('ada Ruang Kenaikan Pangkat, ruangan yang tidak bisa kamu masuki kecuali dengan'), nl,
	write('syarat-syarat tertentu!'), nl.

deskripsi(kantin_kapolri) :-
	write('Isi energi mu dengan menyantap berbagai makanan dan minuman disini. Di sebelah'), nl,
	write('barat ada Ruang Kapolri. Ingat, kamu perlu uang untuk membeli makanan disini.'), nl.

deskripsi(gudang_senjata) :-
	write('Melawan penjahat tidak cukup dengan tangan kosong, maka lengkapi senjatamu disini!'), nl,
	write('Ada Granat, Rifle, Shotgun, Handgun, Gas Air Mata, dan Bazooka'), nl,
	write('Tetapi ingat, senjata ini tidak gratis, jadi bawa uangmu! Di sebelah timur ada'), nl,
	write('Ruang Kapolri'), nl.

deskripsi(jalan_in_aja) :-
	write('Jalan penuh keterpaksaan, jalanin aja. Tidak terlalu besar, tetapi cukup berbahaya'), nl,
	write('terutama malam hari, mengingat saat ini banyak begal berkeliaran. Kamu bisa bekerja'), nl,
	write('disini, tidak begitu melelahkan meskipun upahnya tidak besar. Di sebelah barat ada'), nl,
	write('Markas Besar Polri. Hmm, seperti ada sesuatu di dekat sini.'), nl.

deskripsi(jalan_kesepian) :-
	write('Sepi sekali jalan ini. Oh mungkin karena bukan waktunya, jalan ini dekat dengan pasar'), nl,
	write('sehingga ramainya di pagi hari. Kamu bisa bekerja disini, masyarakat butuh seseorang'), nl,
	write('untuk mengatur arus transportasi disini. Di sebelah selatan ada Kantor Pasar, di sebelah'), nl,
	write('barat ada Perempatan Kuy, dan di sebelah utara ada Markas Besar Polri. Hm, kok rasanya'), nl,
	write('mirip di Jalan In Aja ya'), nl.

deskripsi(kantor_pasar) :-
	tertangkap(copet), !,
	write('Bapak Kepala Pasar sangat bangga padamu yang berhasil menangkap copet yang meresahkan pasar'), nl,
	write('Sekali lagi, selamat! Di sebelah utara ada Jalan Kesepian, dan di sebelah timur ada Pasar.'), nl.

deskripsi(kantor_pasar) :-
	write('Wah kantornya tidak cukup besar. Disini ada Bapak Kepala Pasar yang bisa kamu ajak bicara'), nl,
	write('mengenai keadaan pasar. Banyak isu beredar bahwa pasar saat ini tidak aman, ada banyak copet'), nl,
	write('dan jambret disana. Mungkin kamu bisa membantu membasmi itu semua. Di sebelah utara ada'), nl,
	write('Jalan Kesepian, dan di sebelah timur ada Pasar.'), nl.

deskripsi(pasar) :-
	tertangkap(copet), !,
	write('Suasana di pasar sangat ramai. Semua orang berbelanja dengan tenang sekarang. Tidak ada lagi'), nl,
	write('yang perlu dikhawatirkan karena sang copet beserta antek-anteknya sudah tertangkap! Ini semua'), nl,
	write('karena jasamu, dan lihatlah semua orang di pasar menghormatimu! Di sebelah utara ada Markas Copet,'), nl,
	write('di sebelah timur ada Warung Tegal, di sebelah selatan ada Kolong Jembatan, dan di sebelah barat ada'), nl,
	write('Kantor Pasar.'), nl.

deskripsi(pasar) :-
	write('HUAAAAAAAAAAAA! Terdengar suara teriakan seorang perempuan dari sebelah utara pasar! Seketika situasi'), nl,
	write('di pasar menjadi tidak terkendali! Kamu melihat seorang pencopet sedang berlari setelah mengambil tas'), nl,
	write('dari perempuan yang berteriak tadi ke arah utara! Tunggu apa lagi?! Cepat kejar dia!'), nl.

deskripsi(warteg) :-
	write('Isi energi mu dengan menyantap berbagai makanan dan minuman disini. Di sebelah barat ada Pasar'), nl.

deskripsi(kolong_jembatan) :-
	tertangkap(teroris), !,
	write('Sudah tak ada kehidupan disini sejak komplotan teroris tertangkap.'), nl,
	write('Di sebelah utara ada Pasar, dan di sebelah barat ada Markas Teroris.'), nl,
	write(''), nl.

deskripsi(kolong_jembatan) :-
	write('Tempat ini asing sekali. Kamu melihat banyak orang asing dan imigran disini. Aneh sekali.'), nl,
	write('Kamu melihat sebuah senter di pojok sini. Di sebelah barat terlihat sebuah komplotan.'), nl,
	write('Siapa mereka? Berhati-hatilah dan gunakan sentermu, disana gelap. Di sebelah utara ada Pasar.'), nl.

deskripsi(markas_teroris) :-
	tertangkap(teroris), !,
	write('Teroris telah tertangkap. Semua rekan-rekan jahatnya sudah diamankan juga. Tempat ini'), nl,
	write('menjadi kosong sekarang. Di sebelah timur ada Kolong Jembatan.'), nl.

deskripsi(markas_teroris) :-
	at(senter, in_hand),
	write('Setelah menyalakan sentermu kamu melihat sekelompok orang sedang melakukan'), nl,
	write('sebuah ritual. Sialnya, mereka mengetahui keberadaanmu! Tapi, apakah mereka'), nl,
	write('orang baik atau jahat? Bicaralah pada seseorang dari mereka yang bernama Teroris.'), nl,
	write('Di sebelah timur ada Kolong Jembatan.'), nl.

deskripsi(markas_teroris) :-
	write('Kenapa kamu tidak menyalakan senter?! Kami sudah mengingatkanmu!'), nl,
	write('Sekarang orang-orang tiba2 mengelilingimu, tetapi kamu tidak dapat'), nl,
	write('melihatnya. Perlahan mereka mendekatimu, semakin dekat, semakin dekat...'), nl,
	write('CRASSSSSS!! Darahmu bertebaran! CRASSSSSS! Lagi! CRASSSSSS! '), nl,
	mati.


