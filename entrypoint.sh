#!/bin/bash

# Start ColdFusion in the background
/opt/coldfusion/cfusion/bin/coldfusion start

# Wait for ColdFusion to be fully started
echo "Waiting for ColdFusion to start..."
sleep 60

# Execute the datasource setup script
# echo "Setting up datasource..."
# curl -X POST http://localhost:8500/datasource.cfm

# Wait for ColdFusion to fully start
while ! curl -s http://localhost:8500/CFIDE/administrator/index.cfm > /dev/null; do
    echo "Waiting for ColdFusion to be ready..."
    sleep 5
done


# Keep the container running
tail -f /opt/coldfusion/cfusion/logs/coldfusion-out.log
