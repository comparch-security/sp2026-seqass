set term pdfcairo color enhanced dashed font "sans,20"
set size ratio 0.6
set output "ball-test.pdf"

set datafile separator ","

# define graph
set grid ytics

set ylabel "Eviction Success Rate" offset 1.7,0
set yrang [0:1.0]

set style line 101 lt 1 lw 1 lc "black"
set border 3 back ls 101
set logscale x 2
set xrang [1024:110000]
set xlabel "Number of Congruent Addresses" offset 0,0.7
set ytics nomirror out scale 0.5 offset 0.2,0
set xtics nomirror scale 0.5 offset 0,0.2 font ",15"

set key samplen 4 spacing 1.0
set key at graph 0.6, 0.9
set key box width 0 font ",18"

set boxwidth 0.35

# ggsci::default_aaas

plot ARG1 using 10:11 with linespoints lt 3 lw 1   pt 9  ps 1.2   lc rgb "#707170"   title "Mirage-75", \
     ARG1 using 10:12 with linespoints lt 3 lw 1   pt 8  ps 1.2   lc rgb "#bb0021"   title "SeqAss", \
     ARG1 using 10:13 with linespoints lt 3 lw 1   pt 6  ps 1.2   lc rgb "#008b45"   title "SeqAss-4bit"
     
     #ARG1 using 10:14 with linespoints lt 3 lw 1   pt 4  ps 1.2   lc rgb "#707170"   title "Mirage-SAE", \
     #ARG1 using 10:15 with linespoints lt 3 lw 1   pt 10 ps 1.5   lc rgb "#bb0021"   title "SeqAss-Reloc", \
