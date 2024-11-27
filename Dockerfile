# Use a valid base image and tag
FROM lucee/lucee

# Install unzip utility
RUN apt-get update && apt-get install -y unzip

WORKDIR /var/www

COPY build.zip build.zip

# Extract the zip file
RUN unzip build.zip -d . && cp -r build/. . && rm -rf build build.zip

# Define server port
ENV BOX_SERVER_WEB_PORT=8888

EXPOSE 8888

CMD ["catalina.sh", "run"]


