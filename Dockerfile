# Step 1: Use a base image with CommandBox
FROM ortussolutions/commandbox:latest

# Step 2: Copy the zip file to the container
COPY build.zip /app/build.zip

# Step 3: Set the working directory
WORKDIR /app

# Step 4: Extract the zip file
RUN unzip build.zip -d /app/

# Step 5: Define environment variables
ENV BOX_SERVER_WEB_PORT=8080

# Step 6: Start the ColdFusion server
CMD ["box", "server", "start"]
