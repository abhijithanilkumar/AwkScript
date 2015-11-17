# AwkScript

Awk Script to plot `Sent Packet Summary` and `Received Packet Summary` graphs using awk, gnuplot and julia.

# Setup

1. Install `julia` on your system. Refer [this](http://julialang.org/) link.
2. Open `julia` by executing `$ julia`.
3. Now add the package `Gadfly` : `julia> Pkg.add("Gadfly")`
4. Move to the project folder, execute the shell script providing the path to wireshark trace as command line argument
    `$ sh udp_wireshark.sh <path_to_wireshark_trace>`
5. The plotted graphs are saved to Awk/Results folder.
