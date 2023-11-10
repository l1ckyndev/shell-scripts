#!/bin/bash

# Function to display menu
show_menu() {
    echo "-----------------"
    echo " M A I N - M E N U"
    echo "-----------------"
    echo "a) Ping host"
    echo "b) List logged users"
    echo "c) Check memory and disk usage"
    echo "d) Exit"
}

# Function to execute ping command
ping_host() {
    read -p "Enter hostname or IP address: " host
    echo "Pinging $host..."
    ping -c 4 $host
}

# Function to list logged users
list_users() {
    echo "Current logged users:"
    who
}

# Function to check memory and disk usage
check_usage() {
    echo "Memory usage:"
    free -h
    echo "Disk usage:"
    df -h
}

# Main loop
while true; do
    show_menu
    read -p "Select an option: " option
    case $option in
        a) ping_host ;;
        b) list_users ;;
        c) check_usage ;;
        d) break ;;
        *) echo "Invalid option. Please try again." ;;
    esac
done
