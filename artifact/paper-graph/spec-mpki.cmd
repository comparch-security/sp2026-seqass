set term pdfcairo color enhanced dashed font "sans,10"
set output "spec-mpki.pdf"

set datafile separator ","


# define graph
set grid ytics
#set style line 101 lt 1 lw 1 lc "black"
#set border 15 front ls 101

set multiplot layout 5,1

############# plot MPKI #######################
set tmargin 0
set bmargin 0
set rmargin 2.5
set lmargin 5.5
set size ratio 0.120

set noxtics
set xrange [-0.3:23.9]

set ylabel "MPKI Overhead" offset 3,-0.1 font ",7"
set ytics nomirror out scale 0.1 offset 0.7,0 font ",7"
set ytics -1.0,0.1,2.0
set yrange [-0.55:0.33]
set key samplen 1.2 maxrow 1  at 16.7,-0.41 spacing .95 font ",7"

set boxwidth 0.10

set label 1 "14.04" at 2.0,0.27 tc rgb "#3b4992" font ",6"
set label 2 "0.48"  at 3.2,0.27 tc rgb "#008b45" font ",6"
set label 3 "0.38"  at 6.4,0.27 tc rgb "#631879" font ",6"
set label 4 "-0.69" at 18.2,-0.5 tc rgb "#008b45" font ",6"
set label 5 "-0.85" at 19.75,-0.5 tc rgb "#bb0021" font ",6"
set label 6 "(a)"   at 24.1,-0.1 tc rgb "black" font ",7"

plot \
ARG1 using ($1+0.00):($9/$4 - 1.0)   with boxes fillstyle pattern 3 lw 0      lc rgb "#3b4992"  title "SP2021", \
ARG1 using ($1+0.12):($14/$4 - 1.0)  with boxes fillstyle pattern 3 lw 0      lc rgb "#008b45"  title "CEASER-S", \
ARG1 using ($1+0.24):($19/$4 - 1.0)  with boxes fillstyle pattern 2 lw 0      lc rgb "#631879"  title "Chameleon", \
ARG1 using ($1+0.36):($24/$4 - 1.0)  with boxes fillstyle pattern 3 lw 0      lc rgb "#707170"  title "Mirage-50", \
ARG1 using ($1+0.48):($29/$4 - 1.0)  with boxes fillstyle pattern 2 lw 0      lc rgb "#8c8b8c"  title "Mirage-75", \
ARG1 using ($1+0.60):($34/$4 - 1.0)  with boxes fillstyle pattern 3 lw 0      lc rgb "#bb0021"  title "SeqAss"

############# plot Mem APKI #######################
set tmargin 0
set bmargin 0
set rmargin 2.5
set lmargin 5.5
set size ratio 0.120

set noxtics
set xrange [-0.3:23.9]

set ylabel "Mem Acc. Overhead" offset 3,-0.1 font ",6"
set ytics nomirror out scale 0.1 offset 0.7,0 font ",7"
set ytics -1.0,0.1,2.0
set yrange [-0.6:0.33]
set key samplen 1.2 maxrow 1  at 16.7,-0.45 spacing .95 font ",7"

set boxwidth 0.10

set label 1 "9.74"  at 2.2,0.27 tc rgb "#3b4992" font ",6"
set label 2 "0.45"  at 3.2,0.27 tc rgb "#008b45" font ",6"
set label 3 "0.35"  at 6.4,0.27 tc rgb "#631879" font ",6"
set label 4 "-0.70" at 18.2,-0.54 tc rgb "#008b45" font ",6"
set label 5 "-0.85" at 19.75,-0.54 tc rgb "#bb0021" font ",6"
set label 6 "(b)"   at 24.1,-0.15 tc rgb "black" font ",7"

plot \
ARG1 using ($1+0.00):($11/$6 - 1.0)   with boxes fillstyle pattern 3 lw 0      lc rgb "#3b4992"  title "SP2021", \
ARG1 using ($1+0.12):($16/$6 - 1.0)  with boxes fillstyle pattern 3 lw 0      lc rgb "#008b45"  title "CEASER-S", \
ARG1 using ($1+0.24):($21/$6 - 1.0)  with boxes fillstyle pattern 2 lw 0      lc rgb "#631879"  title "Chameleon", \
ARG1 using ($1+0.36):($26/$6 - 1.0)  with boxes fillstyle pattern 3 lw 0      lc rgb "#707170"  title "Mirage-50", \
ARG1 using ($1+0.48):($31/$6 - 1.0)  with boxes fillstyle pattern 2 lw 0      lc rgb "#8c8b8c"  title "Mirage-75", \
ARG1 using ($1+0.60):($36/$6 - 1.0)  with boxes fillstyle pattern 3 lw 0      lc rgb "#bb0021"  title "SeqAss"

