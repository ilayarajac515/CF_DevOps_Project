# Step 1: Use a base image with CommandBox
FROM ortussolutions/commandbox:latest

# Step 2: Copy your zip file to the container
COPY build /app/build

# Step 3: Set the working directory
WORKDIR /app

# Step 4: Extract the zip file (Linux command)
#RUN unzip build.zip -d /app/

# Step 5: Define environment variables (if needed)
ENV BOX_SERVER_WEB_PORT=8080

# Step 6: Run the ColdFusion server using CommandBox
CMD ["box", "server", "start"]
