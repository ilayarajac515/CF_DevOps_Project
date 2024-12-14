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

COPY createMSSQLDatasource.cfm /opt/coldfusion/cfusion/wwwroot/

# Extract the zip file and clean up
RUN unzip /tmp/build.zip -d /tmp/build && \
    cp -r /tmp/build/. /opt/coldfusion/cfusion/wwwroot && \
    rm -rf /tmp/build /tmp/build.zip

# Copy configuration files
# COPY neo-security.xml /opt/coldfusion/cfusion/lib/neo-security.xml 
RUN sed -i "s|<var name='admin.security.enabled'><boolean value='true'/>|<var name='admin.security.enabled'><boolean value='false'/>|g" /opt/coldfusion/cfusion/lib/neo-security.xml

COPY server.xml /opt/coldfusion/cfusion/runtime/conf/server.xml

COPY neo-datasource.xml /opt/coldfusion/cfusion/lib/neo-datasource.xml

RUN chmod 755 neo-datasource.xml

# Install necessary ColdFusion packages
RUN /opt/coldfusion/cfusion/bin/cfpm.sh install sqlserver 
RUN /opt/coldfusion/cfusion/bin/cfpm.sh install debugger
RUN /opt/coldfusion/cfusion/bin/cfpm.sh install image
RUN /opt/coldfusion/cfusion/bin/cfpm.sh install mail

# Copy datasource setup script
COPY datasource.cfm /opt/coldfusion/cfusion/wwwroot/WEB-INF/datasource.cfm

# Copy entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Expose ColdFusion server port
EXPOSE 8500

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]
