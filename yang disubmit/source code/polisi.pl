/** VARIABEL DYNAMIC **/
:- include('deskripsi.pl').
:- dynamic(ada_orang_di/2).
:- dynamic(ada_di/2).
:- dynamic(aku_di/1).
:- dynamic(alive/1).
:- dynamic(back/0).
:- dynamic(jinak/1).
:- dynamic(energi/1).
:- dynamic(mati/1).
:- dynamic(menu/0).
:- dynamic(misi/2).
:- dynamic(pakai/1).
:- dynamic(player/1).
:- dynamic(playerlist/1).
:- dynamic(tertangkap/1).
:- dynamic(uang/1).
:- dynamic(cek/1).
:- retractall(ada_di(_,_)), retractall(aku_di(_)), retractall(alive(_)), retractall(uang(_)), retractall(energi(_)), retractall(ada_orang_di(_,_)), retractall(tertangkap(_)), retractall(misi(_,_)), retractall(cek(_)).

/** MAIN PROGRAM **/

cek(no) :- write('Ketikkan "polisi69." untuk memulai game'), nl, !.
cek(_) :- write('Ketikkan "polisi69." untuk memulai game'), nl, !, fail.

polisi69 :- cls, mainmenu, 
			write('> '), read(X), valid(X), asserta(cek(ya)),
			open('listplayer.txt', read , File),
			read(File, L),asserta(playerlist(L)),
			close(File)
			.

valid(X) :-
	(
		X == instruction -> cls, instruction, write('> '), read(Y), valid(Y);
		X == start -> retractall(cek(_)), asserta(cek(ya)), write('> Masukkan nama kamu\n> '), read(Nama), asserta(player(Nama)), asserta(aku_di(mabes_polri)), asserta(uang(100000)), asserta(energi(100)), loop(X);
		X == back -> cls, back, write('\n> '), read(Y), valid(Y);
		X == quit -> cls, quit;
		X == exit -> cls, quit;
		X == loadgame -> playerlist(L),(L = [] -> write('Tidak ada save-an'),nl,! ; write('List data yang sudah disave : '),nl,tulist(L),nl,!),
		write('command gak ada bebs :(\n\n> '), read(Y), valid(Y)
	).

loop(X) :-
	(
		X == start -> cls,
			write('Selamat datang di Kota Tubagus! Kota yang penuh dengan keceriaan dan'), nl,
			write('kebahagiaan! Kamu adalah seorang polisi yang mengabdi pada masyarakat'), nl,
			write('Tubagus. Tugasmu ialah memberantas kejahatan dan melayani masyarakat.'), nl,
			write('Kamu memiliki cita-cita untuk menjadi seorang Kapolri yang hebat. Untuk'), nl,
			write('itu kamu perlu untuk meningkatkan reputasimu dengan menjalankan tugas-tugas'), nl,
			write('dari Bos Kapolri saat ini. Berjuanglah untuk cita-citamu!'), nl, read(Y), loop(Y);
		X == quit -> cls, quit;
		X == exit -> cls, quit;
		command_loop(X) -> nl, write('> '), read(Y), loop(Y);
		write('command not found beibs :*\n\n> '), read(Y), loop(Y)
	).

/** command_loop/1 **/
/*** FOR DIRECTION ***/
command_loop(n) :- !, n.
command_loop(s) :- !, s.
command_loop(e) :- !, e.
command_loop(w) :- !, w.

/*** FOR STATS ***/
command_loop(cekdompet) :- !, cekdompet.
command_loop(cekenergi) :- !, cekenergi.
command_loop(dimana) :- !, dimana.
command_loop(kerja) :- !, kerja.
command_loop(look) :- !, look.
command_loop(tangkap) :- !, tangkap.
command_loop(tidur) :- !, tidur.

/*** FOR CHECKING ***/
command_loop(menu) :- !, menu.
command_loop(mainmenu) :- !, mainmenu.
command_loop(tampilkanmisi) :- !, tampilkanmisi.
command_loop(instruction):- !, instruction.
command_loop(instruksi) :- !, instruksi.
command_loop(instructions) :- !, instruction.

/** command_loop/1/1 **/
/*** FOR ACTION ***/
command_loop(beli(_)) :- !, beli(_).
command_loop(drop(_)) :- !, drop(_).
command_loop(take(_)) :- !, take(_).
command_loop(talk(_)) :- !, talk(_).
command_loop(unsue(_)) :- !, unuse(_).
command_loop(use(_)) :- !, use(_).
command_loop(makan(_)) :- !, makan(_).
command_loop(load(_)) :- !, load(_).
command_loop(save(_)) :- !, save(_).

quit :- qword, nl.

