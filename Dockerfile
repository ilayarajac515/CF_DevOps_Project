# Use a valid base image and tag
FROM ortussolutions/commandbox:latest

# Install unzip utility
RUN apt-get update && apt-get install -y unzip

# Copy the build.zip file to the container
COPY build.zip /app/build.zip

# Set working directory
WORKDIR /app

# Extract the zip file
RUN unzip build.zip -d /app/
 
RUN cp -r build/. .

# Define server port
ENV BOX_SERVER_WEB_PORT=8080

# Start the ColdFusion server
CMD ["box", "server", "start", "host=0.0.0.0"]

