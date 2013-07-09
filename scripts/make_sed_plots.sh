  #loop thorugh numbers
for i in {1..43}
do 
#say which galaxy is processing
echo "Galaxy $i" 
export offset=(`awk 'FNR==62 {print -1*$24}' ../data/dale_spectra.dat`+`awk 'FNR==38 {print -1*$24}' ../data/dale_spectra.dat`)/2.0

#create gnuplot settings and save to temp file
echo "
set terminal postscript eps enhanced color font 'Times,18'
set output '../figures/seds/gal`echo $i`.eps'
set title 'Galaxy `echo $i`'
unset title
set lmargin at screen 0.0
set rmargin at screen 1.0
set bmargin at screen 0.0
set tmargin at screen 0.98
set key left
unset key
set logscale x
set xrange [1.8:35]
set yrange [-31.5:-28.5]
unset ytics
set xtics (1,2,3,4,5,6,7,8,9,10,20,30) in offset 0,3
set x2label offset 0,-2.5 'Wavelength / {/Symbol m}m'
set ylabel offset 3,0 'Normalised Flux / Jy'
plot '../data/dale_spectra.dat' using 1:(\$2-1) with lines lt rgb \"grey\" linewidth 2.5 notitle, '../data/dale_spectra.dat' using 1:(\$64+1.05) with lines lt rgb \"grey\" linewidth 2.5 notitle, '../data/dale_spectra.dat' using 1:24 with lines lt rgb \"grey\" title 'Model', \"\< awk '{if(\$1==`echo $i`) print \$2,\$3}' ../data/galaxies.csv\" using 1:(\$2-`echo $offset`) with points ps 2 pt 7 lt rgb \"red\" title 'Galaxy `echo $i`'
" >> _temp.gnu

#run gnuplot and remove temp file
gnuplot _temp.gnu
rm _temp.gnu
done                  
