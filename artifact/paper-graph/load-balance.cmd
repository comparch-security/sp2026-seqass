set term pdfcairo color enhanced dashed font "sans,16"
set size ratio 0.50
set output "load-balance.pdf"

set datafile separator ","

# define graph
set grid ytics

set ylabel "Eviction Success Rate" offset 1.7,0
set yrang [0:1.0]

set style line 101 lt 1 lw 1 lc "black"
set border 3 back ls 101
set logscale x 2
set xrang [8:131072]
set xlabel "Number of Congruent Addresses" offset 0,0.7
set ytics nomirror out scale 0.5 offset 0.2,0
set xtics nomirror scale 0.5 offset 0,0.2 font ",16"

set key samplen 1.2 spacing .94
set key at graph 0.88, 0.7
set key box width -0.9 font ",12"

set boxwidth 0.35

# ggsci::default_aaas

plot ARG1 using 1:4  with linespoints lt 3 lw 1 pt 5 ps 0.9  lc rgb "#000000"   title "CEASER-S", \
     ARG1 using 1:16 with linespoints lt 3 lw 1 pt 3 ps 0.9  lc rgb "#3b4992"   title "Original", \
     ARG1 using 1:9  with linespoints lt 3 lw 1 pt 2 ps 0.9  lc rgb "#008b45"   title "Load Balan.", \
     ARG1 using 1:8  with linespoints lt 3 lw 1 pt 9 ps 0.9  lc rgb "#bb0021"   title "+ Reloc."
