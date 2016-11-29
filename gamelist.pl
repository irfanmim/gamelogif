/*FACT JALAN JALAN */  
	
:- dynamic(aku_di/1).
:- dynamic(uang/1).
:- dynamic(energi/1).
:- dynamic(ada_orang_di/2).
:- dynamic(tertangkap/1).
:- dynamic(misi/2).
:- dynamic(ada_di/2).
:- dynamic(pakai/1).
:- retractall(ada_di(_, _)), retractall(aku_di(_)), retractall(alive(_)), retractall(uang(_)), retractall(energi(_)), retractall(ada_orang_di(_,_)), retractall(tertangkap(_)), retractall(misi(_,_)).
	
jalan(mabes_polri,n,ruang_kapolri).
jalan(mabes_polri,e,jalan_in_aja).
jalan(mabes_polri,s,jalan_kesepian).
	
jalan(ruang_kapolri,s,mabes_polri).
jalan(ruang_kapolri,w,gudang_senjata).
jalan(ruang_kapolri,n,ruang_kenaikan_pangkat).
jalan(ruang_kapolri,e,kantin_kapolri).
	
jalan(jalan_in_aja,s,markas_copet_pasar).
jalan(jalan_in_aja,w,mabes_polri).
	
jalan(ruang_kenaikan_pangkat,s,ruang_kapolri).
	
jalan(gudang_senjata,e,ruang_kapolri).
	
jalan(kantin_kapolri,w,ruang_kapolri).
	
jalan(markas_copet_pasar,w,jalan_kesepian).
jalan(markas_copet_pasar,n,jalan_in_aja).
jalan(markas_copet_pasar,s,pasar).
	
jalan(jalan_kesepian,w,perempatan_kuy).
jalan(jalan_kesepian,n,mabes_polri).
jalan(jalan_kesepian,s,kantor_pasar).
jalan(jalan_kesepian,e,markas_copet_pasar).
	
jalan(pasar,n,markas_copet_pasar).
jalan(pasar,e,warteg).
jalan(pasar,w,kantor_pasar).
jalan(pasar,s,kolong_jembatan).
	
jalan(kolong_jembatan,n,pasar).
jalan(kolong_jembatan,w,markas_teroris).
	
jalan(warteg,w,pasar).
	
jalan(kantor_pasar,e,pasar).
jalan(kantor_pasar,n,jalan_kesepian).
	
jalan(markas_teroris,e,kolong_jembatan).
	
jalan(perempatan_kuy,e,jalan_kesepian).
jalan(perempatan_kuy,n,bareskrim).
jalan(perempatan_kuy,w,kebun_binatang).
jalan(perempatan_kuy,s,gang_depan).
	
jalan(bareskrim,s,perempatan_kuy).
jalan(bareskrim,n,pasar_gelap).

jalan(pasar_gelap,s,bareskrim).
jalan(pasar_gelap,w,markas_mafia).
	
jalan(markas_mafia,e,pasar_gelap).
	
jalan(gang_depan,n,perempatan_kuy).
jalan(gang_depan,w,markas_preman).
jalan(gang_depan,s,rumah).
	
jalan(rumah,n,gang_depan).
jalan(rumah,s,kuburan_hitler).
	
jalan(markas_preman,e,gang_depan).
	
jalan(kuburan_hitler,n,rumah).
	
jalan(kebun_binatang,e,perempatan_kuy).
jalan(kebun_binatang,w,kandang_beruang).
	
jalan(kandang_beruang,e,kebun_binatang).

aku_di(mabes_polri).
uang(100000).
energi(100).

ada_orang_di(bos,ruang_kapolri).
ada_orang_di(copet,markas_copet_pasar).
ada_orang_di(pegawai,kantor_pasar).
ada_orang_di(pedagang,pasar).
ada_orang_di(zookeeper,kebun_binatang).
ada_orang_di(ibu_warteg,warteg).

ada_di([],di_tas).
ada_di([rifle,bazoka],gudang_senjata).
ada_di([nasi_padang,tahu_sumedang],warteg).
ada_di([borgol,samurai,pisau],rumah).

misi([tangkap_copet,lawan_teroris,lawan_mafia,bunuh_hitler,jinakkan_beruang,lawan_preman],belom).
misi([],complete).

n :-pergi(n).

s :-pergi(s).

e :-pergi(e).

w :-pergi(w).

u :-pergi(u).

d :-pergi(d).

/* This rule tells how to move in a given direction. */

dimana :-
		aku_di(Here),
		write(Here),nl,
		deskripsi(Here).

pergi(Direction) :-
        aku_di(Here),
        jalan(Here,Direction,There),
        write('Aku di '),
		write(There),nl,!,
        retract(aku_di(Here)),
        asserta(aku_di(There)),
        nl.

pergi(_) :-
        write('Disana tidak ada jalan.'),nl.
	
