# Base Image
FROM adobecoldfusion/coldfusion2021:latest

# Accept EULA and set environment variables
ENV acceptEULA=YES \
    adminPassword="Admin@123" \
    enableSecureProfile=NO

# Set working directory
WORKDIR /opt/coldfusion/cfusion/wwwroot

# Update apt and install utilities
RUN apt-get update && apt-get install -y unzip vim curl && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy the build.zip file into the container
COPY build.zip /tmp/build.zip

# Extract the zip file and clean up
RUN unzip /tmp/build.zip -d /tmp/build && \
    cp -r /tmp/build/. /opt/coldfusion/cfusion/wwwroot && \
    rm -rf /tmp/build /tmp/build.zip

# Copy configuration files
COPY neo-security.xml /opt/coldfusion/cfusion/lib/neo-security.xml
COPY server.xml /opt/coldfusion/cfusion/runtime/conf/server.xml

# Install necessary ColdFusion packages
RUN /opt/coldfusion/cfusion/bin/cfpm.sh install sqlserver debugger image mail

# Copy datasource setup script
COPY datasource.cfm /opt/coldfusion/cfusion/wwwroot/WEB-INF/datasource.cfm

# Copy entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Expose ColdFusion server port
EXPOSE 8500

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]
