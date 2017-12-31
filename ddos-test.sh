#!/bin/bash
netstat -tn 2>/dev/null | grep :443 | awk '{print $5}' | cut -d: -f1 | sort | uniq -c | sort -nr | head > /tmp/ddos-test
conn_1=`cat /tmp/ddos-test |head -n 1 | awk '{print $1}'`
ip_1=`cat /tmp/ddos-test |head -n 1 | awk '{print $2}'`
##
if [ $conn_1 -gt 40 ]; then
##
TIME_DATE=`date +%Y-%m-%d_%H.%M.%S`
##
ip_2=`cat /tmp/ddos-test |head -n 2 | awk '{print $2}' | tail -n1`
ip_3=`cat /tmp/ddos-test |head -n 3 | awk '{print $2}' | tail -n1`
ip_4=`cat /tmp/ddos-test |head -n 4 | awk '{print $2}' | tail -n1`
ip_5=`cat /tmp/ddos-test |head -n 5 | awk '{print $2}' | tail -n1`
ip_6=`cat /tmp/ddos-test |head -n 6 | awk '{print $2}' | tail -n1`
ip_7=`cat /tmp/ddos-test |head -n 7 | awk '{print $2}' | tail -n1`
ip_8=`cat /tmp/ddos-test |head -n 8 | awk '{print $2}' | tail -n1`
ip_9=`cat /tmp/ddos-test |head -n 9 | awk '{print $2}' | tail -n1`
ip_10=`cat /tmp/ddos-test |head -n 10 | awk '{print $2}' | tail -n1`
##
whois_ip_1=`/usr/bin/whois $ip_1 | grep -iE ^country: | tail -1`
whois_ip_2=`/usr/bin/whois $ip_2 | grep -iE ^country: | tail -1`
whois_ip_3=`/usr/bin/whois $ip_3 | grep -iE ^country: | tail -1`
whois_ip_4=`/usr/bin/whois $ip_4 | grep -iE ^country: | tail -1`
whois_ip_5=`/usr/bin/whois $ip_5 | grep -iE ^country: | tail -1`
whois_ip_6=`/usr/bin/whois $ip_6 | grep -iE ^country: | tail -1`
whois_ip_7=`/usr/bin/whois $ip_7 | grep -iE ^country: | tail -1`
whois_ip_8=`/usr/bin/whois $ip_8 | grep -iE ^country: | tail -1`
whois_ip_9=`/usr/bin/whois $ip_9 | grep -iE ^country: | tail -1`
whois_ip_10=`/usr/bin/whois $ip_10 | grep -iE ^country: | tail -1`
##
echo "DDOS attack from $ip_1 -> $whois_ip_1 -> $TIME_DATE" > /tmp/ddos-alert
echo "DDOS attack from $ip_2 -> $whois_ip_2 -> $TIME_DATE" >> /tmp/ddos-alert
echo "DDOS attack from $ip_3 -> $whois_ip_3 -> $TIME_DATE" >> /tmp/ddos-alert
echo "DDOS attack from $ip_4 -> $whois_ip_4 -> $TIME_DATE" >> /tmp/ddos-alert
echo "DDOS attack from $ip_5 -> $whois_ip_5 -> $TIME_DATE" >> /tmp/ddos-alert
echo "DDOS attack from $ip_6 -> $whois_ip_6 -> $TIME_DATE" >> /tmp/ddos-alert
echo "DDOS attack from $ip_7 -> $whois_ip_7 -> $TIME_DATE" >> /tmp/ddos-alert
echo "DDOS attack from $ip_8 -> $whois_ip_8 -> $TIME_DATE" >> /tmp/ddos-alert
echo "DDOS attack from $ip_9 -> $whois_ip_9 -> $TIME_DATE" >> /tmp/ddos-alert
echo "DDOS attack from $ip_10 -> $whois_ip_10 -> $TIME_DATE" >> /tmp/ddos-alert
##
else
  echo "no find ddos attack !" > /dev/null
fi;
