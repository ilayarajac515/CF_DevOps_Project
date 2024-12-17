# Base Image
FROM adobecoldfusion/coldfusion2021:latest

# Accept EULA and set environment variables
ENV acceptEULA=YES \
    adminPassword="SundarRaja" \
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
    chmod -R 777 build/Assets && \
    rm -rf /tmp/build /tmp/build.zip

# Copy configuration files
# COPY neo-security.xml /opt/coldfusion/cfusion/lib/neo-security.xml 
# RUN sed -i "s|<var name='admin.security.enabled'><boolean value='true'/>|<var name='admin.security.enabled'><boolean value='false'/>|g" /opt/coldfusion/cfusion/lib/neo-security.xml

COPY server.xml /opt/coldfusion/cfusion/runtime/conf/server.xml

# RUN sed -i '/<var name="maxcachecount">/,/<\/struct>/ { \
#     /<\/struct>/ i \
#                 <var name="BillingSystem"> \
#                     <struct type="coldfusion.server.ConfigMap"> \
#                         <var name="host"><string>51.21.135.179</string></var> \
#                         <var name="database"><string>BillingSystem</string></var> \
#                         <var name="username"><string>SA</string></var> \
#                         <var name="password"><string>Admin@123</string></var> \
#                         <var name="port"><string>1433</string></var> \
#                         <var name="driver"><string>MSSQLServer</string></var> \
#                     </struct> \
#                 </var>' /opt/coldfusion/cfusion/lib/neo-datasource.xml

# COPY neo-datasource.xml /opt/coldfusion/cfusion/lib/neo-datasource.xml

# Install necessary ColdFusion packages
RUN /opt/coldfusion/cfusion/bin/cfpm.sh install sqlserver 
RUN /opt/coldfusion/cfusion/bin/cfpm.sh install debugger
RUN /opt/coldfusion/cfusion/bin/cfpm.sh install image
RUN /opt/coldfusion/cfusion/bin/cfpm.sh install mail
RUN /opt/coldfusion/cfusion/bin/cfpm.sh install adminapi


# Copy datasource setup script
COPY datasource.cfm /opt/coldfusion/cfusion/wwwroot/datasource.cfm

# Copy entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Expose ColdFusion server port
EXPOSE 8500

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]
