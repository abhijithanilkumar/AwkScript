BEGIN {
    domain = "./Results/Domains.txt"
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
        printf "%75s   %15s\n", var, domreq[var] > domain
}



    