tidur :- 
	aku_di(rumah),
	!,
	energi(X),
	retract(energi(X)),
	Y is 100,
	asserta(energi(Y)),
	write('Energi kamu sudah penuh kembali.'),nl.

tidur :- 
	write('Kamu tidak bisa tidur disini.'),nl.

/*ENERGI*/
cekenergi :-
	energi(X),
	write('Energi kamu '),write(X),write('%.'),nl. 

energiminimal(Min) :- 
	energi(X),
	X > Min.

/*KERJA*/
kerja :-
	aku_di(jalan_in_aja),
	energiminimal(50),!,	
	uang(X),
	Y is X + 50000,
	retract(uang(X)),
	asserta(uang(Y)),
	energi(A),
	B is A - 50,
	retract(energi(A)),
	asserta(energi(B)),
	write('Selamat kamu dapat 50.000'),nl,
	write('uang kamu sekarang '),
	write(Y),nl.

kerja :-
	aku_di(jalan_in_aja),!,
	write('Energi kamu ga cukup'),nl.

kerja :-
	aku_di(perempatan_kuy),
	energiminimal(50),!,
	uang(X),
	Y is X + 50000,
	retract(uang(X)),
	asserta(uang(Y)),
	energi(A),
	B is A - 50,
	retract(energi(A)),
	asserta(energi(B)),
	write('Selamat kamu dapat 50.000'),nl,
	write('uang kamu sekarang '),
	write(Y),nl.

kerja :-
	aku_di(perempatan_kuy),!,
	write('Energi kamu ga cukup'),nl.

kerja :- 
	write('Kamu ga bisa kerja di sini.'),nl,
	/*write('Ga ada lowongan kerja di sini'),nl,*/
	write('Kamu kira ini dimana ?!'),nl.

/*CEK UANG*/
cekdompet :- 
	uang(X),
	write('uang kamu sekarang '),
	write(X),nl.

/*NGOMONG*/

talk(bos) :-
	aku_di(ruang_kapolri),
	misi(X,complete),misi(X,onprogres),!,
	energi(A),
	B is A - 65,
	retract(energi(A)),
	asserta(energi(B)),
	write('selamat kamu berhasil menjalankan misi '),write(X),nl,
	retract(misi(X,onprogres)).

talk(bos) :-
	aku_di(ruang_kapolri),
	write('Bos : Ada beberapa misi yang dapat kamu ambil. silahkan pilih.'),nl,!,
	tampilkanmisi,!,
	read(Misi),
	(Misi = 'no' -> write('ok!'), nl ; 
		(energiminimal(65) -> ambilmisi(Misi) ; 
			write('Energi mu tidak cukup untuk menjalankan misi.'),nl))
	.

talk(Person) :-
	aku_di(Here),
	write('Tidak ada '),write(Person),write(' di '),write(Here),nl,!.

talk(pegawai) :-
	aku_di(kantor_pasar),
	misi(tangkap_copet,onprogres),!,
	write('ada pasar dekat sini dan ada banyak pedagang yang lapor beberapa kali kecopetan.'),nl,
	write('sampai saat ini copetnya belum tertangkapp.'),nl.

talk(pegawai) :-
	aku_di(kantor_pasar),
	write('hai saya pegawai disini.'),nl,!.

talk(pedagang) :-
	aku_di(pasar),
	ada_orang_di(copet,markas_copet_pasar),!,
	write('toloong!! saya kecopetan! dia lari ke arah utara'),nl.

talk(pedagang) :-
	aku_di(pasar),
	write('terima kasih sudah menangkap pencopetnya'),nl.

/*SPCEIAL SKILL*/
tangkap :-
	aku_di(markas_copet_pasar),
	ada_orang_di(copet,markas_copet_pasar),
	misi(tangkap_copet,onprogres),!,

	retract(ada_orang_di(copet,markas_copet_pasar)),
	asserta(tertangkap(copet)),
	misi(C,complete),
	append(C,[tangkap_copet],Lc),
	retract(misi(C,complete)),
	asserta(misi(Lc,complete)),
	write('Selamat kamu berhasil menangkap copet'),nl.

tangkap :-
	write('tak ada yg bisa kamu tangkap'),nl.

unuse(Item) :-
	pakai(Inuse),
	(Item = Inuse -> 
		ada_di(L,di_tas),
		append(L,[Item],Lb),
		retract(pakai(Item)),
		retract(ada_di(L,di_tas)),
		asserta(ada_di(Lb,di_tas))
			
		; write('Kamu sedang memakai '),write(Inuse),nl),!.

/*SKILL UMUM*/