/*** FACT FACT JALAN ***/
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
jalan(pasar,w,kantor_pasar).
jalan(pasar,s,kolong_jembatan).
	
jalan(kolong_jembatan,n,pasar).
jalan(kolong_jembatan,w,markas_teroris).
	
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

/*NPC*/
npc(bos,ruang_kapolri).
npc(pegawai,kantor_pasar).
npc(pedagang,pasar).
npc(zookeeper,kebun_binatang).
npc(ibu_warteg,warteg).
npc(satpam,rumah).
npc(warga,gang_depan).

/*MUSUH*/
ada_orang_di(copet,markas_copet_pasar).
ada_orang_di(teroris,markas_teroris).
ada_orang_di(mafia,markas_mafia).
ada_orang_di(preman,markas_preman).
ada_orang_di(zombie_hitler,kuburan_hitler).
ada_orang_di(beruang,kandang_beruang).

/*List*/
tertangkap([]).
mati([]).
jinak([]).

/*Barang*/
ada_di([],di_tas).
ada_di([borgol,samurai,pisau],rumah).

jual([rifle,bazoka,shotgun],gudang_senjata).
jual([nasi_padang,tahu_sumedang],kantin_kapolri).

/*MISI*/
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
		cek(ya),
		aku_di(Here),
		write(Here),nl.

pergi(Direction) :-
		cek(ya),
        aku_di(Here),
        jalan(Here,Direction,There),
        write('Aku di '),
		write(There),nl,!,
        retract(aku_di(Here)),
        asserta(aku_di(There)),
        nl.

pergi(_) :-
		cek(ya),
        write('Disana tidak ada jalan.'),nl.
	
tidur :- 
	cek(ya),
	aku_di(rumah),
	!,
	energi(X),
	retract(energi(X)),
	Y is 100,
	asserta(energi(Y)),
	write('Energi kamu sudah penuh kembali.'),nl.

tidur :- 
	cek(ya),
	write('Kamu tidak bisa tidur disini.'),nl.

/*ENERGI*/
cekenergi :-
	cek(ya),
	energi(X),
	write('Energi kamu '),write(X),nl. 

energiminimal(Min) :-
	cek(ya), 
	energi(X),
	X > Min.

damage(X) :-
	cek(ya),
	energi(Z),
	W is Z - X,
	retract(energi(Z)),
	asserta(energi(W)).

/*KERJA*/

kerja :- cek(no), !.

kerja :-
	cek(ya),
	aku_di(jalan_in_aja),
	energiminimal(50),!,	
	uang(X),
	Y is X + 50000,
	retract(uang(X)),
	asserta(uang(Y)),
	damage(50),
	write('Selamat kamu dapat 50.000'),nl,
	write('uang kamu sekarang '),
	write(Y),nl.

kerja :-
	cek(ya),
	aku_di(jalan_in_aja),!,
	write('Energi kamu ga cukup'),nl.

kerja :-
	cek(ya),
	aku_di(perempatan_kuy),
	energiminimal(50),!,
	uang(X),
	Y is X + 50000,
	retract(uang(X)),
	asserta(uang(Y)),
	damage(50),
	write('Selamat kamu dapat 50.000'),nl,
	write('uang kamu sekarang '),
	write(Y),nl.

kerja :-
	cek(ya),
	aku_di(perempatan_kuy),!,
	write('Energi kamu ga cukup'),nl.

kerja :- 
	cek(ya),
	write('Kamu ga bisa kerja di sini.'),nl,
	/*write('Ga ada lowongan kerja di sini'),nl,*/
	write('Kamu kira ini dimana ?!'),nl.

/*CEK UANG*/
cekdompet :-
	cek(ya), 
	uang(X),
	write('uang kamu sekarang '),
	write(X),nl.

uangminimal(Min) :-
	cek(ya), 
	uang(X),
	X > Min.
/*NGOMONG*/
talk(_) :- cek(no), !.

talk(bos) :-
	cek(ya),
	aku_di(ruang_kapolri),
	misi(L,complete),misi(X,onprogres),
	memberchk(X,L),!,
	write('selamat kamu berhasil menjalankan misi '),write(X),nl,
	retract(misi(X,onprogres)),
	(iswin -> 
		write('Selamat kamu berhasil menyelesaikan game ini!'),nl,
		ada_di(Lb,di_tas),
		append(Lb,[lencana],Lbn),
		retract(ada_di(Lb,di_tas)),
		asserta(ada_di(Lbn,di_tas)),!,
		write('Kamu mendapatkan lencana'),nl
		;
		!
	).

