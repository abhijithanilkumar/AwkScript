#Awk Script to get Simulation end time and Client IP
BEGIN{
    details = "./Awk/Results/Details.txt"
}
{
    if($5 == "DNS" && $9 != "response")
    {
        #Client IP = Source IP in a DNS query request        
        client = $3
    }
}
END{
    #simulation end time = time of last record
    print "Time "int($2) > details
    #write details to file
    print "Client "client > details
}
