

# Base Image
FROM adobecoldfusion/coldfusion2021:latest

# Accept EULA and set default environment variables
ENV acceptEULA=YES
ENV adminPassword="Admin@123"
ENV enableSecureProfile=NO

# Set working directory
WORKDIR /opt/coldfusion/cfusion/wwwroot

# Create /tmp (optional but not necessary)
RUN mkdir -p /tmp

# Update apt and install necessary packages (including vim)
RUN apt-get update && apt-get install -y unzip vim

# Copy the build.zip file into the container
COPY build.zip build.zip

# Extract the zip file and clean up
RUN unzip build.zip -d . && cp -r build/. . && rm -rf build build.zip

# Expose ColdFusion server port
EXPOSE 8500

# Update `neo-security.xml` to disable admin security (password disable)
RUN sed -i "s|<var name='admin.security.enabled'><boolean value='true'/>|<var name='admin.security.enabled'><boolean value='false'/>|g" /opt/coldfusion/cfusion/lib/neo-security.xml

# Modify `server.xml` context tag to set docBase correctly
RUN sed -i "s|docBase=\"/app\"|<Context path=\"\" docBase=\"/opt/coldfusion/cfusion/wwwroot\" allowLinking=\"true\" listings=\"true\">|g" /opt/coldfusion/cfusion/runtime/conf/server.xml

WORKDIR /opt

# Install required packages (sqlserver, debugger, image, mail) using cfpm.sh
RUN /opt/coldfusion/cfusion/bin/cfpm.sh install sqlserver debugger image mail

# Set up data source using admin API (password removed for security)
COPY datasource.cfm /tmp/datasource.cfm

# Run the datasource configuration script
RUN /bin/bash -c 'cfexecute="/bin/bash /tmp/datasource.cfm"'

# Clean up temporary files
RUN rm -f /tmp/datasource.cfm

# Final CMD to start ColdFusion server
CMD ["/opt/coldfusion/cfusion/bin/coldfusion", "start"]
