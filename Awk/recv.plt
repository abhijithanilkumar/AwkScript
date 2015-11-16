iext = ".txt"

set term png
oext = ".png"

text = "'Verdana,10'"

set xtics 0.5

irecv = "./Results/Received.txt"
orecv = "./Results/Received.png"

set output orecv
set xlabel "Time (sec)"
set ylabel "No. of Packets Received"
set title "Simulation Time Vs No. of Packets"
set key outside

plot for [i=2:n+1] irecv u 1:i with lp title columnheader(i)
