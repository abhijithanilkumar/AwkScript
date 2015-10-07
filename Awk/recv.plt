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

plot irecv every ::4 with linespoints ls 1