talk(bos) :-
	cek(ya),
	aku_di(ruang_kapolri),
	\+misi(X,onprogres), 
	write('Bos : Ada beberapa misi yang dapat kamu ambil. silahkan pilih.'),nl,!,
	tampilkanmisi,!,
	read(Misi),
	(Misi = 'no' -> write('ok!'), nl ; 
		(energiminimal(65) -> 
		damage(65),
		ambilmisi(Misi),! ; 
			write('Energi mu tidak cukup untuk menjalankan misi.'),nl))
	.

talk(bos) :-
	cek(ya),
	aku_di(ruang_kapolri),!,
	misi(X,onprogres),
	write('Kamu sedang dalam misi '),write(X),nl,write('Apakah kamu ingin membatalkan misi? (Y/N)'),nl,write(' > '),
	read(Ans),
	(Ans = 'y' -> 
		misi(L,belom),
		append([X],L,Ln),
		retract(misi(L,belom)),
		asserta(misi(Ln,belom)),
		retract(misi(X,onprogres)),!
		;
		(Ans = n ->
			! ;
			write(' > Jawaban salah! '),nl,!
		)
	),!
	
	.

talk(_) :- cek(no), !.

talk(pegawai) :-
	cek(ya),
	aku_di(kantor_pasar),
	misi(tangkap_copet,onprogres),!,
	write('ada pasar dekat sini dan ada banyak pedagang yang lapor beberapa kali kecopetan.'),nl,
	write('sampai saat ini copetnya belum tertangkapp.'),nl.

talk(pegawai) :-
	cek(ya),
	aku_di(kantor_pasar),
	write('hai saya pegawai disini.'),nl,!.

talk(pedagang) :-
	cek(ya),
	aku_di(pasar),
	ada_orang_di(copet,markas_copet_pasar),!,
	write('toloong!! saya kecopetan! dia lari ke arah utara'),nl.

talk(pedagang) :-
	cek(ya),
	aku_di(pasar),
	write('terima kasih sudah menangkap pencopetnya'),nl.

talk(warga):-
	cek(ya),
	player(Name),
	aku_di(gang_depan),
	\+misi(X,onprogres),
	misi(L,belom),
	memberchk(lawan_preman,L),!,
	write(Name),write(' : Selamat sore! Mau tanya kenapa suasana disini sepi sekali ya?'),nl,
	write('warga : Sore! Begini pak, tempo hari ada preman yang meresahkan warga disini.'),nl,
	write(Name),write(' : Hoo begitu ya. Apakah premannya membawa senjata? '),nl,
	write('warga : Tidak dan biasanya dia ada di sebelah barat dari sini. Apakah bapak ingin membantu kami melawan preman?'),nl,
	write('(y untuk membantu & selain y untuk menolak)'),
	write(Name),write(' :  '),read(Ans),nl,
	(Ans = 'y' ->
		(energiminimal(35) -> 
			damage(35),
			ambilmisi(lawan_preman),!
			;
			write(Name),write(' :  Maaf sekarang saya terlalu lelah, mungkin lain kali'),nl,!	
		)
		;
		write(Name),write(' :  Maaf tapi saya sedang sibuk, mungkin lain kali'),nl,!
	)
	.

talk(warga):-
	cek(ya),
	player(Name),
	aku_di(gang_depan),
	\+misi(lawan_preman,onprogres),
	misi(L,belom),
	memberchk(lawan_preman,L),!,
	write(Name),write(' : Selamat sore! Mau tanya kenapa suasana disini sepi sekali ya?'),nl,
	write('warga : Sore! Begini pak, tempo hari ada preman yang meresahkan warga disini.'),nl,
	write(Name),write(' : Hoo begitu ya. Apakah premannya membawa senjata? '),nl,
	write('warga : Tidak dan biasanya dia ada di sebelah barat dari sini. Apakah bapak ingin membantu kami melawan preman?'),nl,
	write(Name),write(' :  Maaf tapi saya sedang sibuk, mungkin lain kali'),nl,!
	.

talk(warga):-
	cek(ya),
	player(Name),
	aku_di(gang_depan),
	misi(lawan_preman,onprogres),!,
	write('warga : Apakah bapak sudah siap?'),nl,!
	.

talk(warga):-
	cek(ya),
	player(Name),
	aku_di(gang_depan),
	misi(L,complete),
	memberchk(lawan_preman,L),!,
	write('warga : Terima kasih pak! Berkat bantuan bapak suasana menjadi lebih baik.'),nl
	.

talk(Person) :-
	cek(ya),
	aku_di(Here),
	write('Tidak ada '),write(Person),write(' di '),write(Here),nl,!.

/*SPCEIAL SKILL*/
tangkap :- cek(no), !.

