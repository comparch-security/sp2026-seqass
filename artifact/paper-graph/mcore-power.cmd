set term pdfcairo color enhanced dashed font "sans,10"
set output "mcore-power.pdf"

set datafile separator ","


# define graph
set grid ytics
#set style line 101 lt 1 lw 1 lc "black"
#set border 15 front ls 101

set multiplot layout 5,1

############# plot default miss rate #######################
set tmargin 0
set bmargin 0
set rmargin 2.5
set lmargin 5.5
set size ratio 0.120

set noxtics
set xrange [-0.3:20.9]

set ylabel "Miss Rate" offset 2.5,-0.1 font ",7"
set ytics nomirror out scale 0.1 offset 0.7,0 font ",7"
set ytics -1.0,0.1,2.0
set yrange [0:0.80]
set key samplen 1.2 maxrow 1  at 20.7,0.7 spacing .95 font ",8"

set boxwidth 0.20

set label 6 "(a)"   at 21.1,0.4 tc rgb "black" font ",7"

plot \
ARG1 using ($1+0.36):($7)   with boxes fillstyle pattern 2 lw 0     lc rgb "#000000"  title "Default", \

############# plot  miss rate overhead #######################
set tmargin 0
set bmargin 0
set rmargin 2.5
set lmargin 5.5
set size ratio 0.120

set noxtics
set xrange [-0.3:20.9]

set ylabel "Miss Rate Overhead" offset 3.5,0 font ",6"
set ytics nomirror out scale 0.1 offset 0.7,0 font ",6"
set ytics -1.0,0.05,2.0
set yrange [-0.05:0.18]
set key samplen 1.2 maxrow 2  at 6.5,0.165 spacing .95 font ",6"

set boxwidth 0.10

set label 1 "0.210"  at 9.5,0.166  tc rgb "#707170" font ",6"
set label 2 "0.202"  at 10.6,0.166 tc rgb "#8c8b8c" font ",6"
set label 3 "0.252"  at 18.5,0.166 tc rgb "#707170" font ",6"
set label 4 "0.201"  at 19.6,0.166 tc rgb "#8c8b8c" font ",6"
set label 6 "(b)"    at 21.1,0.06 tc rgb "black" font ",7"

plot \
ARG1 using ($1+0.00):($13/$7 - 1.0)  with boxes fillstyle pattern 3 lw 0      lc rgb "#3b4992"  title "SP2021", \
ARG1 using ($1+0.12):($19/$7 - 1.0)  with boxes fillstyle pattern 3 lw 0      lc rgb "#008b45"  title "CEASER-S", \
ARG1 using ($1+0.24):($25/$7 - 1.0)  with boxes fillstyle pattern 2 lw 0      lc rgb "#631879"  title "Chameleon", \
ARG1 using ($1+0.36):($31/$7 - 1.0)  with boxes fillstyle pattern 3 lw 0      lc rgb "#707170"  title "Mirage-50", \
ARG1 using ($1+0.48):($37/$7 - 1.0)  with boxes fillstyle pattern 2 lw 0      lc rgb "#8c8b8c"  title "Mirage-75", \
ARG1 using ($1+0.60):($43/$7 - 1.0)  with boxes fillstyle pattern 3 lw 0      lc rgb "#bb0021"  title "SeqAss"

############# plot Relocation #######################

set ylabel "Reloc. per K Acc." offset 3.5,-0 font ",6"
set ytics (1, 10, 100, 1000, 10000) font ",6"
set yrange [1:8000]
set logscale y 10
set key samplen 1.2 maxrow 1 at 20.7,6000 spacing .90 font ",6"

set label 1 ""  at -10,-10 tc rgb "#707170" font ",6"
set label 2 ""  at -10,-10 tc rgb "#8c8b8c" font ",6"
set label 3 ""  at -10,-10 tc rgb "#707170" font ",6"
set label 4 ""  at -10,-10 tc rgb "#8c8b8c" font ",6"
set label 6 "(c)"    at 21.1,80 tc rgb "black" font ",7"

plot \
ARG1 using ($1+0.00):($11/200000)  with boxes fillstyle pattern 3 lw 0      lc rgb "#3b4992"  title "SP2021", \
ARG1 using ($1+0.12):($17/200000)  with boxes fillstyle pattern 3 lw 0      lc rgb "#008b45"  title "CEASER-S", \
ARG1 using ($1+0.24):($23/200000)  with boxes fillstyle pattern 2 lw 0      lc rgb "#631879"  title "Chameleon", \
ARG1 using ($1+0.36):($29/200000)  with boxes fillstyle pattern 3 lw 0      lc rgb "#707170"  title "Mirage-50", \
ARG1 using ($1+0.48):($35/200000)  with boxes fillstyle pattern 2 lw 0      lc rgb "#a0a1a0"  title "Mirage-75", \
ARG1 using ($1+0.60):($41/200000)  with boxes fillstyle pattern 3 lw 0      lc rgb "#bb0021"  title "SeqAss"

############# plot power #######################

set xtics nomirror out scale 0
set xtics rotate by -50 offset 0.1,0.3 font ",7"

unset logscale
set ylabel "Dyn. Power Overhead" offset 2.5,-0.2
set ytics -1.0,0.2,2.0
set yrange [0:1.3]
set key samplen 1.2 maxrow 1 at 20.7,1.2 spacing .90 font ",6"

set label 6 "(d)"    at 21.1,0.6 tc rgb "black" font ",7"

plot \
ARG1 using ($1+0.00):($14/$8 - 1.0)  with boxes fillstyle pattern 3 lw 0      lc rgb "#3b4992"  title "SP2021", \
ARG1 using ($1+0.12):($20/$8 - 1.0)  with boxes fillstyle pattern 3 lw 0      lc rgb "#008b45"  title "CEASER-S", \
ARG1 using ($1+0.24):($26/$8 - 1.0):xticlabels(2)  with boxes fillstyle pattern 2 lw 0      lc rgb "#631879"  title "Chameleon", \
ARG1 using ($1+0.36):($32/$8 - 1.0)  with boxes fillstyle pattern 3 lw 0      lc rgb "#707170"  title "Mirage-50", \
ARG1 using ($1+0.48):($38/$8 - 1.0)  with boxes fillstyle pattern 2 lw 0      lc rgb "#8c8b8c"  title "Mirage-75", \
ARG1 using ($1+0.60):($44/$8 - 1.0)  with boxes fillstyle pattern 3 lw 0      lc rgb "#bb0021"  title "SeqAss"

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

set label 6 ""   at -10,0.08 tc rgb "black" font ",7"

plot \
ARG1 using ($1+0.00):($1-$1) with boxes fillstyle pattern 3 lw 0      lc rgb "#808080"  notitle "static"

############# end plot #######################

unset multiplot
