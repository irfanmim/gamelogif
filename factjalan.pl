/*FACT JALAN JALAN */  
	
:- dynamic(aku_di/1).
:- dynamic(uang/1).
:- dynamic(energi/1).
:- retractall(at(_, _)), retractall(aku_di(_)), retractall(alive(_)), retractall(uang(_)), retractall(energi(_)).
	
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

n :-pergi(n).

s :-pergi(s).

e :-pergi(e).

w :-pergi(w).

u :-pergi(u).

d :-pergi(d).

/* This rule tells how to move in a given direction. */

dimana :-
		aku_di(Here),
		write(Here).

pergi(Direction) :-
        aku_di(Here),
        jalan(Here,Direction,There),
        retract(aku_di(Here)),
        asserta(aku_di(There)),
        write('Aku di '),
		write(There),!,
		nl.

pergi(_) :-
        write('Disana tidak ada jalan.').
	
tidur :- 
	aku_di(rumah),
	!,
	energi(X),
	retract(energi(X)),
	Y is 100,
	asserta(energi(Y)),
	write('Energi kamu sudah penuh kembali.').

tidur :- 
	write('Kamu tidak bisa tidur disini.').

cekenergi :-
	energi(X),
	write('Energi kamu '),write(X),write('%.'). 

energiminimal(Min) :- 
	energi(X),
	X > Min.


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
	write(Y).

kerja :-
	aku_di(jalan_in_aja),!,
	write('Energi kamu ga cukup').

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
	write(Y).

kerja :-
	aku_di(perempatan_kuy),!,
	write('Energi kamu ga cukup').

kerja :- 
	write('Kamu ga bisa kerja di sini.'),nl,
	/*write('Ga ada lowongan kerja di sini'),nl,*/
	write('Kamu kira ini dimana ?!').

cekdompet :- 
	uang(X),
	write('uang kamu sekarang '),
	write(X).