tangkap :-
	cek(ya),
	aku_di(markas_copet_pasar),
	ada_orang_di(copet,markas_copet_pasar),
	misi(tangkap_copet,onprogres),pakai(X),X = borgol,!,

	retract(ada_orang_di(copet,markas_copet_pasar)),
	tertangkap(Lt),
	append(Lt,[copet],Ltn),
	retract(tertangkap(Lt)),
	asserta(tertangkap(Ltn)),
	misi(C,complete),
	append(C,[tangkap_copet],Lc),
	retract(misi(C,complete)),
	asserta(misi(Lc,complete)),
	write('Selamat kamu berhasil menangkap copet'),nl,!.

tangkap :-
	cek(ya),
	aku_di(markas_copet_pasar),
	ada_orang_di(copet,markas_copet_pasar),
	misi(tangkap_copet,onprogres),!,
	(pakai(X) -> 
		retract(ada_orang_di(copet,markas_copet_pasar)),
		tertangkap(Lt),
		append(Lt,[copet],Ltn),
		retract(tertangkap(Lt)),
		asserta(tertangkap(Ltn)),
		misi(C,complete),
		append(C,[tangkap_copet],Lc),
		retract(misi(C,complete)),
		asserta(misi(Lc,complete)),
		write('Selamat kamu berhasil menangkap copet'),nl,!
		;
		write('Apakah kamu yakin menangkap copet pasar dengan tangan kosong? (y/other)'),nl,
		write('(y untuk ya dan yang lain untuk kabur ke pasar'),nl,write(' > '),
		read(Ans),
		(Ans = 'y' ->
			(energiminimal(20) ->
				damage(20),
				pergi(s),nl,write('Kamu mencoba menangkap namun copet malah menyerangmu, energimu berkurang 20'),nl,
				write('Akhirnya kamu memutuska kabur ke pasar'),nl
				;
				damage(20),
				isdead
			);
			!,pergi(s),nl,write('Kamu berhasil kabur')
		)
	).

tangkap :-
	cek(ya),
	aku_di(markas_teroris),
	ada_orang_di(teroris,markas_teroris),
	misi(lawan_teroris,onprogres),pakai(X),(X=bazoka;X=rifle;X=shotgun),!,
	retract(ada_orang_di(teroris,markas_teroris)),
	tertangkap(Lt),
	append(Lt,[teroris],Ltn),
	retract(tertangkap(Lt)),
	asserta(tertangkap(Ltn)),
	misi(C,complete),
	append(C,[lawan_teroris],Lc),
	retract(misi(C,complete)),
	asserta(misi(Lc,complete)),
	write('Selamat kamu berhasil menangkap teroris'),nl,!	
	.


tangkap :-
	cek(ya),
	aku_di(markas_teroris),
	ada_orang_di(teroris,markas_teroris),
	misi(lawan_teroris,onprogres),!,
	(pakai(X) -> 
		retract(ada_orang_di(teroris,markas_teroris)),
		tertangkap(Lt),
		append(Lt,[teroris],Ltn),
		retract(tertangkap(Lt)),
		asserta(tertangkap(Ltn)),
		misi(C,complete),
		append(C,[lawan_teroris],Lc),
		retract(misi(C,complete)),
		asserta(misi(Lc,complete)),
		write('Selamat kamu berhasil menangkap teroris'),nl,!
		;
		write('Apakah kamu yakin menangkap teroris dengan tangan kosong? (y/other)'),nl,
		write('(y untuk ya dan yang lain untuk kabur ke pasar'),nl,write(' > '),
		read(Ans),
		(Ans = 'y' ->
			(energiminimal(40) ->
				damage(40),
				pergi(e),nl,write('Kamu mencoba menangkap namun copet malah menyerangmu, energimu berkurang 40'),nl,
				write('Akhirnya kamu memutuskan kabur ke kolong_jembatan'),nl
				;
				damage(40),
				isdead
			);
			!,pergi(e),nl,write('Kamu berhasil kabur')
		)
	).

tangkap :-
	cek(ya),
	aku_di(markas_mafia),
	ada_orang_di(mafia,markas_mafia),
	misi(lawan_mafia,onprogres),pakai(X),(X=bazoka;X=shotgun),!,
	retract(ada_orang_di(mafia,markas_mafia)),
	tertangkap(Lt),
	append(Lt,[mafia],Ltn),
	retract(tertangkap(Lt)),
	asserta(tertangkap(Ltn)),
	misi(C,complete),
	append(C,[lawan_mafia],Lc),
	retract(misi(C,complete)),
	asserta(misi(Lc,complete)),
	write('Selamat kamu berhasil menangkap mafia'),nl,!	
	.

