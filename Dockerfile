# Base Image
FROM adobecoldfusion/coldfusion2021:latest
 
# Accept EULA and set environment variables
ENV acceptEULA=YES
ENV adminPassword="Admin@123"
ENV enableSecureProfile=NO
 
# Set working directory
WORKDIR /opt/coldfusion/cfusion/wwwroot
 
# Update apt and install utilities
RUN apt-get update && apt-get install -y unzip vim xmlstarlet && \
    apt-get clean && rm -rf /var/lib/apt/lists/*
 
# Copy the build.zip file into the container
COPY build.zip /tmp/build.zip
 
# Extract the zip file and clean up
RUN unzip /tmp/build.zip -d /tmp/build && \
    cp -r /tmp/build/. /opt/coldfusion/cfusion/wwwroot && \
    rm -rf /tmp/build /tmp/build.zip
 
# Modify `neo-security.xml` dynamically to disable admin security
RUN sed -i "s|<var name='admin.security.enabled'><boolean value='true'/>|<var name='admin.security.enabled'><boolean value='false'/>|g" /opt/coldfusion/cfusion/lib/neo-security.xml
 
# Modify `<Context>` tag in `server.xml` dynamically
RUN xmlstarlet ed \
    -s "//Host" -t elem -n "Context" -v "" \
    -i "//Host/Context" -t attr -n "path" -v "" \
    -i "//Host/Context" -t attr -n "docBase" -v "/opt/coldfusion/cfusion/wwwroot" \
    -i "//Host/Context" -t attr -n "WorkDir" -v "/opt/coldfusion/cfusion/runtime/conf/Catalina/localhost/tmp" \
    -i "//Host/Context" -t attr -n "allowLinking" -v "true" \
    -i "//Host/Context" -t attr -n "listings" -v "true" \
    /opt/coldfusion/cfusion/runtime/conf/server.xml > /tmp/server.xml && \
    mv /tmp/server.xml /opt/coldfusion/cfusion/runtime/conf/server.xml
 
# Install necessary ColdFusion packages
RUN /opt/coldfusion/cfusion/bin/cfpm.sh install sqlserver debugger image mail

RUN /opt/coldfusion/cfusion/bin/cfpm.sh install sqlserver debugger image mail

# Set up data source using the Admin API
COPY datasource.cfm /opt/coldfusion/cfusion/wwwroot/WEB-INF/datasource.cfm
RUN cfexecute="bash /opt/coldfusion/cfusion/wwwroot/WEB-INF/datasource.cfm"

# Expose ColdFusion server port
EXPOSE 8500
 
# Final CMD to start ColdFusion server
CMD ["/opt/coldfusion/cfusion/bin/coldfusion", "start"]
