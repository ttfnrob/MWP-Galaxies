for f2 in IRAC2_0.6ResMos/*.fits
do
	echo $f2
	export a=`echo $f2 | cut -d'/' -f2`
	echo $a

	export f2=`echo $a`
	export f3=`echo $a | sed 's/I2/I3/'`
	export f4=`echo $a | sed 's/I2/I4/'`
	export f1=`echo $a | sed 's/I2/I1/'`

	convert "IRAC4_0.6ResMos/"$f4 "IRAC3_0.6ResMos/"$f3 "IRAC2_0.6ResMos/"$f2 -resize 300x300 -combine $a".tif"

	# convert $a".tif" -level 1%,15%,0.5 $a"_1_15.jpeg" 
	convert $a".tif" -normalize $a".jpg"
	convert $a".jpg" $a"_1.eps"
	convert $a".jpg" -level 1%,30%,0.99 $a"_2.eps"
	rm $a".tif"
	rm $a".jpg"

done