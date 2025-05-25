FROM httpd:latest

LABEL maintainer="your-email@example.com"
LABEL description="Apache web server with custom website"

# Install required tools
RUN apt update -y && \
    apt install wget unzip git -y
    
RUN rm -r /usr/local/apache2/htdocs/*
# Download and extract website template
RUN wget -q https://www.tooplate.com/zip-templates/2135_mini_finance.zip && \
    unzip 2135_mini_finance.zip && \
    cp -r 2135_mini_finance/* /usr/local/apache2/htdocs/ && \
    rm -rf 2135_mini_finance.zip 2135_mini_finance

# Expose port
EXPOSE 80

