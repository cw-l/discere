# What to Expect
Useful commands for the Red & Blue Teams


## Blue Team
### Detection

1. Calculate the total number of packets in a PCAP file:
`tshark -r </PATH_TO/FILENAME>.pcap | wc -l`

2. Calculate the total number of packets for specific a protocol in a PCAP file:
`tshark -r </PATH_TO/FILENAME>.pcap -Y http | wc -l`

3. Print to screen first 10 lines of a file:
`head -10 </PATH_TO/FILENAME>.log`

4. Print to screen last 10 lines of a file:
`tail -10 </PATH_TO/FILENAME>.log`

5. Find the first 5 occurrences in a file containing IP addresses starting with ’119’:
`grep -e '^119' </PATH_TO/FILENAME>.log | head -5`

6. Count the number of lines in a file containing a specific text:
`grep -i '<enter your text>' </PATH_TO/FILENAME>.log | wc -l`

7. Perform case-insensitive word search in a file:
`grep -i '<text>' </PATH_TO/FILENAME>.log`
