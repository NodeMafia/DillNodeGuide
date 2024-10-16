import os
import time
import subprocess
from datetime import datetime

LOG_FILE = "/root/dill/node_health_log.txt"
STATUS_FILE = "/root/dill/node_health_status.txt"

def log_message(message):
    with open(LOG_FILE, 'a') as log_file:
        log_file.write(f"{message}\n")

    with open(STATUS_FILE, 'w') as status_file:
        status_file.write(message)

def run_health_check():
    try:
        # Выполнение health_check.sh и получение вывода
        result = subprocess.run(['/root/dill/health_check.sh'], capture_output=True, text=True)
        output = result.stdout.strip()

        current_time = datetime.utcnow().strftime('%Y-%m-%d %H:%M:%S UTC')

        # Проверка результата
        if "Node health check passed" in output:
            log_message(f"{current_time} > Node health check passed.")
        elif "node not running" in output:
            log_message(f"{current_time} > Node not running. Restarting node...")
            # Запуск ноды в фоновом режиме с помощью nohup
            subprocess.run(['nohup', './start_dill_node.sh', '&'], cwd='/root/dill')
        else:
            log_message(f"{current_time} > Unexpected output: {output}")
    except Exception as e:
        log_message(f"Error during health check: {e}")

def main():
    while True:
        run_health_check()
        # Ожидание 15 минут (900 секунд)
        time.sleep(900)

if __name__ == "__main__":
    main()
