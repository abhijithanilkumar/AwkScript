#Awk Script to create a mapping of Domain Names and IPs
BEGIN {
    domain = "./Awk/Results/Domains.txt"
    file_name_1 = ARGV[1]
    count = 0
}


{
    #FILENAME stores the name of the file being processed
    if(FILENAME == file_name_1)
    {
        if($5 == "DNS")
        {
            if($9 != "response")
            {
		        #if query, add it as new entry
                domreq[$NF] = $9
            }
            else
            {
		        #add the response to the corresponding domain name
                for (var in domreq)
                    if(domreq[var] == $10)
                        domreq[var] = $NF
            }
        }
    }
}
END{
    for (var in domreq)
    {
	    #write to the file
        printf "%d %s %s\n", count, domreq[var], var > domain
        count++
    }
}



    
