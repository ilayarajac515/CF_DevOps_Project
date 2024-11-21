FROM ortussolutions/commandbox:5.x  # Specific version

# Install unzip utility
RUN apt-get update && apt-get install -y unzip

# Copy build.zip
COPY build.zip /app/build.zip

# Set working directory
WORKDIR /app

# Extract zip file
RUN unzip build.zip -d /app/

# Define server port
ENV BOX_SERVER_WEB_PORT=8080

# Start ColdFusion server
CMD ["box", "server", "start", "cfengine=lucee@5", "--console"]
