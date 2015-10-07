BEGIN{
    file_name = ARGV[1]
    interval = 0.25
    sent = "./Results/Sent.txt"
    recv = "./Results/Received.txt"
	sent_p[0] = 0
}

{
	if($5 == "UDP" && $3 == client)
	{
		sent_p[int($2/interval)+1]+=1
	}

	if($5 == "UDP" && $4 == client)
	{
		recv_p[int($2/interval)+1]+=1
	}
}

END{

	printf "\n\nSent Packet Summary\n" > sent
	printf "\n\nRecevied Packet Summary\n" > recv

	for (count = 1; count <= 18; count++)
	{
		printf "-" > sent
		printf "-" > recv
	}
	
	printf "\n" > sent
	printf "\n" > recv

	printf "  Time   " > sent
	printf "  Time   " > recv

	printf " Client " > sent
	printf " Client " > recv

	printf "\n" > sent
	printf "\n" > recv

	for (count = 1; count <= 18; count++)
	{
		printf "-" > sent
		printf "-" > recv
	}
	
	printf "\n" > sent
	printf "\n" > recv

	for(i=1;i<=10/interval;++i)
	{
		sent_p[i] = sent_p[i] + sent_p[i-1]
		recv_p[i] = recv_p[i] + recv_p[i-1]
	}

	for(i=0;i<=10/interval;++i)
	{
		printf "%7.3f", i*interval > sent
		printf "%7.3f", i*interval > recv
		printf "%7d", sent_p[i] > sent
		printf "%7d", recv_p[i] > recv
		printf "\n" > sent
		printf "\n" > recv
	}
	system("gnuplot sent.plt")
	system("gnuplot recv.plt")
}


    
