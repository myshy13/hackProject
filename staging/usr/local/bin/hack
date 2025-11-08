#!/bin/bash

version="1.3.0"

# Text formatting
BOLD='\033[1m'
NC='\033[0m' # Reset formatting

# Colors
RED='\033[31m'
GREEN='\033[32m'
YELLOW='\033[33m'
BLUE='\033[34m'
CYAN='\033[36m'
MAGENTA='\033[35m'
WHITE='\033[37m'

# Bold + Colors
BOLD_RED="${BOLD}${RED}"
BOLD_GREEN="${BOLD}${GREEN}"
BOLD_YELLOW="${BOLD}${YELLOW}"
BOLD_BLUE="${BOLD}${BLUE}"
BOLD_CYAN="${BOLD}${CYAN}"
BOLD_MAGENTA="${BOLD}${MAGENTA}"
BOLD_WHITE="${BOLD}${WHITE}"   

clear
clear
sleep 0.1

echo -e "${GREEN}This is hack tool v$version${NC}"
echo -e "${BOLD_YELLOW}Do not use the tool for malicious purposes${NC}"

# Check if the first argument is "conf"
if [ "$1" == "conf" ]; then
    echo "Configuration Options:"
    echo "  1: Show version"
    echo "  2: Show help message"
    echo "  3: view your computer network interfaces (ifconfig)"
    echo "  4: Show network statistics (netstat -i)"
    echo "  5: get WIFI info (networksetup -getinfo Wi-Fi)"
    echo "  6: exit"
    read -p "Enter your choice: " conf_option
    clear
    if [ "$conf_option" == "1" ]; then
        echo "Version: $version"
    fi

    if [ "$conf_option" == "2" ]; then
        echo -e "${BOLD_BLUE}------------------------------------------${NC}"
        echo -e "${BOLD_YELLOW}|Usage: hack [options]                   |${NC}"
        echo -e "${BOLD_YELLOW}|Options:                                |${NC}"
        echo -e "${BOLD_YELLOW}|  -v    Show version                    |${NC}"
        echo -e "${BOLD_YELLOW}|  -h    Show this help message          |${NC}"
        echo -e "${BOLD_BLUE}|----------------------------------------|${NC}"
        echo "|Examples:                               |"
        echo "|  hack -v          Show version         |"
        echo "|  hack -h          Show help message    |"
        echo "|  hack conf  Show configuration options |"
        echo "|  hack             Run the hack tool    |"
        echo "------------------------------------------"
    fi

    if [ "$conf_option" == "3" ]; then
        echo "Viewing network interfaces..."
        ifconfig
    fi

    if [ "$conf_option" == "4" ]; then
        echo "Showing network statistics..."
        netstat -i
    fi

    if [ "$conf_option" == "5" ]; then
        echo "Getting WIFI info..."
        networksetup -getinfo Wi-Fi
    fi

    if [ "$conf_option" == "6" ]; then
        clear
        exit 0
    fi
    
    if [ "$conf_option" != "6" ]; then
        read -p "Press enter to continue..."
        clear
    else
        exit 0
    fi
    currentHackPath=$(which hack)
    if [ "$currentHackPath" != "" ]; then
        $currentHackPath conf
        else
        exit 0
    fi
fi

while getopts "vh" opt; do
  case $opt in
    v)
      echo "Version: $version"
      exit 0
      ;;
    h)
      echo -e "${BOLD}"
      echo "Usage: hack [options] [subcommand]"
      echo -e "Options:${NC}"
      echo "  -v    Show version"
      echo "  -h    Show this help message"
      echo -e "${BOLD}Examples:${NC}"
      echo "  hack -v          Show version"
      echo "  hack -h          Show help message"
      echo "  hack conf        Show configuration options"
      echo -e "  hack             Run the hack tool${NC}"
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
echo "  7: trace to an ip address"
echo "  8. exit"

read -p "Enter your choice: " option
clear
if [ "$option" == "1" ]; then
    echo "Finding all devices on the current network..."
    arp -l -a
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
    nslookup $domain
fi

if [ "$option" == "6" ]; then
    read -p "ip for reverse dns lookup: " ip
    echo "running reverse dns lookup for $ip"
    host $ip
fi

if [ "$option" == "7" ]; then
    read -p "ip address to trace: " trace_ip
    echo "tracing to $trace_ip"
    traceroute -q 1 $trace_ip
fi

if [ "$option" == "8" ]; then
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
