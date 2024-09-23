```
# Node Exporter Installation on Ubuntu VM

This guide provides step-by-step instructions for installing and running Node Exporter on Ubuntu VMs to collect system metrics.

## Prerequisites
- Ubuntu VM
- `wget` installed
- Basic knowledge of terminal operations

---

## Steps

### **Step 1: Update System Packages**
Make sure your system is up to date:

```bash
sudo apt update
sudo apt upgrade -y
```

---

### Step 2: Download Node Exporter Binary
Find the latest release of Node Exporter from the [official release page](https://prometheus.io/download/) and replace `x.y.z` with the latest version number:

```bash
wget https://github.com/prometheus/node_exporter/releases/download/vx.y.z/node_exporter-x.y.z.linux-amd64.tar.gz
```

### Step 3: Extract Node Exporter Files
Extract the downloaded Node Exporter archive:

```bash
tar xvf node_exporter-x.y.z.linux-amd64.tar.gz
cd node_exporter-x.y.z.linux-amd64
```

### Step 4: Run Node Exporter in the Background
Run Node Exporter as a background process using `nohup`:

```bash
nohup ./node_exporter &
```

- `nohup` keeps the process running even after you log out.
- `&` runs the process in the background.

To view the logs, check the `nohup.out` file:

```bash
tail -f nohup.out
```

### Step 5: Open Port 9100
Ensure port `9100` is open on the client VM for Prometheus to scrape metrics:

```bash
sudo ufw allow 9100/tcp
sudo ufw reload
```

### Step 6: Verify Node Exporter is Running
You can check that Node Exporter is running by visiting:

```
http://<CLIENT_VM_IP>:9100/metrics
```

You should see the metrics being exposed in plain text format.

## Conclusion
You have successfully set up Node Exporter on your Ubuntu VM. This VM will now expose system metrics that Prometheus can scrape for monitoring.