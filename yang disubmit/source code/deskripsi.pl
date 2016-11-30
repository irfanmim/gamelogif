
/*Deskripsi dari setiap tempat, tergantung dari kondisinya */

/*MULAI*/
/*
	write('Selamat datang di Kota Tubagus! Kota yang penuh dengan keceriaan dan'), nl,
	write('kebahagiaan! Kamu adalah seorang polisi yang mengabdi pada masyarakat'), nl,
	write('Tubagus. Tugasmu ialah memberantas kejahatan dan melayani masyarakat.'), nl,
	write('Kamu memiliki cita-cita untuk menjadi seorang Kapolri yang hebat. Untuk'), nl,
	write('itu kamu perlu untuk meningkatkan reputasimu dengan menjalankan tugas-tugas'), nl,
	write('dari Bos Kapolri saat ini. Berjuanglah untuk cita-citamu!'), nl.
*/

deskripsi(ruang_kenaikan_pangkat) :-
	ada_di(X, di_tas), memberchk(lencana,X),
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


deskripsi(markas_copet_pasar) :-
	tertangkap(copet), !,
	write('Tempat ini dulunya merupakan tempat persembunyian para copet pasar. Tapi sekarang copet tersebut telah'), nl,
	write('tiada dan tempat ini menjadi tidak terpakai. Di utara ada Jalan In Aja, di sebelah barat ada Jalan Kesepian,'),nl,
	write('dan di sebelah selatan ada Pasar.'), nl.

deskripsi(markas_copet_pasar) :-
	write('Oh bukan suatu hal baik. Kau mengejar copet tersebut hingga ke tempat persembunyiannya! Sekarang'), nl,
	write('kau berhadapan dengan 2 orang copet dan mereka menggunakan senjata tajam! Ini berbahaya, lawan mereka'), nl,
	write('sekarang dan tangkap mereka!'), nl.

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
	at(senter, in_hand), !,
	write('Setelah menyalakan sentermu kamu melihat sekelompok orang sedang melakukan'), nl,
	write('sebuah ritual. Sialnya, mereka mengetahui keberadaanmu! Tapi, apakah mereka'), nl,
	write('orang baik atau jahat? Bicaralah pada seseorang dari mereka yang bernama Yalchi.'), nl,
	write('Di sebelah timur ada Kolong Jembatan.'), nl.

deskripsi(markas_teroris) :-
	write('Kenapa kamu tidak menyalakan senter?! Kami sudah mengingatkanmu!'), nl,
	write('Sekarang orang-orang tiba2 mengelilingimu, tetapi kamu tidak dapat'), nl,
	write('melihatnya. Perlahan mereka mendekatimu, semakin dekat, semakin dekat...'), nl,
	write('CRASSSSSS!! Darahmu bertebaran! CRASSSSSS! Lagi! CRASSSSSS! '), nl,
	mati.

deskripsi(perempatan_kuy) :-
	write('Perempatan paling ramai di kota. Pusat dari segala aktivitas.'), nl,
	write('Bekerja disini mungkin melelahkan, tapi upah yang didapat pun'), nl,
	write('banyak. Di sebelah barat ada Kebun Binatang, di sebelah utara'), nl,
	write('ada Badan Resor Kriminal, di sebelah timur ada Jalan Kesepian'), nl,
	write(', dan di sebelah selatan ada Gang Depan. Oh ternyata rumahmu'), nl,
	write('ada di sebelah selatan dari dekat sini!'), nl.

deskripsi(kebun_binatang) :-
	jinak(beruang), !,
	write('Suasana di kebun binatan sudah kondusif sekarang, setiap orang'), nl,
	write('senang rekreasi disini. Tidak ada lagi beruang yang mengamuk. Ini'), nl,
	write('semua karena jasamu!. Di sebelah barat ada Kandang Beruang, dan di'), nl,
	write('sebelah timur ada Perempatan Kuy.'), nl.

deskripsi(kebun_binatang) :-
	write('Tempat rekreasi masyarakat kota. Tetapi sepertinya orang-orang'), nl,
	write('tidak terlihat senang disini, apa yang terjadi? Mungkin kamu'), nl,
	write('bisa bertanya pada zookeeper di pos sebelah sana. Di sebelah'), nl,
	write('timur ada Perempatan Kuy.'), nl.

deskripsi(kandang_beruang) :-
	jinak(beruang), !,
	write('Terlihat beruang yang sangat unyu sedang makan. Pengunjung sangat'), nl,
	write('senang melihatnya. Di sebelah timur ada Kebun Binatang.'), nl.

deskripsi(kandang_beruang) :-
	write('GROAAAAA! Seekor beruang sedang mengamuk dan menakuti pengunjung!'), nl,
	write('Ayo lakukan sesuatu sebelum situasi semakin buruk!'), nl.

deskripsi(gang_depan) :-
	tertangkap(preman), !,
	write('Terlihat anak-anak sedang bermain dengan senangnya. Keresahan mereka'), nl,
	write('telah hilang seiring tertangkapnya preman gang. Ini semua karena mu!'), nl,
	write('Warga disini amat bangga punya anggota sepertimu. Di sebelah selatan ada'), nl,
	write('Rumah, dan di sebelah utara ada Perempatan Kuy.'), nl.

deskripsi(gang_depan) :-
	write('Ketika sampai di gang depan, kamu melihat suasana sepi yang aneh.'), nl,
	write('Orang-orang bersembunyi dibalik pintu rumahnya masing-masing. Tetapi'), nl,
	write('kamu bisa merasakan bahwa mereka mengintip kedatangan mu dari kedalaman.'), nl,
	write('Bertanyalah pada warga! Di sebelah selatan ada Rumah, di sebelah Utara'), nl,
	write('Perempatan Kuy.'), nl.

