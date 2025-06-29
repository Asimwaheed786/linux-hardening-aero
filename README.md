# Linux Hardening for Aerospace Systems (Simulated Project)
This project simulates a Linux system hardening and security monitoring environment tailored for aerospace system requirements. It demonstrates practical automation of security controls, log management, vulnerability scanning, and alerting in a Linux environment.

## Technologies Used
- Bash scripting
- Python 3 (for alerting)
- 'logrotate'
- 'cron'
- Trivy (vulnerability scanner)
- UFW (firewall)
- PostgreSQL (for optional logs)
- Tested on: **Ubuntu 22.04**

## Project Overview
This project consists of several key components:

1. **Log Rotation & Disk Monitoring**  
   Automated rotation of Apache logs and disk space monitoring using Bash scripts and crontab.

2. **Simulated CVE Alerts**  
   Use of cron jobs and Python scripts to simulate vulnerability alerts and notifications.

3. **CIS Benchmark Automation**  
   Implementation of 6 priority CIS Benchmark Level 1 security controls via Bash scripting, including:  
   - Disabling root SSH login  
   - Enforcing password complexity policies  
   - Enabling and configuring the firewall (using UFW)  
   - Disabling unused filesystems  
   - Disabling Ctrl-Alt-Del reboot  
   - Setting secure permissions on critical files

4. **Vulnerability Scanning with Trivy**  
   Scanning dummy Java '.jar' artifacts for vulnerabilities using [Trivy](https://github.com/aquasecurity/trivy), and saving detailed scan reports.

5. **Distributed Alerting Simulation**  
   Emulation of sending security alerts from monitored hosts to a centralized server using Python.

## Project Structure
```bash
linux-hardening-aero/
├── apache-logrotate.conf          # Apache log rotation rules
├── cis_controls.sh                # Bash script to apply 6 CIS controls
├── crontab.txt                    # Sample crontab entries
├── cve_alert.py                   # Python script to simulate CVE alerts
├── disk_monitor.sh                # Bash script to monitor disk usage
├── dummy_artifacts/               # Sample Java .jar files for Trivy scanning
│   ├── commons-lang3-3.12.0.jar
│   └── uber-jar-6.6.0.jar
└── trivy_reports/                 # Output reports from Trivy scans
    └── report.txt
```

## How to Use
### 1. Set up Log Rotation & Disk Monitoring

- First, you must have to be inside the linux-hardening-aero directory, then copy 'apache-logrotate.conf' to '/etc/logrotate.d/' (requires root permissions).

  <pre><code> sudo cp apache-logrotate.conf /etc/logrotate.d/apache2 </code></pre>
  <pre><code> sudo logrotate -f /etc/logrotate.d/apache2 </code></pre>
  
- Run 'disk_monitor.sh' periodically via crontab to log disk usage and send warnings.
  
  <pre><code> ./disk_monitor.sh </code></pre>

### 2. Automate CIS Controls

- Run 'cis_controls.sh' as root to apply security hardening settings.

  <pre><code> ./cis_controls.sh </code></pre>
  
- Check the output logs for confirmation.

### 3. Schedule CVE Alert Simulation

- Add the provided cron job in the crontab.txt file to check for updates and run 'cve_alert.py' to simulate alerts.

### 4. Scan Artifacts with Trivy

- Place dummy Java '.jar' files inside 'dummy_artifacts/'.
- Run <pre><code> trivy fs dummy_artifacts/ > trivy_reports/report.txt </code></pre> to scan and save results.

### 5. Review Scan Reports

- Open the '.txt' files inside 'trivy_reports/' for detailed vulnerability information.

## Notes

- This project is a simulated environment designed for academic purposes.
- Scripts and configurations should be tested in safe environments such as VMs or containers.
- Adjust scripts and settings to match your system environment as needed.

## Contact

For questions or feedback, please contact Asim Waheed at waheedasim20@gmail.com

Thank You.
