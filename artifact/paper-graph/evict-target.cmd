set term pdfcairo color enhanced dashed font "sans,18"
set size ratio 0.5
set output "evict-target.pdf"

set datafile separator ","

# define graph
set grid ytics

set ylabel "Success Eviction Rate" offset 1.5,0
set yrang [0:1.0]

set style line 101 lt 1 lw 1 lc "black"
set border 3 back ls 101
set logscale x 2
set xrang [8:110000]
set xlabel "Number of Congruent Addresses" offset 0,0.8
set ytics nomirror out scale 0.5
set xtics nomirror scale 0.5 offset 0,0.2 font ",15"

set key samplen 4 spacing .95
set key at graph 0.72, 0.78
set key box width 0.5 font ",15"

set boxwidth 0.35

# ggsci::default_aaas

plot ARG1 using 1:2 with linespoints lt 3 lw 1 pt 2 ps 1.2  lc rgb "#000000"   title "Baseline", \
     ARG1 using 1:3 with linespoints lt 3 lw 1 pt 4 ps 1.2  lc rgb "#3b4992"   title "SP2021", \
     ARG1 using 1:4 with linespoints lt 3 lw 1 pt 6 ps 1.2  lc rgb "#008b45"   title "CEASER-S", \
     ARG1 using 1:5 with linespoints lt 3 lw 1 pt 5 ps 1.2  lc rgb "#631879"   title "Chameleon", \
     ARG1 using 1:6 with linespoints lt 3 lw 1 pt 7 ps 1.2  lc rgb "#a0a1a0"   title "Mirage-50", \
     ARG1 using 1:7 with linespoints lt 3 lw 1 pt 9 ps 1.2  lc rgb "#707170"   title "Mirage-75", \
     ARG1 using 1:8 with linespoints lt 3 lw 1 pt 8 ps 1.2  lc rgb "#bb0021"   title "SeqAss"