deskripsi(markas_preman) :-
	tertangkap(preman), !,
	write('Setelah preman tertangkap, tempat ini menjadi tempat nongkrong warga.'), nl,
	write('Di salah satu sudut terpampang foto mu yang sangat heroik sebagai bentuk'),nl,
	write('apresiasi warga terhadap mu. Di sebelah timur ada Gang Depan.'), nl.

deskripsi(markas_preman) :-
	write('Ketika kamu sampai, mereka langsung melihatmu dan lari! Jangan diam saja!'), nl,
	write('Cepat kejar mereka dan gunakan peralatan mu!'), nl.

deskripsi(rumah) :-
	write('Selamat datang di Rumah! Disini ada banyak barang yang bisa kamu gunakan'), nl,
	write('mulai dari seragam polisi, baju santai, pisau, clurit, dompet, hingga bunga.'), nl,
	write('Disini kamu bisa beristirahat untuk mengisi energi mu yang terkuras setelah'), nl,
	write('bekerja dan memberantas kejahatan. Disini pun ada Satpam yang menjaga keamanan'), nl,
	write('rumah mu. Sesekali berbicaralah padanya, mungkin ada informasi yang bisa kamu'), nl,
	write('dapatkan. Di sebelah utara ada Gang Depan.'), nl.

deskripsi(kuburan_hitler) :-
	mati(zombie_hitler), !,
	write('Wuh, sekarang Hitler sudah tenang di alam Akhirat sana. Tidak ada yang perlu'), nl,
	write('ditakutkan lagi. Tempat ini sudah berubah menjadi sebuah taman yang indah. Di'), nl,
	write('sebelah utara ada Rumah.'), nl.

deskripsi(kuburan_hitler) :-
	write('GHROAAAAA! Tiba-tiba muncul sesosok yang tidak asing dari bawah tanah! Ia'), nl,
	write('merangkak keluar! Itu adalah HITLER! Bagaimana mungkin?! Ia sudah mati'), nl,
	write('bertahun-tahun lalu! Tidak ada waktu lagi, gunakan seluruh barang yang'), nl,
	write('kau punya. Bahkan jika itu sebuah Bazooka, gunakanlah!'), nl.

deskripsi(bareskrim) :-
	mati(hitler),
	tertangkap(mafia), !,
	write('Sudah tidak ada lagi informasi kejahatan di mading. Mungkin kota sudah aman (?)'), nl,
	write('Di sebelah utara ada Pasar Gelap, dan di sebelah selatan ada Perempatan Kuy'), nl.

deskripsi(bareskrim) :-
	tertangkap(mafia), !,
	write('Mafia sudah tertangkap, tetapi kamu melihat ada sebuah info lagi di mading'), nl,
	write('"WANTED: HITLER ZOMBIE, Mayat hidup dari tokoh Adolf Hitler". Sepertinya ini'), nl,
	write('tidak masuk akal. Apakah zombie benar-benar ada?. Di sebelah utara ada Pasar Gelap,'), nl,
	write('dan di sebelah selatan ada Perempatan Kuy.'), nl.

deskripsi(bareskrim) :-
	write('Tempat ini adalah tempat pengumpulan data mengenai krimalitas di kota.'), nl,
	write('Kamu melihat ke mading yang ada di pojok ruangan "WANTED: Woo Chin-Whoo,'), nl,
	write('Buronan Sindikat Mafia penguasa Pasar Gelap.". Sepertinya ini hal yang'), nl,
	write('menarik. Pasar Gelap ada di sebelah utara. Di sebelah selatan ada Perempatan Kuy.'), nl.

deskripsi(pasar_gelap) :-
	tertangkap(mafia), !,
	write('Setelah mafia tertangkap, tempat ini menjadi sebuah pasar baru. Seorang pengusaha'), nl,
	write('menjadikannya sebuah mal kecil tempat perbelanjaan masyarakat. Tempat ini membaik,'), nl,
	write('setelah kamu berhasil menangkap sindikat mafia. Berbahagialah! Di sebelah barat ada'), nl,
	write('Bar markas mafia, di sebelah selatan ada Bareskrim.'), nl.

deskripsi(pasar_gelap) :-
	write('Kamu tidak pernah membayangkan apa yang ada disini. Senjata, narkoba, bahkan'), nl,
	write('wanita dan anak-anak dijual disini. Semua ini akibat dari perbuatan sindikat mafia.'), nl,
	write('Kamu harus segera menangkapnya. Terlihat di sebelah barat ada sebuah bar, banyak'), nl,
	write('orang berkumpul disana. Tidak ada salahnya kamu kesana, tapi sebaiknya persiapkan'), nl,
	write('dirimu. Di sebelah selatan ada Bareskrim.'), nl.

deskripsi(markas_mafia) :-
	tertangkap(mafia), !,
	write('Sindikat mafia sudah tertangkap. Tempat ini menjadi sebuah cafe baru di sebelah mal.'), nl,
	write('Di sebelah timur ada Mal Kecil (dulunya pasar gelap).'), nl.

deskripsi(markas_mafia) :-
	write('Setelah mendekat, mereka langsung mencurigaimu. Mereka menanyai identitas mu,'), nl,
	write('sayangnya kamu tidak punya identitas selain identitasmu sebagi polisi, dan mereka'), nl,
	write('sudah mengetahuinya! Mereka langsung mengepungmu! Sigaplah! Gunakan senjatamu atau'), nl,
	write('kau akan mati di tangan mereka! Tidak ada waktu lagi!'), nl.