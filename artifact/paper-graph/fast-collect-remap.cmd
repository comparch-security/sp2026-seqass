set term pdfcairo color enhanced dashed font "sans,13"
set size ratio 0.4
set output "fast-collect-remap.pdf"

set datafile separator ","

# define graph
set grid ytics

set ylabel "No. of Usable Congruent Addr." offset 2.0,-0.5
set yrang [1:10000]
set logscale y 10

set style line 101 lt 1 lw 1 lc "black"
set border 3 back ls 101
set xrang [0:60]
set xlabel "Number of Million LLC Evictions (Represent Elapsed Time)" offset 0,0.3
set xtics nomirror
set ytics nomirror out scale 0.5 offset 0.7,0

set key horizontal maxcols 3
set key samplen 3 spacing 1
set key at graph 0.95, 0.95
set key box width 0 font ",11"

set boxwidth 0.35

plot ARG1 using ($1/1000000):($2+0.1)   with linespoints lt 3 lw 1 pt 4 ps 0.6  lc rgb "#3b4992"   title "SP2021", \
     ARG1 using ($5/1000000):($6+0.1)   with linespoints lt 3 lw 1 pt 6 ps 0.6  lc rgb "#008b45"   title "CEASER-S", \
     ARG1 using ($9/1000000):($10+0.1)  with linespoints lt 3 lw 1 pt 8 ps 0.6  lc rgb "#bb0021"   title "SeqAss"