take(Item) :-
	aku_di(Tempat),
	ada_di(L,Tempat),
	(memberchk(Item,L) -> 
		ada_di(Ol,di_tas),
		append(Ol,[Item],Lo),
		retract(ada_di(Ol,di_tas)),
		asserta(ada_di(Lo,di_tas)),
		delete(L,Item,Lb),
		(Lb = [] -> retract(ada_di(L,Tempat)) ;
			retract(ada_di(L,Tempat)),
			asserta(ada_di(Lb,Tempat)) 
		),!; write(Item),write(' tidak ada di '),write(Tempat),nl,!),
	open_bag.

look :-
	aku_di(Tempat),
	item_in(Tempat),
	open_bag,!.

item_in(Tempat) :-
	ada_di(L,Tempat),
	(L = [] -> write('Tidak ada apa-apa di '),write(Tempat),nl ;
		write('barang yang ada di '),write(Tempat),nl,
		tulist(L)),!
	.

item_in(_) :-
	aku_di(Tempat),
	write('Tidak ada apa-apa di '),write(Tempat),nl,!.

open_bag :-
	ada_di(L,di_tas),
	(L = [] -> write('Tidak ada apa-apa di tas'),nl ;
		write('barang yang ada di tas'),nl,
		tulist(L)),!
	.
use(Item) :-
	pakai(X),
	write('Kamu sedang memakai '),write(X),nl,!.

use(Item) :- 
	ada_di(Li,di_tas),
	(memberchk(Item,Li) -> 
		delete(Li,Item,Lb),
		retract(ada_di(Li,di_tas)),
		asserta(ada_di(Lb,di_tas)),
		asserta(pakai(Item)) ;

		write(Item),write(' tidak ada di tas'),nl
		),!.

drop(Item) :-
	aku_di(Tempat),
	ada_di(Li,di_tas),
	(memberchk(Item,Li) ->
		(ada_di(Lbr,Tempat) ->
			append(Lbr,[Item],Lbaru),
			retract(ada_di(Lbr,Tempat)),
			asserta(ada_di(Lbaru,Tempat)),
			delete(Li,Item,Ln),
			retract(ada_di(Li,di_tas)),
			asserta(ada_di(Ln,di_tas)) ;

			append([],[Item],Lbaru),
			asserta(ada_di(Lbaru,Tempat)),
			delete(Li,Item,Ln),
			retract(ada_di(Li,di_tas)),
			asserta(ada_di(Ln,di_tas))

			);

		write(Item),write(' tidak ada di tas'),nl
		),!.

/*MISI*/
tampilkanmisi :-
	misi(L,belom),
	tulist(L).

ambilmisi(X) :-
	(misi(Y,onprogres) -> write('Kamu sedang dalam misi '),write(Y),nl ; 
	cekmisi(X)).

cekmisi(X) :-
	misi(L,belom),
	memberchk(X,L),!,
	delete(L,X,Lb),
	retract(misi(L,belom)),
	asserta(misi(Lb,belom)),
	asserta(misi(X,onprogres)),
	write('Kamu telah mengambil misi '),write(X).

cekmisi(_) :-
	write('kamu tidak bisa mengambil misi itu').

misiku :-
	misi(X,onprogres),
	write(X),nl.

/*LST*/
tulist([]) :-
	!.

tulist([A|B]) :-
	write(' > '),write(A),nl,
	tulist(B).


/*Deskripsi dari setiap tempat, tergantung dari kondisinya */

deskripsi(ruang_kenaikan_pangkat) :-
	ada_di(lencana, in_hand),
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
	ada_orang_di(copet,markas_copet_pasar),
	misi(tangkap_copet,onprogres),!,
	write('HUAAAAAAAAAAAA! Terdengar suara teriakan seorang perempuan dari sebelah utara pasar! Seketika situasi'), nl,
	write('di pasar menjadi tidak terkendali! Kamu melihat seorang pencopet sedang berlari setelah mengambil tas'), nl,
	write('dari perempuan yang berteriak tadi ke arah utara! Tunggu apa lagi?! Cepat kejar dia!'), nl.

deskripsi(pasar) :- 
	write('Pasar ramai seperti biasanya.').

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
	ada_di(senter, in_hand), !,
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
	mati(hitler), !,
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

deskripsi(_) :-
	nl,!.

/*START*/
start :-
	read(Cmd),
	valid(Cmd).

/*VALIDASI*/
valid(quit) :- !.

valid(X) :-
   	isvalid(X),
   	read(Y),
	valid(Y).

isvalid(X) :-
	X = 'n',!,
	n .
isvalid(X) :-
	X = 's',!,
	s .
isvalid(X) :-
	X = 'e',!,
	e .
isvalid(X) :-
	X = 'w',!,
	w .
isvalid(X) :-
	X = 'dimana',!,
	dimana.
isvalid(X) :-
	X = 'bicara',!,
	bicara.
isvalid(X) :-
	X = 'cekdompet',!,
	cekdompet.
isvalid(X) :-
	X = 'cekenergi',!,
	cekenergi.

isvalid(_) :-
	write('Command salah.'),nl.