# Use official Nginx base image
FROM public.ecr.aws/nginx/nginx:stable-alpine

# Set working directory (optional)
WORKDIR /usr/share/nginx/html

# Remove the default Nginx index page (sometimes may result error if not removed)
RUN rm -rf ./*

# Copy your static game files into the root
COPY . /usr/share/nginx/html

# Expose HTTP port
EXPOSE 80

# Start Nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]
