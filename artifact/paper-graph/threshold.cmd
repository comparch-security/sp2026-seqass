set term pdfcairo color enhanced dashed font "sans,18"
set size ratio 0.7
set output "threshold.pdf"

set datafile separator ","

# define graph
set grid ytics

set ylabel "MPKI" offset 1.5,0
set yrang [0.5:0.56]

set style line 101 lt 1 lw 1 lc "black"
set border 11 front ls 101
set xtics nomirror out scale 0 5,-1,0
set xrange [-0.5:5.5]
set xlabel "Conflict Threshold (ct)" offset 0,0.3
set ytics nomirror out scale 0.5

set key samplen 1.8 spacing 1
set key at graph 0.80, 0.94
set key box width -1 font ",16"

set boxwidth 0.35

set y2tics border mirror out 0,0.1,1.0 offset -0.7,0
set y2rang [0:0.60]
set y2label "Relocation Rate" offset -2,0

plot ARG1 using 1:5:xticlabels(2) axis x1y1  with boxes fillstyle pattern 3 lw 0.5       lc rgb "#a8a8ff"  title "MPKI", \
     ARG1 using 1:7 axis x1y2  with linespoints lt 3 lw 1 pt 7 ps 1  lc rgb "#ff0000"   title "Relocation Rate"
