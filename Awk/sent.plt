iext = ".txt"

set term png
oext = ".png"

text = "'Verdana,10'"

isent = "./Awk/Results/Sent.txt"
osent = "./Awk/Results/Sent.png"

set xtics 0.5

set output osent
set xlabel "Time (sec)"
set ylabel "No. of Packets Sent"
set title "Simulation Time Vs No. of Packets"
set key outside

plot for [i=2:n+1] isent u 1:i with lp title columnheader(i)
