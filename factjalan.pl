/*FACT JALAN JALAN */  
	
:- dynamic(i_am_at/1).
:- retractall(at(_, _)), retractall(i_am_at(_)), retractall(alive(_)).
	
walk(mabes_polri,n,ruang_kapolri).
walk(mabes_polri,e,jalan_in_aja).
walk(mabes_polri,s,jalan_kesepian).
	
walk(ruang_kapolri,s,mabes_polri).
walk(ruang_kapolri,w,gudang_senjata).
walk(ruang_kapolri,n,ruang_kenaikan_pangkat).
walk(ruang_kapolri,e,kantin_kapolri).
	
walk(jalan_in_aja,s,markas_copet_pasar).
walk(jalan_in_aja,w,mabes_polri).
	
walk(ruang_kenaikan_pangkat,s,ruang_kapolri).
	
walk(gudang_senjata,e,ruang_kapolri).
	
walk(kantin_kapolri,w,ruang_kapolri).
	
walk(markas_copet_pasar,w,jalan_kesepian).
walk(markas_copet_pasar,n,jalan_in_aja).
walk(markas_copet_pasar,s,pasar).
	
walk(jalan_kesepian,w,perempatan_kuy).
walk(jalan_kesepian,n,mabes_polri).
walk(jalan_kesepian,s,kantor_pasar).
walk(jalan_kesepian,e,markas_copet_pasar).
	
walk(pasar,n,markas_copet_pasar).
walk(pasar,e,warteg).
walk(pasar,w,kantor_pasar).
walk(pasar,s,kolong_jembatan).
	
walk(kolong_jembatan,n,pasar).
walk(kolong_jembatan,w,markas_teroris).
	
walk(warteg,w,pasar).
	
walk(kantor_pasar,e,pasar).
walk(kantor_pasar,n,jalan_kesepian).
	
walk(markas_teroris,e,kolong_jembatan).
	
walk(perempatan_kuy,e,jalan_kesepian).
walk(perempatan_kuy,n,bareskrim).
walk(perempatan_kuy,w,kebun_binatang).
walk(perempatan_kuy,s,gang_depan).
	
walk(bareskrim,s,perempatan_kuy).
walk(bareskrim,n,pasar_gelap).

walk(pasar_gelap,s,bareskrim).
walk(pasar_gelap,w,markas_mafia).
	
walk(markas_mafia,e,pasar_gelap).
	
walk(gang_depan,n,perempatan_kuy).
walk(gang_depan,w,markas_preman).
walk(gang_depan,s,rumah).
	
walk(rumah,n,gang_depan).
walk(rumah,s,kuburan_hitler).
	
walk(markas_preman,e,gang_depan).
	
walk(kuburan_hitler,n,rumah).
	
walk(kebun_binatang,e,perempatan_kuy).
walk(kebun_binatang,w,kandang_beruang).
	
walk(kandang_beruang,e,kebun_binatang).

i_am_at(mabes_polri).

n :- go(n).

s :- go(s).

e :- go(e).

w :- go(w).

u :- go(u).

d :- go(d).


/* This rule tells how to move in a given direction. */

where :-
		i_am_at(Here),
		write(Here).

go(Direction) :-
        i_am_at(Here),
        walk(Here,Direction,There),
        retract(i_am_at(Here)),
        asserta(i_am_at(There)),
        write('Im at '),
		write(There),!,
		nl.

go(_) :-
        write('You can''t go that way.').
	