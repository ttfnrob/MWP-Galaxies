  #loop thorugh numbers
counter=$1
# counter=$(( $counter + 1 ))
for i in {"247","266","272","134","281","123","GK_25","GK_57","GK_78","GK_132","GK_376","GK_393","GK_517","GK_1456","GK_1555","GK_1665","GK_1672","GK_2034","GK_2035","GK_2343","GK_2509","GK_2812","GK_2935","GK_2948","GK_2975","GK_3168","GK_3273","GK_3319","GK_3388","GK_3494","GK_3590","GK_3746","GK_3767","GK_3874","GK_3942","GK_4036","GK_4190","GK_4191","GK_4449","GK_4832","GK_4931","GK_4972","GK_5051","GK_5219","GK_5292","GK_5313","GK_5426","--","GK_5463","GK_5488","GK_5493","GK_5722","GK_5777","GK_6016","GK_6143","GK_4766","GK_4783","GK_4794","YB_791","YB_863","RF_148","RF_181","RF_232","RF_254","RF_401","RF_483","RF_537","RF_557","RF_773","RF_819","RF_834","RF_870","RF_907","RF_948","RF_963","RF_1000","RF_1057","RF_1143","RF_1212","RF_1378","RF_1400","RF_1419","RF_1424","RF_1431","RF_1489","RF_1493","RF_1531","RF_1540","RF_1618","RF_1720","RF_1837","RF_1843","RF_1849","RF_1955","RF_1958","RF_2076","RF_2085","RF_2192","RF_2291","RF_2356","RF_2511","RF_2513","RF_2520","RF_2585","RF_2610","RF_2803","RF_2924","RF_2954","RF_3068","RF_3118","RF_3163","RF_3241","RF_3420","RF_3466","RF_3542","RF_3548","RF_3560","RF_3778","RF_3998","RF_4069","RF_4386","RF_4403","RF_4636","RF_4735","RF_4905","RF_4931","RF_4955","RF_4996","RF_5097","RF_5166","RF_5193","RF_5245","RF_5408","RF_5455","RF_5521","RF_5583","RF_5592","RF_5595","RF_5603","RF_5649","RF_5979","RF_6083","RF_6084","RF_6144","RF_6147","RF_6312","RF_6361","RF_6565","RF_6571","RF_6573","RF_6706","RF_6727","RF_6728","RF_6742","RF_6749","RF_6753","RF_6833","RF_6885","RF_6896","RF_6924","RF_6982","RF_7032","RF_7087","RF_7163","RF_7208","RF_7215","RF_7230","RF_7234","RF_7247","RF_7263","RF_7288","RF_7381","RF_7388","RF_7389","RF_7392","RF_7513","RF_7554","RF_7556","RF_7678","RF_7786","RF_8017","RF_8020","RF_8024","RF_8029","RF_8040","RF_8109","RF_8130","RF_8132","RF_8336","RF_8519","RF_8558","RF_8609","RF_8651","RF_8683","RF_8791","RF_8799","RF_9006","RF_9071","RF_9103","RF_9122","RF_9133","RF_9159","RF_9302","RF_9323","RF_9518","RF_10061","RF_10065","RF_10069","RF_10082","RF_10115","RF_10116","RF_10220","RF_10256","RF_10273","RF_10297","RF_10311","RF_10341","RF_10441","RF_10512","RF_10727","RF_10773","RF_10874","RF_10997","RF_11026","RF_11046","RF_11047","RF_11068","RF_11083","RF_11153","RF_11222","RF_11236","RF_11287","RF_11302","RF_11452","RF_11495","RF_11519","RF_11765","RF_11845","RF_11905","RF_11951","RF_12011","RF_12059","RF_12089","RF_12177","RF_12199","RF_12494","RF_12512","RF_12518","RF_12557","RF_12575","RF_12848","RF_12921","RF_12964","RF_13035","RF_13079","RF_102","RF_496","RF_948","RF_1088","RF_1493","RF_1506","RF_1774","RF_1807","RF_2126","RF_2749","RF_3038","RF_4368","RF_4813","RF_5745","RF_5780","RF_5792","RF_5822","RF_5831","RF_5843","RF_5853","RF_5862","RF_6426","RF_6438","RF_6492","RF_6548","RF_7887","RF_7904","RF_7909","RF_7928","RF_7949","RF_8856","RF_8861","RF_8964","RF_9743","RF_9762","RF_9793","RF_9809","RF_9860","RF_9920","RF_9931","RF_9963","RF_10018","RF_10025","RF_10049","RF_10061","RF_12199","RF_12321","RF_12351","RF_12368","RF_12372","RF_12421","RF_12431","RF_13160","RF_13178"}
do 
#say which galaxy is processing
echo "Galaxy $i" 
export offset=(`awk 'FNR==62 {print -1*$24}' ../data/dale_spectra.dat`+`awk 'FNR==38 {print -1*$24}' ../data/dale_spectra.dat`)/2.0

counter=$(( $counter + 1 ))
#create gnuplot settings and save to temp file
# set terminal png
# set output '../figures/newseds/gal`echo $i`.png'

echo "
set terminal postscript eps enhanced color font 'Times,16'
set output '../figures/newseds/gal`echo $i`.eps'
set title 'Candidate `echo $i`'
set lmargin at screen 0.0
set rmargin at screen 1.0
set bmargin at screen 0.0
set tmargin at screen 0.95
set key left
unset key
set logscale x
set xrange [1.8:35]
set yrange [-31.5:-28.5]
unset ytics
set xtics (1,2,3,4,5,6,7,8,9,10,20,30) in offset 0,3
set x2label offset 0,-2.5 'Wavelength / {/Symbol m}m'
set ylabel offset 3,0 'vF_v'
plot '../data/dale_spectra.dat' using 1:(\$2-1) with lines lt rgb \"grey\" linewidth 2.5 notitle, '../data/dale_spectra.dat' using 1:(\$64+1.05) with lines lt rgb \"grey\" linewidth 2.5 notitle, '../data/dale_spectra.dat' using 1:24 with lines lt rgb \"grey\" title 'Model', \"\< awk '{if(\$1==`echo $counter`) print \$3,\$4}' ../data/lambert_candidates.csv\" using 1:(\$2-`echo $offset`) with points ps 2 pt 7 lt rgb \"red\" title 'New Galaxy `echo $i`'
" >> _temp.gnu

#run gnuplot and remove temp file
gnuplot _temp.gnu
rm _temp.gnu
done                  
