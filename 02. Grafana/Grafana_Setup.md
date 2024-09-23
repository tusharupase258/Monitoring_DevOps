---

# Grafana Installation on Ubuntu VM

This guide provides step-by-step instructions for installing and configuring Grafana on an Ubuntu VM, including setting up a data source connection to Prometheus and importing a dashboard.

## Prerequisites
- Ubuntu VM
- Basic knowledge of terminal operations

---

## Steps

### **Step 1: Install Prerequisite Packages**
Install the necessary packages:

```bash
sudo apt-get install -y apt-transport-https software-properties-common wget
```

---

### **Step 2: Import the GPG Key**
Create a directory for the GPG key and import it:

```bash
sudo mkdir -p /etc/apt/keyrings/
wget -q -O - https://apt.grafana.com/gpg.key | gpg --dearmor | sudo tee /etc/apt/keyrings/grafana.gpg > /dev/null
```

---

### **Step 3: Add Grafana Repository**
To add a repository for stable releases, run the following command:

```bash
echo "deb [signed-by=/etc/apt/keyrings/grafana.gpg] https://apt.grafana.com stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list
```

To add a repository for beta releases, run:

```bash
echo "deb [signed-by=/etc/apt/keyrings/grafana.gpg] https://apt.grafana.com beta main" | sudo tee -a /etc/apt/sources.list.d/grafana.list
```

---

### **Step 4: Update Package List**
Update the list of available packages:

```bash
sudo apt-get update
```

---

### **Step 5: Install Grafana**
To install Grafana OSS, run:

```bash
sudo apt-get install grafana
```

To install Grafana Enterprise, run:

```bash
sudo apt-get install grafana-enterprise
```

---

### **Step 6: Start the Grafana Service**
Start the Grafana service with the following commands:

```bash
sudo systemctl daemon-reload
sudo systemctl start grafana-server
```

Verify that the service is running:

```bash
sudo systemctl status grafana-server
```

---

### **Step 7: Enable Grafana to Start at Boot**
Configure the Grafana server to start at boot:

```bash
sudo systemctl enable grafana-server.service
```

---

### **Step 8: Open Port 3000**
Ensure port `3000` is open on the VM for Grafana to be accessible:

```bash
sudo ufw allow 3000/tcp
sudo ufw reload
```

---

### **Step 9: Configure Grafana Data Source for Prometheus**
1. **Access Grafana:** Open a web browser and navigate to `http://<YOUR_VM_IP>:3000`. The default login credentials are:
   - **Username:** admin
   - **Password:** admin (you will be prompted to change this on first login)

2. **Add Data Source:**
   - Click on **Configuration** (gear icon) in the left sidebar.
   - Select **Data Sources**.
   - Click on **Add data source** and choose **Prometheus**.

3. **Configure Prometheus Data Source:**
   - Set the URL to your Prometheus server (e.g., `http://<PROMETHEUS_VM_IP>:9090`).
   - Click **Save & Test** to verify the connection.

---

### **Step 10: Import a Dashboard**
1. **Access the Dashboards Section:**
   - In the left sidebar, click on the **"+"** icon and select **Import**.

2. **Import a Dashboard:**
   - You can either upload a JSON file of a dashboard or paste a Grafana dashboard ID.
   - To find public dashboards, you can visit [Grafana Dashboards](https://grafana.com/grafana/dashboards).

3. **Select the Data Source:**
   - After uploading, select the Prometheus data source you configured earlier.
   - Click **Import** to add the dashboard.

---

## Conclusion
You have successfully set up Grafana on your Ubuntu VM, connected it to Prometheus as a data source, and imported a dashboard for visualizing metrics. Enjoy monitoring your systems!

---