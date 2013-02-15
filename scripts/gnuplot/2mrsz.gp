set terminal postscript eps enhanced color font 'Times,14'
#set terminal aqua
set output '../../figures/2MRS_zlon.eps'

unset key
#unset border
#set size ratio 0.5 
set lmargin at screen 0.08
set rmargin at screen 0.99
set bmargin at screen 0.1
set tmargin at screen 0.98

set style line 1 lt 1 lw 1 pt 1 linecolor rgb "black"
set style line 2 lt 2 lw 3 pt 2 linecolor rgb "red"
set style line 3 lt 2 lw 3 pt 1 linecolor rgb "#bbbbbb"

set xrange [-65:65]
set xtics -65,5,65
set grid xtics lc rgb "#dddddd" lw 1 lt 2
set xlabel "GLON / degrees" offset 0,0.5

set yrange [0.001:0.2]
set ytics (0.001,0.002,0.003,0.004,0.005,0.01,0.02,0.03,0.04,0.05,0.1,0.2)
set grid ytics lc rgb "#dddddd" lw 1 lt 0
set ylabel "Redshift (z)" offset 3,0
set logscale y

set title "Comparison to 2MRS (Redshift)"
set style data points

plot '2mrs/2mrscut.dat' using 1:3 ls 1, '2mrs/2mrscut.dat' using ($1-360):3 ls 1, 'gals_z.csv' using 4:5 ls 2