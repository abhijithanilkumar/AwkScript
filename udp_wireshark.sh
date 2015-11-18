#Shell Script to execute the awk files and plot the graph
#Shell Script takes trace file as argument
awk -f ./Awk/getdetails.awk $1
awk -f ./Awk/domainnames.awk $1
awk -f ./Awk/packets.awk ./Awk/Results/Details.txt ./Awk/Results/Domains.txt $1
