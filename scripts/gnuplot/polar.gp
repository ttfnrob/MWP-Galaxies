set terminal postscript eps size 5.5,3 enhanced color font 'Times,14'
#set terminal aqua size 1100,600
set output '../../figures/polar.eps'
unset border
set polar
set angles degrees #set gnuplot on degrees instead of radians

set style line 10 lt 1 lc 0 lw 0.3

set grid polar 20
set grid ls 10

set xrange [-0.2:0.2] #make gnuplot to go until 6000
set yrange [0:0.2]

set xtics axis #disply the xtics on the axis instead of on the border
set ytics axis

set xtics scale 0
set ytics 0,.5,1
set ytics 0,.1,0.2

set lmargin at screen 0.01
set rmargin at screen 0.99
set bmargin at screen 0.05
set tmargin at screen 0.98

set size ratio 0.5 
unset key
#set title "Galaxy Locations"
set style data points
plot 'gals_z.csv' using ($4+90):5