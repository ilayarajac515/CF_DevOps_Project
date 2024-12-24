#!/bin/bash

# Start ColdFusion in the background
/opt/coldfusion/cfusion/bin/coldfusion start

# echo "Setting up datasource..."
curl -X POST http://localhost:8500/datasource.cfm

# Keep the container running
tail -f /opt/coldfusion/cfusion/logs/coldfusion-out.log
