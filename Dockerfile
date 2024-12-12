# Base Image
FROM adobecoldfusion/coldfusion2021:latest
 
# Accept EULA and set environment variables
ENV acceptEULA=YES
ENV adminPassword="Admin@123"
ENV enableSecureProfile=NO
 
# Set working directory
WORKDIR /opt/coldfusion/cfusion/wwwroot
 
# Update apt and install utilities
RUN apt-get update && apt-get install -y unzip vim  && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# xmlstarlet
# Copy the build.zip file into the container
COPY build.zip /tmp/build.zip
 
# Extract the zip file and clean up
RUN unzip /tmp/build.zip -d /tmp/build && \
    cp -r /tmp/build/. /opt/coldfusion/cfusion/wwwroot && \
    rm -rf /tmp/build /tmp/build.zip
 
# Modify `neo-security.xml` dynamically to disable admin security
# RUN sed -i "s|<var name='admin.security.enabled'><boolean value='true'/>|<var name='admin.security.enabled'><boolean value='false'/>|g" /opt/coldfusion/cfusion/lib/neo-security.xml
 
# # Modify the <Context> tag in server.xml
# RUN xmlstarlet ed \
#     -u "//Host/Context[@path='']/@docBase" -v "/opt/coldfusion/cfusion/wwwroot" \
#     -i "//Host/Context[@path='']" -t attr -n "allowLinking" -v "true" \
#     -i "//Host/Context[@path='']" -t attr -n "listings" -v "true" \
#     -s "//Host/Context[@path='']" -t elem -n "Resources" -v "" \
#     -s "//Host/Context/Resources" -t elem -n "PreResources" -v "" \
#     -i "//Host/Context/Resources/PreResources[not(@base)]" -t attr -n "base" -v "/opt/coldfusion/cfusion/wwwroot/cf_scripts" \
#     -i "//Host/Context/Resources/PreResources[not(@className)]" -t attr -n "className" -v "org.apache.catalina.webresources.DirResourceSet" \
#     -i "//Host/Context/Resources/PreResources[not(@webAppMount)]" -t attr -n "webAppMount" -v "/cf_scripts" \
#     -s "//Host/Context/Resources" -t elem -n "PreResources" -v "" \
#     -i "//Host/Context/Resources/PreResources[last()]" -t attr -n "base" -v "/opt/coldfusion/cfusion/wwwroot/CFIDE" \
#     -i "//Host/Context/Resources/PreResources[last()]" -t attr -n "className" -v "org.apache.catalina.webresources.DirResourceSet" \
#     -i "//Host/Context/Resources/PreResources[last()]" -t attr -n "webAppMount" -v "/CFIDE" \
#     /opt/coldfusion/cfusion/runtime/conf/server.xml > /tmp/server.xml && \
#     mv /tmp/server.xml /opt/coldfusion/cfusion/runtime/conf/server.xml


COPY neo-security.xml /opt/coldfusion/cfusion/lib/neo-security.xml

COPY server.xml /opt/coldfusion/cfusion/runtime/conf/server.xml


# RUN xmlstarlet ed \
#      -u "//Host/Context[@path='']/@docBase" -v "/opt/coldfusion/cfusion/wwwroot" 

# RUN sed -i 's|/app|/opt/coldfusion/cfusion/wwwroot|g' /opt/coldfusion/cfusion/runtime/conf/server.xml

# Run sed -i 's|8500|8600|g' /opt/coldfusion/cfusion/runtime/conf/server.xml

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