############# plot RPGI #######################

set ylabel "Relocation PKI" offset 5,0.1
set ytics (0.001,0.01, 0.1, 1, 10) font ",7"
set yrange [0.001:100]
set logscale y 10
set key samplen 1.2 maxrow 2  at 21,95 spacing .90 font ",7"

set label 1 "0.128" at -5,0.10 rotate by -90 tc rgb "#2040ff" font ",7"

set label 1 "9.74"  at -10,0.44 rotate by -90 tc rgb "#3b4992" font ",6"
set label 2 "0.45"  at -10,0.44 rotate by -90 tc rgb "#008b45" font ",6"
set label 3 "-0.54" at -10,-0.23 rotate by -90 tc rgb "#3b4992" font ",6"
set label 4 "-0.70" at -10,-0.23 rotate by -90 tc rgb "#008b45" font ",6"
set label 5 "-0.85" at -10,-0.23 rotate by -90 tc rgb "#bb0021" font ",6"
set label 6 "(c)"   at 24.1,0.15 tc rgb "black" font ",7"

plot \
ARG1 using ($1+0.00):($10)  with boxes fillstyle pattern 3 lw 0      lc rgb "#3b4992"  title "SP2021", \
ARG1 using ($1+0.12):($15)  with boxes fillstyle pattern 3 lw 0      lc rgb "#008b45"  title "CEASER-S", \
ARG1 using ($1+0.24):($20)  with boxes fillstyle pattern 2 lw 0      lc rgb "#631879"  title "Chameleon", \
ARG1 using ($1+0.36):($25)  with boxes fillstyle pattern 3 lw 0      lc rgb "#707170"  title "Mirage-50", \
ARG1 using ($1+0.48):($30)  with boxes fillstyle pattern 2 lw 0      lc rgb "#a0a1a0"  title "Mirage-75", \
ARG1 using ($1+0.60):($35)  with boxes fillstyle pattern 3 lw 0      lc rgb "#bb0021"  title "SeqAss"

############# plot power #######################

set xtics nomirror out scale 0
set xtics rotate by -50 offset 0.1,0.3 font ",7"

set ylabel "Power Overhead" offset 4,-0.3
set ytics (0.01,0.05,0.1,0.5) font ",7"
set yrange [0.01:0.8]
set logscale y 10
set key samplen 1.2 maxrow 1 at 23,0.7 spacing .90 font ",7"
set label 6 "(d)"   at 24.1,0.08 tc rgb "black" font ",7"

plot \
ARG1 using ($1+0.00):($12/$7 - 1.0)  with boxes fillstyle pattern 3 lw 0      lc rgb "#3b4992"  title "SP2021", \
ARG1 using ($1+0.12):($17/$7 - 1.0)  with boxes fillstyle pattern 3 lw 0      lc rgb "#008b45"  title "CEASER-S", \
ARG1 using ($1+0.24):($22/$7 - 1.0):xticlabels(2)  with boxes fillstyle pattern 2 lw 0      lc rgb "#631879"  title "Chameleon", \
ARG1 using ($1+0.36):($27/$7 - 1.0)  with boxes fillstyle pattern 3 lw 0      lc rgb "#707170"  title "Mirage-50", \
ARG1 using ($1+0.48):($32/$7 - 1.0)  with boxes fillstyle pattern 2 lw 0      lc rgb "#8c8b8c"  title "Mirage-75", \
ARG1 using ($1+0.60):($37/$7 - 1.0)  with boxes fillstyle pattern 3 lw 0      lc rgb "#bb0021"  title "SeqAss"

############# plot label #######################
set tmargin 5
set bmargin 0

set border 15 front lc "white"
set size ratio 0.00001

set noxtics

set noylabel
set noytics
set yrange [0.0001:0.01]
set nokey

set label 1 "0.128" at -5,0.10 rotate by -90 tc rgb "#2040ff" font ",7"
set label 6 ""   at -10,0.08 tc rgb "black" font ",7"

plot \
ARG1 using ($1+0.00):($1-$1) with boxes fillstyle pattern 3 lw 0      lc rgb "#808080"  notitle "static"

############# end plot #######################

unset multiplot