tangkap :-
	cek(ya),
	aku_di(markas_mafia),
	ada_orang_di(mafia,markas_mafia),
	misi(lawan_mafia,onprogres),!,
	(pakai(X) -> 
		retract(ada_orang_di(mafia,markas_mafia)),
		tertangkap(Lt),
		append(Lt,[mafia],Ltn),
		retract(tertangkap(Lt)),
		asserta(tertangkap(Ltn)),
		misi(C,complete),
		append(C,[lawan_mafia],Lc),
		retract(misi(C,complete)),
		asserta(misi(Lc,complete)),
		write('Selamat kamu berhasil menangkap mafia'),nl,!
		;
		write('Apakah kamu yakin menangkap mafia dengan tangan kosong? (y/other)'),nl,
		write('(y untuk ya dan yang lain untuk kabur ke pasar'),nl,write(' > '),
		read(Ans),
		(Ans = 'y' ->
			(energiminimal(30) ->
				damage(30),
				pergi(e),nl,write('Kamu mencoba menangkap namun copet malah menyerangmu, energimu berkurang 30'),nl,
				write('Akhirnya kamu memutuskan kabur ke pasar gelap'),nl
				;
				damage(30),
				isdead
			);
			!,pergi(e),nl,write('Kamu berhasil kabur')
		)
	).

tangkap :-
	cek(ya),
	write('tak ada yg bisa kamu tangkap'),nl
	.

lawan :- cek(no), !.

lawan :-
	cek(ya),
	aku_di(markas_preman),
	ada_orang_di(preman,markas_preman),
	misi(lawan_preman,onprogres),!,
	retract(misi(lawan_preman,onprogres)),
	retract(ada_orang_di(preman,markas_preman)),
	tertangkap(Lt),
	append(Lt,[preman],Ltn),
	retract(tertangkap(Lt)),
	asserta(tertangkap(Ltn)),
	misi(C,complete),
	append(C,[lawan_preman],Lc),
	retract(misi(C,complete)),
	asserta(misi(Lc,complete)),
	write('Selamat kamu berhasil menangkap preman'),nl,!
	.

lawan:-
	cek(ya),
	write('Tak ada yang bisa kamu lawan'),!.

unuse(_) :- cek(no), !.

unuse(Item) :-
	cek(ya),
	pakai(Item),
	ada_di(L,di_tas),
	append(L,[Item],Lb),
	retract(pakai(Inuse)),
	retract(ada_di(L,di_tas)),
	asserta(ada_di(Lb,di_tas)),!.

unuse(Item) :-
	cek(ya),
	pakai(Inuse),
	write('Kamu sedang memakai '),write(Inuse),nl,!.

unuse(Item):-
	cek(ya),
	write('Tak ada yang sedang kamu pakai'),nl,!.

beli(_) :- cek(no), !.

beli(Item) :-
	cek(ya),
	aku_di(kantin_kapolri),
	jual(L,kantin_kapolri),
	(memberchk(Item,L) -> 
		(Item = 'nasi_padang' ->
			(uangminimal(20000) -> 
				uang(X),
				Y is X - 20000,
				retract(uang(X)),
				asserta(uang(Y)),
				ada_di(Ol,di_tas), 
				append(Ol,[Item],Lo),
				retract(ada_di(Ol,di_tas)),
				asserta(ada_di(Lo,di_tas))
				 ;
				write('Uang anda tidak cukup'),nl 
			) ;
			(uangminimal(10000) -> 
				uang(X),
				Y is X - 10000,
				retract(uang(X)),
				asserta(uang(Y)),
				ada_di(Ol,di_tas),
				append(Ol,[Item],Lo),
				retract(ada_di(Ol,di_tas)),
				asserta(ada_di(Lo,di_tas))
				 ;
				write('Uang anda tidak cukup'),nl 
			)
		),
	!; write(Item),write(' tidak ada di '),write(kantin_kapolri),nl,!),
	open_bag.

beli(Senjata) :-
	cek(ya),
	aku_di(gudang_senjata),
	jual(L,gudang_senjata),
	(memberchk(Senjata,L) -> 
		(Senjata = 'bazoka' ->
			(uangminimal(1000000) -> 
				uang(X),
				Y is X - 1000000,
				retract(uang(X)),
				asserta(uang(Y)),
				ada_di(Ol,di_tas),
				append(Ol,[Senjata],Lo),
				retract(ada_di(Ol,di_tas)),
				asserta(ada_di(Lo,di_tas))
				 ;
				write('Uang anda tidak cukup'),nl 
			) ;
		(Senjata = 'rifle' ->
			(uangminimal(300000) -> 
				uang(X),
				Y is X - 300000,
				retract(uang(X)),
				asserta(uang(Y)),
				ada_di(Ol,di_tas),
				append(Ol,[Senjata],Lo),
				retract(ada_di(Ol,di_tas)),
				asserta(ada_di(Lo,di_tas))
				 ;
				write('Uang anda tidak cukup'),nl 
			) ;
		(Senjata = 'shotgun' ->
			(uangminimal(700000) -> 
				uang(X),
				Y is X - 700000,
				retract(uang(X)),
				asserta(uang(Y)),
				ada_di(Ol,di_tas),
				append(Ol,[Senjata],Lo),
				retract(ada_di(Ol,di_tas)),
				asserta(ada_di(Lo,di_tas))
				 ;
				write('Uang anda tidak cukup'),nl 
			) ; !
			))),
		!; write(Senjata),write(' tidak ada di '),write(gudang_senjata),nl,!),
	open_bag.

