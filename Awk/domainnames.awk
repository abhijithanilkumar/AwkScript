BEGIN {
    domain = "./Results/Domains.txt"
    count = 0
}


{
    if($5 == "DNS")
    {
        if($9 != "response")
        {
            domreq[$NF] = $9
        }
        else
        {
            for (var in domreq)
                if(domreq[var] == $10)
                    domreq[var] = $NF
                    
        }
    }
}

END{
    for (var in domreq)
    {
        printf "%d %s %s\n", count, domreq[var], var > domain
        count++
    }
}



    
