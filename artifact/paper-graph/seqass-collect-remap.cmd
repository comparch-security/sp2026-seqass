set term pdfcairo color enhanced dashed font "sans,14"
set size ratio 0.4
set output "seqass-collect-remap.pdf"

set datafile separator ","

# define graph
set grid ytics

set ylabel "No. of Usable Congruent Addr." offset 1.0,-0.7
set yrang [0:80]
#set logscale y 2

set style line 101 lt 1 lw 1 lc "black"
set border 3 back ls 101
set xrang [0:80]
set xlabel "Number of Million LLC Evictions (Represent Elapsed Time)" offset 0,0.3
set xtics nomirror
set ytics nomirror out scale 0.5

set key samplen 2 spacing 1
set key at graph 0.34, 0.95
set key box width -1 font ",14"

set boxwidth 0.35

plot ARG1 using ($1/1000000):($2+0.1)   with linespoints lt 3 lw 1 pt 4 ps 0.6 lc rgb "#000000"   title "CT", \
     ARG1 using ($3/1000000):($4+0.1)   with linespoints lt 4 lw 1 pt 6 ps 0.6 lc rgb "#008b45"   title "CT-prefetch"

#ARG1 using ($5/1000000):($6+0.1)   with lines lt 3 lw 2 lc rgb "#3b4992"   title "CT-flush"

