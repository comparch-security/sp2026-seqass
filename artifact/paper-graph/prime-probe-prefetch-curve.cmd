set term pdfcairo color enhanced dashed font "sans,18"
set size ratio 0.6
set output "prime-probe-prefetch-curve.pdf"

set datafile separator ","

# define graph
set grid ytics

set ylabel "Precision / Recall / F1 Score" offset 2.0,0
set yrang [0:1.0]

set style line 101 lt 1 lw 1 lc "black"
set border 3 back ls 101
set logscale x 2
set xrang [1:128]
set xtics offset 0,0.3
set xlabel "Number of congruent addresses" offset 0,0.8
set ytics nomirror 0,0.1,1 out scale 0.5 offset 0.6,0 
set xtics nomirror scale 0.5 offset 0,0.2

set key samplen 2 spacing .90
set key at graph 0.99, 0.39
set key box width -2 font ",14"

set boxwidth 0.35

# ggsci::default_aaas

plot ARG1 using 1:2 with linespoints lt 1 lw 1 pt 2 ps 0.8  lc rgb "#008b45"   title "CEASER-S Precision", \
     ARG1 using 1:3 with linespoints lt 2 lw 1 pt 6 ps 0.8  lc rgb "#008b45"   title "CEASER-S Recall", \
     ARG1 using 1:4 with linespoints lt 3 lw 1 pt 7 ps 0.8  lc rgb "#008b45"   title "CEASER-S F1 Score", \
     ARG1 using 1:5 with linespoints lt 1 lw 1 pt 1 ps 0.8  lc rgb "#631879"   title "Chameleon Precision", \
     ARG1 using 1:6 with linespoints lt 2 lw 1 pt 4 ps 0.8  lc rgb "#631879"   title "Chameleon Recall", \
     ARG1 using 1:7 with linespoints lt 3 lw 1 pt 5 ps 0.8  lc rgb "#631879"   title "Chameleon F1 Score"
