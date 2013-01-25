set terminal postscript eps enhanced color font 'Times,12'
#set terminal aqua
set output '2MRS_All.eps'

unset key
#unset border
#set size ratio 0.5 

set style line 1 lt 1 lw 1 pt 1 linecolor rgb "black"
set style line 2 lt 2 lw 3 pt 2 linecolor rgb "red"
set style line 3 lt 2 lw 3 pt 1 linecolor rgb "#bbbbbb"
set style data points

set multiplot layout 2,2 rowsfirst

#BOTTOMRIGHT
set tmargin at screen 0.55; set bmargin at screen 0.10
set lmargin at screen 0.55; set rmargin at screen 0.95
set logscale x2
set logscale x
unset ytics
unset xtics
set x2range [0.001:0.2]
set xrange [0.001:0.2]
set x2tics (0.002,0.005,0.01,0.02,0.05,0.1,0.2) offset 0,-0.5
set grid x2tics lc rgb "#dddddd" lw 1 lt 0
set x2label "Redshift (z)" offset 0,-0.75
set yrange [-20:20]
set y2tics -20,5,20
set grid y2tics lc rgb "#dddddd" lw 1 lt 0
plot '2mrs/2mrscut.dat' using 3:2 ls 1, 'gals_z.csv' using 5:2 ls 2

#BOTTOMLEFT
set tmargin at screen 0.55; set bmargin at screen 0.10
set lmargin at screen 0.07; set rmargin at screen 0.55
unset logscale x
unset logscale y
set xrange [-65:65]
set xtics -60,10,60
set grid xtics lc rgb "#dddddd" lw 1 lt 2
unset x2label
unset x2tics
set xlabel "GLON / degrees" offset 0,0.5
set yrange [-20:20]
set ytics -20,5,20
unset y2tics
unset y2label
set grid ytics lc rgb "#dddddd" lw 1 lt 0
set ylabel "GLAT / degrees" offset 3,0
plot '2mrs/2mrscut.dat' using 1:2 ls 1, '2mrs/2mrscut.dat' using ($1-360):2 ls 1, 'gals_z.csv' using 4:2 ls 2

#TOPLEFT
set tmargin at screen 0.97; set bmargin at screen 0.55
set lmargin at screen 0.07; set rmargin at screen 0.55
set logscale y2
set logscale y
set xrange [-65:65]
unset xtics
unset logscale x2
unset xlabel
unset ytics
unset ylabel
set x2tics -60,10,60
set grid xtics lc rgb "#dddddd" lw 1 lt 2
set y2range [0.001:0.2]
set yrange [0.001:0.2]
set y2tics (0.002,0.005,0.01,0.02,0.05,0.1,0.2)
set grid y2tics lc rgb "#dddddd" lw 1 lt 0
set y2label "Redshift (z)" offset -2,0
set x2label "GLON / degrees" offset 0,0
plot '2mrs/2mrscut.dat' using 1:3 ls 1, '2mrs/2mrscut.dat' using ($1-360):3 ls 1, 'gals_z.csv' using 4:5 ls 2

unset multiplot