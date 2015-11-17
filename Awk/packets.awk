BEGIN{
    file_name_1 = ARGV[1]
    file_name_2 = ARGV[2]
    file_name_3 = ARGV[3]
    interval = 0.25
    sent = "./Awk/Results/Sent.txt"
    recv = "./Awk/Results/Received.txt"
    print file_name_1
    print file_name_2
    print file_name_3
    #client="192.168.1.100"
    #tend = 19
}

{
    if(FILENAME == file_name_1)
    {
        if($1 == "Time")
            tend = int($2)
        if($1 == "Client")
            client = $2
    }
    if(FILENAME == file_name_2)
    {
        domain[$2] = int($1)
        value[int($1)] = $3 
    }
    if(FILENAME == file_name_3)
    {
        total_nodes = 0
        for (a in value)
            total_nodes++
        print total_nodes
	    if($5 == "UDP" && $3 == client)
	    {
            if($4 in domain)
            {
	            var = domain[$4] 
            }
            else
            {
                domain[$4] = total_nodes
                value[total_nodes] = $4
                var = domain[$4]
            }
            sent_p[int($2/interval)+1,var]+=1
        }
	    if($5 == "UDP" && $4 == client)
	    {
            if($3 in domain)
            {
                var = domain[$3]
            }
            else
            {
                domain[$3] = total_nodes
                value[total_nodes] = $3
                var = domain[$3]
            }
		    recv_p[int($2/interval)+1,var]+=1
	    }
    }
}

END{
    

	printf "  Time   " > sent
	printf "  Time   " > recv

    for (node = 0; node < total_nodes; node++)
    {
        printf " %s ", value[node] > sent
        printf " %s ", value[node] > recv
    }
	printf "\n" > sent
	printf "\n" > recv
	 
	for(node=0;node<total_nodes;++node)
	{
        for(tstep=0;tstep<=(tend/interval);++tstep)
        {
		    sent_p[tstep,node] = sent_p[tstep,node] + sent_p[tstep-1,node]
		    recv_p[tstep,node] = recv_p[tstep,node] + recv_p[tstep-1,node]
        }
	}

	for(i=0;i<=tend/interval;++i)
	{
		printf "%7.3f", i*interval > sent
		printf "%7.3f", i*interval > recv
        for(node=0;node<total_nodes;++node)
        {
		    printf "%7d", sent_p[i,node] > sent
		    printf "%7d", recv_p[i,node] > recv
        }
		printf "\n" > sent
		printf "\n" > recv
	}

	system("gnuplot -persist -e \"n="total_nodes"\" ./Awk/sent.plt")
    system("julia ./Awk/sent.jl")
    system("julia ./Awk/recv.jl")
	system("gnuplot -persist -e \"n="total_nodes"\" ./Awk/recv.plt")
}


    