beli(_) :-
	cek(ya),
	aku_di(Tempat),
	write('Kamu tidak bisa beli apa-apa disini '),write(Tempat),nl.

ismakanable(_) :- cek(no), !.

ismakanable(Nasi) :-
	cek(ya),
	Nasi = nasi_padang.

ismakanable(Nasi) :-
	cek(ya),
	Nasi = tahu_sumedang.

makan(_) :- cek(no), !.

makan(Nasi) :-
	cek(ya),
	ada_di(L,di_tas),
	(ismakanable(Nasi) ->
		(memberchk(Nasi,L) ->
			delete(L,Nasi,Lo),
			retract(ada_di(L,di_tas)),
			asserta(ada_di(Lo,di_tas)),
			energi(A),
			B is A + 15,
			retract(energi(A)),
			asserta(energi(B)),! 
			;
			write('Tidak ada '),write(Nasi),write(' di tas'),nl,!
		);
		write('Kamu tidak bisa memakan '),write(Nasi),nl
	),!	
	.
		


/*SKILL UMUM*/

take(_) :- cek(no), !.

take(Item) :-
	cek(ya),
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

take(_) :-
	cek(ya),
	aku_di(Tempat),
	write('Tidak ada apa-apa di '),write(Tempat),nl.

look :-
	cek(ya),
	player(Nama),
	write(Nama),nl,
	aku_di(Tempat),
	item_in(Tempat),
	item_jual(Tempat),
	findall(Npc,npc(Npc,Tempat),L),
	(L = [] -> write('Tidak ada NPC disini') ;
	write('NPC yang ada di '),write(Tempat),nl,
	tulist(L)
	),!.

item_jual(_):- cek(no),!.

item_jual(Tempat) :-
	cek(ya),
	jual(L,Tempat),
	(L = [] -> write('Tidak ada yg berjualan di '),write(Tempat),nl ;
		write('barang yang dijual di '),write(Tempat),nl,
		tulist(L)),!
	.

item_jual(_) :-
	cek(ya),
	aku_di(Tempat),
	write('Tidak ada yg berjualan di '),write(Tempat),nl,!.

item_in(_) :- cek(no),!.

item_in(Tempat) :-
	cek(ya),
	ada_di(L,Tempat),
	(L = [] -> write('Tidak ada apa-apa di '),write(Tempat),nl ;
		write('barang yang ada di '),write(Tempat),nl,
		tulist(L)),!
	.

item_in(_) :-
	cek(ya),
	aku_di(Tempat),
	write('Tidak ada apa-apa di '),write(Tempat),nl,!.

open_bag :-
	cek(ya),
	ada_di(L,di_tas),
	(L = [] -> write('Tidak ada apa-apa di tas'),nl ;
		write('barang yang ada di tas'),nl,
		tulist(L)),!
	.

isuseable(Item) :-
	cek(ya),
	\+ismakanable(Item).

use(_):- cek(no),!.

use(Item) :-
	cek(ya),
	pakai(X),
	write('Kamu sedang memakai '),write(X),nl,!.

use(Item) :-
	cek(ya), 
	ada_di(Li,di_tas),
	(isuseable(Item) ->
		(memberchk(Item,Li) -> 
			delete(Li,Item,Lb),
			retract(ada_di(Li,di_tas)),
			asserta(ada_di(Lb,di_tas)),
			asserta(pakai(Item)) ;

			write(Item),write(' tidak ada di tas'),nl
		),!
		;write('Kamu tidak bisa memakai '),write(Item),nl),!
	.

drop(Item) :-
	cek(ya),
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
	cek(ya),
	misi(L,belom),
	tulistmisi(L).

ambilmisi(X) :-
	cek(ya),
	(misi(Y,onprogres) -> write('Kamu sedang dalam misi '),write(Y),nl,! ; 
	cekmisi(X),!),!.

cekmisi(_):-cek(no),!.

cekmisi(X) :-
	cek(ya),
	misi(L,belom),
	memberchk(X,L),!,
	delete(L,X,Lb),
	retract(misi(L,belom)),
	asserta(misi(Lb,belom)),
	asserta(misi(X,onprogres)),
	write('Kamu telah mengambil misi '),write(X).

