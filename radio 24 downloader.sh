#!/bin/bash
clear
echo -e "Cosa vuoi scaricare?"
echo -e "[1] La zanzara"
echo -e "[2] Focus economia"
read num
case $num in
	1)
	prog="lazanzara"
	;;
	2)
	prog="focus-economia"
	;;
	*)
	echo "Scelta non valida"
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
wget -U "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)" $LINK