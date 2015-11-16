BEGIN{
    details = "./Awk/Results/Details.txt"
}
{
    if($5 == "DNS" && $9 != "response")
    {
       client = $3
    }
}
END{
    print "Time "int($2) > details
    print "Client "client > details
}
