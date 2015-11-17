awk -f ./Awk/getdetails.awk $1
awk -f ./Awk/domainnames.awk $1
awk -f ./Awk/packets.awk ./Awk/Results/Details.txt ./Awk/Results/Domains.txt $1