cekmisi(_) :-
	cek(ya),
	write('kamu tidak bisa mengambil misi itu').

misiku:- cek(no),!.

misiku :-
	cek(ya),
	misi(X,onprogres),
	write(X),nl,!.

misiku :-
	cek(ya),
	write('Kamu sedang tidak ada misi'),nl,!.
/*LST*/

tulistmisi([]) :-
	cek(ya),
	!.

tulistmisi([A|B]) :-
	cek(ya),
	A = lawan_preman,
	(aku_di(gang_depan) ->
		write(' > '),write(A),nl,
		tulistmisi(B) ;
		tulistmisi(B)
	).

tulistmisi([A|B]) :-
	cek(ya),
	A = jinakkan_beruang,
	(aku_di(kebun_binatang) ->
		write(' > '),write(A),nl,
		tulistmisi(B) ;
		tulistmisi(B)
	).

tulistmisi([A|B]) :-
	cek(ya),
	aku_di(ruang_kapolri),
	write(' > '),write(A),nl,
	tulistmisi(B).

tulist([]) :-
	cek(ya), !.

tulist([A|B]) :-
	cek(ya),
	write(' > '),write(A),nl,
	tulist(B).

/*save barang sudah*/
save_barang(Nama) :-
	cek(ya),
	atom_concat(Nama,'barang.txt',Nfile),
	open(Nfile, write, File),
	(pakai(Item) -> 
		L = [Item], write(File, L),write(File, '.'),nl(File)
		; Lp = [], write(File, Lp),write(File, '.'),nl(File)),
	findall((Tempat,Lb), ada_di(Lb,Tempat), List),
	savebarangkefile(List,File),
	close(File).

savebarangkefile([], Nf) :-
	cek(ya),
	write(Nf,'Selesai. '),nl(Nf),
	write(Nf, '[].').

savebarangkefile([(Tempat,Lb)|B], Nf) :-
	cek(ya),
	write(Nf, Tempat),write(Nf, '. '),nl(Nf),
	write(Nf, Lb),write(Nf, '. '),nl(Nf),
	savebarangkefile(B,Nf).


/*Load barang sudah*/
load_barang(Nama):-
	cek(ya),
	atom_concat(Nama,'barang.txt',Nfile),
	open(Nfile,read,File),
	retractall(ada_di(_,_)),
	read(File, L),
	(L = [] -> 
		! ;
		L = [A|S], write(S),asserta(pakai(A))),
	read(File, Tempat),
	read(File, Lb),
	loadbarangdarifile(Tempat,Lb,File),
	close(File),	

	nl.

loadbarangdarifile('Selesai',[],Nf ) :-
	cek(ya),
	!.

loadbarangdarifile(Tempat,List,Nf):-
	cek(ya),
	asserta(ada_di(List,Tempat)),
	read(Nf, Tempat1),
	read(Nf, List1),
	loadbarangdarifile(Tempat1,List1,Nf).

/*save player stat*/
save_player(Nama) :-	
	cek(ya),
	aku_di(Tempat),
	uang(Rupiah),
	energi(Eng),
	atom_concat(Nama,'player.txt',Nfile),
	open(Nfile,write,File),
	write(File, Nama),write(File, '.'),nl(File),
	write(File, Tempat),write(File, '.'),nl(File),
	write(File, Rupiah),write(File, '.'),nl(File),
	write(File, Eng),write(File, '.'),
	close(File).

/*load player stat*/
load_player(Name):-
	cek(ya),
	retractall(player(_)),
	retractall(uang(_)),
	retractall(energi(_)),
	retractall(aku_di(_)),
	atom_concat(Name,'player.txt',Nfile),
	open(Nfile,read,File),
	read(File, Nama),
	read(File, Tempat),
	read(File, Rupiah),
	read(File, Eng),
	asserta(player(Nama)),
	asserta(aku_di(Tempat)),
	asserta(uang(Rupiah)),
	asserta(energi(Eng)),
	close(File).

/*save misi sudah*/
save_misi(Nama) :-
	cek(ya),
	atom_concat(Nama,'mission.txt',Nfile),
	open(Nfile, write, File),
	findall((Prog,Lm), misi(Lm,Prog), List),
	savemisikefile(List,File),
	findall((Tempat,Org),ada_orang_di(Org,Tempat),Lorg),
	savemisikefile(Lorg,File),
	findall(Tkp,tertangkap(Tkp),Ltkp),
	Ltkp = [A|B],write(File, A),write(File, '.'),nl(File),
	findall(Mat,mati(Mat),Lmat),
	Ltkp = [C|D],write(File, C),write(File, '.'),nl(File),
	findall(Ber,jinak(Ber),Lber),
	Ltkp = [E|F],write(File, E),write(File, '.'),nl(File),
	!,
	close(File).


