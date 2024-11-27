# Use a valid base image and tag
FROM ortussolutions/commandbox:latest

# Install unzip utility
RUN apt-get update && apt-get install -y unzip

# Copy the build.zip file to the container
COPY build.zip /app/build.zip

# Copy server.json to the container
COPY need/server.json /app/server.json

# Set working directory
WORKDIR /app

# Extract the zip file
RUN unzip build.zip -d /app/
RUN cp -r build/. .

RUN rm -rf build build.zip

# Define server port
ENV BOX_SERVER_WEB_PORT=8080

EXPOSE 8080

# Start the ColdFusion server using server.json
CMD ["box", "server", "start", "cfengine=lucee@5"]


