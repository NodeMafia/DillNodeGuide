import os
import time
import subprocess
from datetime import datetime

# Automatically determine the user's home directory
USER_HOME = os.path.expanduser("~") + "/dill"

LOG_FILE = os.path.join(USER_HOME, "node_health_log.txt")
STATUS_FILE = os.path.join(USER_HOME, "node_health_status.txt")

def log_message(message):
    with open(LOG_FILE, 'a') as log_file:
        log_file.write(f"{message}\n")

    with open(STATUS_FILE, 'w') as status_file:
        status_file.write(message)

def run_health_check():
    try:
        # Execute health_check.sh and get output
        result = subprocess.run([os.path.join(USER_HOME, "health_check.sh")], capture_output=True, text=True)
        output = result.stdout.strip()

        current_time = datetime.utcnow().strftime('%Y-%m-%d %H:%M:%S UTC')

        # Check the result
        if "Node health check passed" in output:
            log_message(f"{current_time} > Node health check passed.")
        elif "node not running" in output:
            log_message(f"{current_time} > Node not running. Restarting node...")
            # Start the node in the background using nohup
            subprocess.run(['nohup', os.path.join(USER_HOME, 'start_dill_node.sh'), '&'], cwd=USER_HOME)
        else:
            log_message(f"{current_time} > Unexpected output: {output}")
    except Exception as e:
        log_message(f"Error during health check: {e}")

def main():
    while True:
        run_health_check()
        # Wait for 15 minutes (900 seconds)
        time.sleep(900)

if __name__ == "__main__":
    main()