savemisikefile([], Nf) :-
	cek(ya),
	write(Nf,'Selesai. '),nl(Nf),
	write(Nf, '[].'),nl(Nf).

savemisikefile([(Tempat,Lb)|B], Nf) :-
	cek(ya),
	write(Nf, Tempat),write(Nf, '. '),nl(Nf),
	write(Nf, Lb),write(Nf, '. '),nl(Nf),
	savemisikefile(B,Nf).


/*Load barang sudah*/
load_misi(Nama):-
	cek(ya),
	atom_concat(Nama,'mission.txt',Nfile),
	open(Nfile,read,File),
	retractall(misi(_,_)),
	retractall(ada_orang_di(_,_)),
	retractall(tertangkap(_)),
	retractall(mati(_)),
	retractall(jinak(_)),
	
	read(File, Prog),
	read(File, Lm),
	loadmisidarifile(Prog,Lm,File),
	read(File, Tempat),
	read(File, Org),
	loadorangdarifile(Tempat,Org,File),

	read(File, Ltkp),
	asserta(tertangkap(Tkp)),
	read(File, Lmat),
	asserta(mati(Mat)),
	read(File, Lber),
	asserta(jinak(Ber)),
	!,close(File)	
	.


loadorangdarifile('Selesai',[],Nf ) :-
	cek(ya),
	!.

loadorangdarifile(Tempat,List,Nf):-
	cek(ya),
	asserta(ada_orang_di(List,Tempat)),
	read(Nf, Tempat1),
	read(Nf, List1),
	loadorangdarifile(Tempat1,List1,Nf).


loadmisidarifile('Selesai',[],Nf ) :-
	cek(ya),
	!.

loadmisidarifile(Tempat,List,Nf):-
	cek(ya),
	asserta(misi(List,Tempat)),
	read(Nf, Tempat1),
	read(Nf, List1),
	loadmisidarifile(Tempat1,List1,Nf).


loadmisidarifile('Selesai',[],Nf ) :-
	cek(ya),
	!.

loadmisidarifile(Tempat,List,Nf):-
	cek(ya),
	asserta(misi(List,Tempat)),
	read(Nf, Tempat1),
	read(Nf, List1),
	loadmisidarifile(Tempat1,List1,Nf).


save(Nama):-
	cek(ya),

	playerlist(L),
	append(L,[Nama],Ln),
	open('listplayer.txt',write,File),
	write(File, L),write(File,'.'),
	close(File),

	save_player(Nama),
	save_barang(Nama),
	save_misi(Nama),
	write('Save succesful'),nl.

cont(Nama) :-
	cek(ya),
	load_player(Nama),
	load_barang(Nama),
	load_misi(Nama),
	write('Load berhasil'),nl,
	look.

isdead:-
	cek(ya),
	energi(X),
	(X =< 0 ->
		write('Kamu kalah.'),nl,sleep(2),quit
		;
		!)
	.

iswin:-
	cek(ya),
	misi(L,complete),
	memberchk(tangkap_copet,L),
	memberchk(lawan_mafia,L),
	memberchk(lawan_teroris,L)
	.

ganti_nama:-
	cek(ya),
	read(Nama),
	player(User),
	retract(player(User)),
	asserta(player(Nama)).

stat :- 
	cek(ya),
	player(Nama),write('Nama player : '), write(Nama),nl,
	energi(X), write('Energi kamu sekarang '),write(X),nl,
	uang(Y), write('Uang kamu sekarang '),write(Y),nl,
	open_bag,
	( pakai(Z) ->
	write('Kamu sedang memakai '),write(Z),nl
	; write('Tidak ada barang yang sedang kamu pakai.')).




/** BACK **/
back :- k.
k :- mainmenu, write('Mau kembali ke mana mas?').

/** INSTRUCTION **/
instruction :- instruksi.
instruksi :- loveyou.
loveyou :- cls, see('instruksi.txt'), retract('back :- k'), asserta('back :- menu'), rekursif, seen, !.
loveyou :- cls, see('instruksi.txt'), asserta('back :- menu'), rekursif, seen.

/** MAIN MENU **/
mainmenu :- menu.
menu :- asdf.
asdf :- cls, retract('back :- menu'), asserta('back :- k'), see('mainmenu2.txt'), rekursif, seen, !.
asdf :- cls, see('mainmenu2.txt'), rekursif, seen, !.

/** QUIT GAME **/
qword :- cls, see('exit.txt'), rekursif, seen, !.

/** REKUSRSIF **/
rekursif :- read(A), proses(A).
proses(end_of_file) :- !.
proses(A) :- write(A), nl, rekursif.


/** CLEAR SCREEN **/
cls :- write('\33\[H\33\[2J').