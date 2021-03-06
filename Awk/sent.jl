#Plot Graphs Using Gadfly
using DataFrames, Gadfly, Colors
data1 = readtable("./Awk/Results/Sent.txt", separator=' ')
n = size(keys(data1.colindex),1)-1
cols = distinguishable_colors(n, colorant"black")
sites = keys(data1.colindex)[2:end]
Gadfly.set_default_plot_size(12inch, 6inch)
p=Gadfly.plot([layer(data1, y=sites[i],x="Time", Geom.line, Theme(default_color=cols[i],line_width=.8mm)) for i=1:n]..., Guide.XLabel("Time"),
Guide.YLabel("Number of Packets Sent"),
Guide.Title("Sent Packet Summary"),
Guide.manual_color_key("Legend", [replace(string(i),"_",".") for i in sites], cols))
draw(SVGJS("./Awk/Results/sent.svg",15inch,12inch),p)
