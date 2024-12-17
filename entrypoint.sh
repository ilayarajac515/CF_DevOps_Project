#!/bin/bash

# Start ColdFusion in the background
/opt/coldfusion/cfusion/bin/coldfusion start

# Wait for ColdFusion to be fully started
echo "Waiting for ColdFusion to start..."
sleep 60

# echo "Setting up datasource..."
curl -X POST http://localhost:8500/datasource.cfm

# Keep the container running
tail -f /opt/coldfusion/cfusion/logs/coldfusion-out.log
