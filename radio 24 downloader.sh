#!/bin/bash
clear
echo -e "Cosa vuoi scaricare?"
echo -e "[0] **Ascolta la diretta (devi avere VLC installato)**"
echo -e "[1] La zanzara"
echo -e "[2] Focus economia"
echo -e "[3] 2024"
echo -e "[4] Melog"
echo -e "[5] Rassegna stampa"
echo -e "[6] Uno, nessuno, 100milan"
read num
case $num in
	0)
	vlc https://radio24-lh.akamaihd.net/i/radio24_1@99307/master.m3u8 &
	exit
	;;
	1)
	prog="lazanzara"
	;;
	2)
	prog="focus-economia"
	;;
	3)
	prog="2024"
	;;
	4)
	prog="melog"
	;;
	5)
	prog="24mattino-rassegna-stampa"
	;;
	6)
	prog="uno-nessuno-100milan"
	;;
	*)
	echo "Scelta non valida"
	exit
	;;
esac
prefisso="https://podcast-radio24.ilsole24ore.com/radio24_audio/"
estensione=".mp3"
clear
echo -e "Vuoi scaricare la puntata di oggi? [S/N]"
read yn
case $yn in
	S | s)
	anno=$(date +%Y)/
	aammgg=$(date +%y%m%d)-
	;;
	*)
	echo -e "inserisci l'anno (aaaa)"
	read temp_anno
	temp_aa=${temp_anno:2:2}
	clear
	echo -e "inserisci il mese (mm)"
	read temp_mese
	clear
	echo -e "inserisci il giorno (gg)"
	read temp_giorno
	clear

	anno="$temp_anno/"
	aammgg="$temp_aa$temp_mese$temp_giorno-"
	;;
esac

LINK=$prefisso$anno$aammgg$prog$estensione
wget -U "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36" $LINK
