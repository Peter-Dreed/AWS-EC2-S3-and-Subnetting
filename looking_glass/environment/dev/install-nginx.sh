#!/bin/bash

# Update and install Nginx
apt-get update
apt-get install -y nginx

# Create custom HTML page
cat > /var/www/html/index.nginx-debian.html <<EOL
<!DOCTYPE html>
<html>
<head>
    <title>Juju Nginx Server</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin-top: 50px;
            background-color: #f0f8ff;
        }
        h1 { color: #4b0082; }
    </style>
</head>
<body>
    <h1>🪄 Juju Nginx Server is Live! 🎉</h1>
    <p>Deployed magically with Terraform</p>
    <p>Public IP: $(curl -s http://169.254.169.254/latest/meta-data/public-ipv4)</p>
</body>
</html>
EOL

# Start and enable Nginx
systemctl start nginx
systemctl enable nginx
