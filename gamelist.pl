/*FACT JALAN JALAN */  
	
:- dynamic(aku_di/1).
:- dynamic(uang/1).
:- dynamic(energi/1).
:- dynamic(ada_orang_di/2).
:- dynamic(tertangkap/1).
:- dynamic(mati/1).
:- dynamic(jinak/1).
:- dynamic(misi/2).
:- dynamic(ada_di/2).
:- dynamic(pakai/1).
:- dynamic(player/1).
:- dynamic(playerlist/1).
:- retractall(ada_di(_, _)), retractall(aku_di(_)), retractall(alive(_)), retractall(uang(_)), retractall(energi(_)), retractall(ada_orang_di(_,_)), retractall(tertangkap(_)), retractall(misi(_,_)).
	
/*PLAYER STAT*/	
player(admin).
aku_di(mabes_polri).
uang(100000).
energi(100).

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

/*NPC*/
ada_orang_di(bos,ruang_kapolri).
ada_orang_di(pegawai,kantor_pasar).
ada_orang_di(pedagang,pasar).
ada_orang_di(zookeeper,kebun_binatang).
ada_orang_di(ibu_warteg,warteg).

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
	write('Energi kamu '),write(X),nl. 

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

uangminimal(Min) :- 
	uang(X),
	X > Min.
/*NGOMONG*/

talk(bos) :-
	aku_di(ruang_kapolri),
	misi(L,complete),misi(X,onprogres),
	memberchk(X,L),!,
	write('selamat kamu berhasil menjalankan misi '),write(X),nl,
	retract(misi(X,onprogres)).

