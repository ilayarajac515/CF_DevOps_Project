FROM ortussolutions/commandbox:latest

# App directory copy
RUN pwd

WORKDIR /app
COPY . /app

# Port expose
EXPOSE 8080

# ColdFusion server start
CMD ["box", "server", "start", "cfengine=lucee@5", "openbrowser=false"]
