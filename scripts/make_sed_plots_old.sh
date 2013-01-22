#loop thorugh numbers
for i in {1..47}
do 
#say which galaxy is processing
echo "Galaxy $i" 

fits=()
for i in {2..65}
do
	i1=(`awk 'FNR==38 {print -1*$i}' spectra.dat`)
	i2=(`awk 'FNR==62 {print -1*$i}' spectra.dat`)
	i3=(`awk 'FNR==87 {print -1*$i}' spectra.dat`)
	i4=(`awk 'FNR==100 {print -1*$i}' spectra.dat`)
	i5=(`awk 'FNR==176 {print -1*$i}' spectra.dat`) 
done	

echo `$i1`

#create gnuplot settings and save to temp file
echo "
set terminal postscript eps enhanced color font 'Helvetica,10'
set output 'gal`echo $i`.eps'
set title 'Galaxy `echo $i`'
set key left
set logscale x
set xrange [1.0:30]
set xtics auto
plot 'spectra.dat' using 1:(\$2-1) with lines lt rgb \"grey\" linewidth 2.5 notitle, 'spectra.dat' using 1:(\$64+1.05) with lines lt rgb \"grey\" linewidth 2.5 notitle, 'spectra.dat' using 1:24 with lines lt rgb \"grey\" title 'Model', \"\< awk '{if(\$1==`echo $i`) print \$2,\$3}' galaxies.csv\" using 1:(\$2-`echo $offset`) with points ps 2 pt 7 lt rgb \"red\" title 'Galaxy `echo $i`'
" >> _temp.gnu

#run gnuplot and remove temp file
gnuplot _temp.gnu
rm _temp.gnu
done                  
