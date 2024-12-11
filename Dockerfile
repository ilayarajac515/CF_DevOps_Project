# Base Image
FROM adobecoldfusion/coldfusion2021:latest
 
# Accept EULA and set default environment variables
ENV acceptEULA=YES
ENV adminPassword="Admin@123"
ENV enableSecureProfile=NO
 
# Set working directory
WORKDIR /opt/coldfusion/cfusion/wwwroot
 
# Update apt and install necessary packages
RUN apt-get update && apt-get install -y unzip vim xmlstarlet && \
    apt-get clean && rm -rf /var/lib/apt/lists/*
 
# Copy and extract the build.zip file into the container
COPY build.zip /tmp/build.zip
RUN unzip /tmp/build.zip -d /tmp/build && \
    cp -r /tmp/build/. /opt/coldfusion/cfusion/wwwroot && \
    rm -rf /tmp/build /tmp/build.zip
 
# Modify neo-security.xml to disable admin security
RUN xmlstarlet ed -u "/properties/var[@name='admin.security.enabled']/boolean/@value" \
    -v "false" /opt/coldfusion/cfusion/lib/neo-security.xml > /tmp/neo-security.xml && \
    mv /tmp/neo-security.xml /opt/coldfusion/cfusion/lib/neo-security.xml
 
RUN xmlstarlet ed \
    -u "/Server/Service/Engine/Host/Context[@path='' and @docBase]" \
    -v "/opt/coldfusion/cfusion/wwwroot" \
    -i "/Server/Service/Engine/Host" \
    -t elem -n "Context" -v "" \
    -s "/Server/Service/Engine/Host/Context[@path='']" -t attr -n "path" -v "" \
    -s "/Server/Service/Engine/Host/Context[@path='']" -t attr -n "docBase" -v "/opt/coldfusion/cfusion/wwwroot" \
    -s "/Server/Service/Engine/Host/Context[@path='']" -t attr -n "allowLinking" -v "true" \
    -s "/Server/Service/Engine/Host/Context[@path='']" -t attr -n "listings" -v "true" \
    /opt/coldfusion/cfusion/runtime/conf/server.xml > /tmp/server.xml && \
    mv /tmp/server.xml /opt/coldfusion/cfusion/runtime/conf/server.xml
 
# Install required packages (sqlserver, debugger, image, mail)
RUN /opt/coldfusion/cfusion/bin/cfpm.sh install sqlserver debugger image mail
 
# Set up data source using the Admin API
COPY datasource.cfm /opt/coldfusion/cfusion/wwwroot/WEB-INF/datasource.cfm
RUN cfexecute="bash /opt/coldfusion/cfusion/wwwroot/WEB-INF/datasource.cfm"
 
# Clean up temporary files
RUN rm -f /opt/coldfusion/cfusion/wwwroot/WEB-INF/datasource.cfm
 
# Expose ColdFusion server port
EXPOSE 8500
 
# Final CMD to start ColdFusion server
CMD ["/opt/coldfusion/cfusion/bin/coldfusion", "start"]
