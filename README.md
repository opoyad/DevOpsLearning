# DevOpsLearning
Personal Learning 
# Server Stats Script

`server-stats.sh` is a lightweight Bash script to quickly analyze basic server performance statistics on any Linux system.  
It provides an overview of CPU, memory, disk usage, and identifies the most resource-intensive processes.  

---
## 🌐 Project URL

https://github.com/opoyad/DevOpsLearning/server-stats


---
## 📊 Features

- **CPU Usage**  
  Displays total CPU usage vs idle percentage.

- **Memory Usage**  
  Shows total, used, free, and usage percentage.

- **Disk Usage**  
  Summarizes total, used, available space, and percentage.

- **Top Processes**  
  - Top 5 processes by CPU usage  
  - Top 5 processes by memory usage  

- **System Info (Stretch Goal)**  
  - OS version  
  - Uptime and load average  
  - Logged-in users  
  - Recent failed login attempts (if `auth.log` or `secure` logs exist)  

---

## 🚀 Usage

### 1. Clone or copy the script
Save the script as `server-stats.sh`.

### 2. Make the script executable
```bash
chmod +x server-stats.sh
