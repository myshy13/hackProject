#!/bin/bash

echo "this is hack tool v1.0.0"
echo "do not use the tool for malicious purposes"

clear
clear
sleep 0.1

version="1.1.1"

# Check for -v flag
while getopts "vh" opt; do
  case $opt in
    v)
      echo "Version: $version"
      exit 0
      ;;
    h)
      echo "------------------------------------------"
      echo "|Usage: hack [options]                   |"
      echo "|Options:                                |"
      echo "|  -v    Show version                    |"
      echo "|  -h    Show this help message          |"
      echo "|----------------------------------------|"
      echo "|Examples:                               |"
      echo "|  hack -v          Show version         |"
      echo "|  hack -h          Show help message    |"
      echo "|  hack             Run the hack tool    |"
      echo "------------------------------------------"
      exit 0
      ;;
  esac
done

echo "Hacking options:"

echo "  1: find all devices on the current network"
echo "  2. list all active ports on a device/ip address"
echo "  3. fetch an external IP address (and port)"
echo "  4: ping an IP address"
echo "  5: do a dns lookup for a url"
echo "  6: do a reverse dns lookup for an ip"
echo "  7. exit"

read -p "Enter your choice: " option
clear
if [ "$option" == "1" ]; then
    echo "Finding all devices on the current network..."
    arp -a
    echo "done"
fi
if [ "$option" == "2" ]; then
    read -p "Enter the device IP address: " ip_address
    echo "Listing all active ports on $ip_address..."
    nmap -sT "$ip_address"
    echo "done"
fi

if [ "$option" == "4" ]; then
    read -p "Enter the device IP address: " ping_ip
    read -p "How many 'packets': " ping_time
    echo "testing ip: $ping_ip"
    ping -c $ping_time $ping_ip
fi
if [ "$option" == "3" ]; then
    echo "Fetching external IP address and port..."
    read -p "Enter the external IP address: " external_ip
    echo "External IP: $external_ip"
    read -p "what page (eg: /home/) (press enter for none)" page
    echo "External IP: $external_ip"

    if [ -n "$page" ] && [ "${page#"/"}" = "$page" ]; then
        page="/$page"
    fi

    read -p "Enter the port number (press enter for default): " port
    if [ port != "" ]; then
        echo "using default port"
        curl $external_ip$page
    else
        echo "using specified port: $port"
        curl $external_ip:$port$page
    fi
    echo "done"
fi

if [ "$option" == "5" ]; then
    read -p "domain for dns lookup: " domain
    echo "running dns lookup for $domain"
    dig $domain +short
fi

if [ "$option" == "6" ]; then
    read -p "ip for reverse dns lookup: " ip
    echo "running reverse dns lookup for $ip"
    host $ip
fi

if [ "$option" == "7" ]; then
    clear
    exit 0
fi
    read -p "Press enter to continue..."
    clear

currentHackPath=$(which hack)
if [ "$currentHackPath" != "" ]; then
    $currentHackPath
    else 
    exit 0
fi
