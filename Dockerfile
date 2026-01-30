FROM nginx:latest
RUN rm -rf /usr/share/nginx/html/*
COPY index.html /usr/share/nginx/html/
RUN chmod 644 /usr/share/nginx/html/*
EXPOSE 80
