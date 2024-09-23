markdown
Copy code
# Prometheus Installation on Ubuntu VM

This guide provides step-by-step instructions for installing and running Prometheus on an Ubuntu VM.

## Prerequisites
- Ubuntu VM
- `wget` installed
- Basic knowledge of terminal operations

### Step 1: Update System Packages
Make sure your system is up to date.

```bash
sudo apt update
sudo apt upgrade -y
Step 2: Download Prometheus Binary
Find the latest release of Prometheus from the official release page and replace x.y.z with the latest version number.

bash
Copy code
wget https://github.com/prometheus/prometheus/releases/download/vx.y.z/prometheus-x.y.z.linux-amd64.tar.gz
Step 3: Extract the Prometheus Files
bash
Copy code
tar xvf prometheus-x.y.z.linux-amd64.tar.gz
cd prometheus-x.y.z.linux-amd64
Step 4: Configure Prometheus
Edit the prometheus.yml configuration file to define your scrape targets.

bash
Copy code
sudo nano prometheus.yml
Update the prometheus.yml to add your client VMs running Node Exporter in the static_configs section:

yaml
Copy code
scrape_configs:
  - job_name: "node_exporter"
    static_configs:
      - targets: ['<ANSIBLEVM1_IP>:9100', '<ANSIBLEVM2_IP>:9100']
Replace <ANSIBLEVM1_IP> and <ANSIBLEVM2_IP> with the IP addresses of your client VMs.

Step 5: Run Prometheus in the Background
Run Prometheus as a background process using nohup.

bash
Copy code
nohup ./prometheus --config.file=prometheus.yml &
nohup keeps the process running even after you log out.
& runs the process in the background.
Check the logs in nohup.out:

bash
Copy code
tail -f nohup.out
Step 6: Open Ports 9090 and 9100
Ensure ports 9090 (for Prometheus UI) and 9100 (for Node Exporter metrics) are open.

bash
Copy code
sudo ufw allow 9090/tcp
sudo ufw allow 9100/tcp
sudo ufw reload
Step 7: Access Prometheus UI
You can access the Prometheus web interface by visiting:

arduino
Copy code
http://<YOUR_PROMETHEUS_VM_IP>:9090
Step 8: Verify Targets
Check that Prometheus is scraping your client VMs by visiting:

arduino
Copy code
http://<YOUR_PROMETHEUS_VM_IP>:9090/targets
If the setup is correct, the status will be UP for your targets.

Conclusion
You have successfully set up Prometheus on your Ubuntu VM and are now ready to monitor Node Exporter clients.