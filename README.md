# System Monitoring Script



This is a simple Bash script designed to gather and display various system metrics on a Linux-based system. It provides a snapshot of CPU, memory, disk, network, process, user, and load average information. It also attempts to retrieve GPU usage and name if an NVIDIA card is present.



## Features



* **CPU Usage:** Displays the overall CPU utilization percentage.

* **Total CPUs:** Shows the total number of CPU cores.

* **CPU Model:** Reports the name of the CPU model.

* **Memory Usage:** Shows the percentage of RAM currently in use.

* **Free RAM:** Displays the amount of free RAM in megabytes (MB).

* **Total RAM:** Shows the total installed RAM in megabytes (MB).

* **Disk Usage (Root Partition):** Displays the usage percentage of the root partition (`/`).

* **Free Disk (Root Partition):** Shows the amount of free disk space on the root partition.

* **Total Disk (Root Partition):** Displays the total size of the root partition.

* **GPU Usage (NVIDIA):** Shows the average utilization of the NVIDIA GPU(s) if detected. Displays "N/A" otherwise.

* **GPU Name (NVIDIA):** Reports the name of the NVIDIA GPU if detected.

* **Network Usage:** Displays the total received (RX) and transmitted (TX) data in megabytes (MB) since the last system boot.

* **Process Count:** Shows the total number of running processes.

* **User Count:** Displays the number of currently logged-in users.

* **Load Average:** Reports the system load average over the last 1, 5, and 15 minutes.

* **Running Processes (Top 5):** Lists the top 5 processes consuming the most CPU, along with their command, CPU percentage, and memory percentage.

* **Process Start Times (First 3):** Shows the command and start time of the first 3 processes listed by `ps aux`.

* **IP Address:** Displays the system's primary IPv4 address.

* **MAC Address:** Shows the system's primary MAC address.



## Prerequisites



* **Bash:** The script is written in Bash and requires a Bash interpreter.

* **Core Utilities:** It relies on standard Linux utilities such as:

    * `mpstat` (for CPU usage)

    * `free` (for memory information)

    * `df` (for disk space information)

    * `ifconfig` or `ip` (for network information)

    * `ps` (for process information)

    * `wc` (for counting)

    * `uptime` (for load average)

    * `head`, `tail`, `awk`, `sed`, `grep`, `cut` (for text manipulation)

    * `nproc` (for the number of CPUs)

* **NVIDIA Drivers (Optional):** For GPU information, NVIDIA drivers and the `nvidia-smi` utility must be installed.



## How to Use



1.  **Save the script:** Save the code to a file, for example, `system_monitor.sh`.

2.  **Make it executable:** Open your terminal and navigate to the directory where you saved the file. Then, run the command:

    ```bash

    chmod +x system_monitor.sh

    ```

3.  **Run the script:** Execute the script by running:

    ```bash

    ./system_monitor.sh

    ```

    The script will then output the gathered system information to your terminal.




