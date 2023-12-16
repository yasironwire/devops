# Use Ubuntu as the base image
FROM ubuntu:latest

# Label for maintainer information
LABEL maintainer="Yasir Butt yasir@onwire.pk"

# Update the package index and install Nginx
RUN apt-get update && \
    apt-get install -y nginx && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create a directory to store the HTML file
# RUN mkdir -p /usr/share/nginx/html

# Copy the local HTML file to the container
COPY index.html /var/www/html

# Expose port 80 for Nginx
EXPOSE 80

# Command to start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
