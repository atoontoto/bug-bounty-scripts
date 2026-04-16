#!/bin/bash

echo "Input a domain"

read domain

echo "Performing subdomain recon on $domain"

subfinder -d $domain | tee subs2.txt

assetfinder network.com.tr --subs-only | tee subs1.txt | grep $domain

sort -u  subs1.txt subs2.txt > subs.txt

httpx-toolkit -l subs.txt -o live.txt


echo "Subdomain recon finished. Output file is live.txt"
