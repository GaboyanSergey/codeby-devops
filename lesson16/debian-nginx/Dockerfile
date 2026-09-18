FROM debian:12

RUN apt-get update && apt-get install -y nginx && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /opt/www

COPY index.html /opt/www/index.html

COPY nginx.conf /etc/nginx/sites-available/default

COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 80

ENTRYPOINT ["/start.sh"]
