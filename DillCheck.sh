#!/bin/bash

# Define the user home directory
USER_HOME="/root/dill"

# Node Mafia ASCII Art
echo "
     __             _                        __  _        
  /\ \ \  ___    __| |  ___   /\/\    __ _  / _|(_)  __ _ 
 /  \/ / / _ \  / _\` | / _ \ /    \  / _\` || |_ | | / _\` |
/ /\  / | (_) || (_| ||  __// /\/\ \| (_| ||  _|| || (_| |
\_\ \/   \___/  \__,_| \___|\/    \/ \__,_||_|  |_| \__,_|
                                                          
EN Telegram: soon..
RU Telegram: https://t.me/NodeMafia 
GitHub: https://github.com/NodeMafia
"

# Check if required components are installed, if not, install them
REQUIRED=("python3" "nohup" "curl")
for cmd in "${REQUIRED[@]}"; do
    if ! command -v $cmd &> /dev/null; then
        echo "$cmd is not installed. Installing..."
        sudo apt-get update
        sudo apt-get install -y $cmd
        if [ $? -eq 0 ]; then
            echo "$cmd installed successfully."
        else
            echo "Failed to install $cmd. Please install it manually."
            exit 1
        fi
    fi
done

# Download DillChk.py if it doesn't exist
DILL_CHK_PATH="$USER_HOME/DillChk.py"
if [ ! -f "$DILL_CHK_PATH" ]; then
    echo "Downloading DillChk.py..."
    curl -o "$DILL_CHK_PATH" https://raw.githubusercontent.com/NodeMafia/DillNodeGuide/refs/heads/main/DillChk.py
    if [ $? -eq 0 ]; then
        echo "DillChk.py downloaded successfully."
    else
        echo "Failed to download DillChk.py. Please check your internet connection."
        exit 1
    fi
fi

# Make DillChk.py executable
chmod +x "$DILL_CHK_PATH"
echo "Made $DILL_CHK_PATH executable."

# Function to start the application
start_app() {
    echo "Starting the application..."
    nohup python3 "$DILL_CHK_PATH" &
    echo "Application started. To stop it, use the option in this menu."
}

# Function to stop the application
stop_app() {
    # Get the PID of the running application
    PID=$(ps aux | grep DillChk.py | grep -v grep | awk '{print $2}')
    if [ -n "$PID" ]; then
        echo "Stopping the application with PID $PID..."
        kill $PID
        echo "Application stopped."
    else
        echo "Application is not running."
    fi
}

# Function to view logs
view_logs() {
    LOG_FILE="$USER_HOME/node_health_log.txt"
    if [ -f "$LOG_FILE" ]; then
        echo "Displaying logs:"
        tail -f "$LOG_FILE"
    else
        echo "Log file not found: $LOG_FILE"
    fi
}

# Main menu
while true; do
    echo "
    Choose an option:
    1) Start Application
    2) Stop Application
    3) View Logs
    4) Exit
    "
    read -p "Enter your choice: " choice

    case $choice in
        1)
            start_app
            ;;
        2)
            stop_app
            ;;
        3)
            view_logs
            ;;
        4)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid option, please try again."
            ;;
    esac
done