talk(bos) :-
	aku_di(ruang_kapolri),
	write('Bos : Ada beberapa misi yang dapat kamu ambil. silahkan pilih.'),nl,!,
	tampilkanmisi,!,
	read(Misi),
	(Misi = 'no' -> write('ok!'), nl ; 
		(energiminimal(65) -> 
		energi(A),
		B is A - 65,
		retract(energi(A)),
		asserta(energi(B)),
		ambilmisi(Misi) ; 
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
	tertangkap(Lt),
	append(Lt,[copet],Ltn),
	retract(tertangkap(Lt)),
	asserta(tertangkap(Ltn)),
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

beli(Item) :-
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
	aku_di(Tempat),
	write('Kamu tidak bisa beli apa-apa disini '),write(Tempat),nl.

makan(Nasi) :-
	ada_di(L,di_tas),
	(memberchk(Nasi,L) ->
		delete(L,Nasi,Lo),
		retract(ada_di(L,di_tas)),
		asserta(ada_di(Lo,di_tas)),
		energi(A),
		B is A + 15,
		retract(energi(A)),
		asserta(energi(B)),! ;
		write('Tidak ada '),write(Nasi),write(' di tas'),nl,!).
		

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

take(_) :-
	aku_di(Tempat),
	write('Tidak ada apa-apa di '),write(Tempat),nl.

look :-
	player(Nama),
	write(Nama),nl,
	aku_di(Tempat),
	item_in(Tempat),
	item_jual(Tempat),
	open_bag,!.

item_jual(Tempat) :-
	jual(L,Tempat),
	(L = [] -> write('Tidak ada yg berjualan di '),write(Tempat),nl ;
		write('barang yang dijual di '),write(Tempat),nl,
		tulist(L)),!
	.

item_jual(_) :-
	aku_di(Tempat),
	write('Tidak ada yg berjualan di '),write(Tempat),nl,!.


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


/*save barang sudah*/
save_barang(Nama) :-
	atom_concat(Nama,'barang.txt',Nfile),
	open(Nfile, write, File),
	(pakai(Item) -> 
		L = [Item], write(File, L),write(File, '.'),nl(File)
		; Lp = [], write(File, Lp),write(File, '.'),nl(File)),
	findall((Tempat,Lb), ada_di(Lb,Tempat), List),
	savebarangkefile(List,File),
	close(File).

savebarangkefile([], Nf) :-
	write(Nf,'Selesai. '),nl(Nf),
	write(Nf, '[].').

savebarangkefile([(Tempat,Lb)|B], Nf) :-
	write(Nf, Tempat),write(Nf, '. '),nl(Nf),
	write(Nf, Lb),write(Nf, '. '),nl(Nf),
	savebarangkefile(B,Nf).


/*Load barang sudah*/
load_barang(Nama):-
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
	!.

loadbarangdarifile(Tempat,List,Nf):-
	asserta(ada_di(List,Tempat)),
	read(Nf, Tempat1),
	read(Nf, List1),
	loadbarangdarifile(Tempat1,List1,Nf).

/*save player stat*/
save_player(Nama) :-	
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

/*SAVE DAN LOAD MISI BELOM JADI*/
/*
save_misi(Nama):-
	atom_concat(Nama,'mission.txt',Nfile),
	open(Nfile,write,File),

	misi(Mb,belom),
	misi(Ms,complete),
	findall(Mop,misi(Mop,onprogres),L),
	
	write(Mb),nl,
	write(File, Mb),write(File, '.'),nl(File),
	write(Ms),nl,
	write(File, Ms),write(File, '.'),nl(File),
	write(L),nl,
	write(File, L),write(File, '.'),nl(File),

	tertangkap(Tkp),
	write(File, Tkp),write(File, '.'),nl(File),
	mati(Mat),
	write(File, Mat),write(File, '.'),nl(File),
	jinak(Ber),
	write(File, Ber),write(File, '.'),nl(File),
	
	findall(Or1,ada_orang_di(Or1,markas_copet_pasar),L1),
	write(File, L1),write(File, '.'),nl(File),
	findall(Or2,ada_orang_di(Or2,markas_teroris),L2),
	write(File, L2),write(File, '.'),nl(File),
	findall(Or3,ada_orang_di(Or3,markas_mafia),L3),
	write(File, L3),write(File, '.'),nl(File),
	findall(Or4,ada_orang_di(Or4,markas_preman),L4),
	write(File, L4),write(File, '.'),nl(File),
	findall(Or5,ada_orang_di(Or5,kuburan_hitler),L5),
	write(File, L5),write(File, '.'),nl(File),
	findall(Or6,ada_orang_di(Or6,kandang_beruang),L6),
	write(File, L6),write(File, '.')
	.

load_misi(Nama) :-
	retractall(misi(_,_)),
	retractall(ada_orang_di(_,_)),
	retractall(tertangkap(_)),
	retractall(mati(_)),
	retractall(jinak(_)),
	atom_concat(Nama,'mission.txt',Nfile),
	open(Nfile,read,File),

	read(File, Mb),asserta(misi(Mb,belom)),
	read(File, Ms),asserta(misi(Ms,complete)),
	read(File, Mop),
		(Mop = [] -> !; Mop = [A|B], asserta(misi(A,onprogres))),

	read(File, Ltkp),asserta(tertangkap(Ltkp)),
	read(File, Lmat),asserta(mati(Lmat)),
	read(File, Lber),asserta(jinak(Lber)),

	read(File, L1),
		(L1 = [] -> ! ; L1 = [Cop|C], asserta(ada_orang_di(Cop,markas_copet_pasar))),
	read(File, L2),
		(L2 = [] -> ! ; L2 = [Ter|T], asserta(ada_orang_di(Ter,markas_teroris))),
	read(File, L3),
		(L3 = [] -> ! ; L3 = [Maf|M], asserta(ada_orang_di(Maf,markas_mafia))),
	read(File, L4),
		(L4 = [] -> ! ; L4 = [Pre|P], asserta(ada_orang_di(Pre,markas_preman))),
	read(File, L5),
		(L5 = [] -> ! ; L5 = [Hit|H], asserta(ada_orang_di(Hit,kuburan_hitler))),
	read(File, L6),
		(L6 = [] -> ! ; L6 = [Ber|Br], asserta(ada_orang_di(Ber,kandang_beruang))).
*/

/*save barang sudah*/
save_misi(Nama) :-
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
	write(Nf,'Selesai. '),nl(Nf),
	write(Nf, '[].'),nl(Nf).

savemisikefile([(Tempat,Lb)|B], Nf) :-
	write(Nf, Tempat),write(Nf, '. '),nl(Nf),
	write(Nf, Lb),write(Nf, '. '),nl(Nf),
	savemisikefile(B,Nf).


/*Load barang sudah*/
load_misi(Nama):-
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
	!.

loadorangdarifile(Tempat,List,Nf):-
	asserta(ada_orang_di(List,Tempat)),
	read(Nf, Tempat1),
	read(Nf, List1),
	loadorangdarifile(Tempat1,List1,Nf).


loadmisidarifile('Selesai',[],Nf ) :-
	!.

loadmisidarifile(Tempat,List,Nf):-
	asserta(misi(List,Tempat)),
	read(Nf, Tempat1),
	read(Nf, List1),
	loadmisidarifile(Tempat1,List1,Nf).


loadmisidarifile('Selesai',[],Nf ) :-
	!.

loadmisidarifile(Tempat,List,Nf):-
	asserta(misi(List,Tempat)),
	read(Nf, Tempat1),
	read(Nf, List1),
	loadmisidarifile(Tempat1,List1,Nf).



save :-
	player(Nama),
	save_player(Nama),
	save_barang(Nama),
	save_misi(Nama),
	write('Save succesful'),nl.

cont(Nama) :-
	load_player(Nama),
	load_barang(Nama),
	load_misi(Nama),
	write('Load berhasil'),nl,
	look.

ganti_nama:-
	read(Nama),
	player(User),
	retract(player(User)),
	asserta(player(Nama)).
	
