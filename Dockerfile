FROM ubuntu:latest
RUN apt-get update && apt upgrade -y

#install certbot
RUN apt-get install software-properties-common -y
RUN add-apt-repository universe
RUN add-apt-repository ppa:certbot/certbot
RUN apt-get update
RUN apt-get install certbot python-certbot-nginx -y

#install nginx and website
RUN apt-get install nginx curl -y
RUN rm /var/www/html/index.nginx-debian.html
COPY ./index.html /var/www/html/
EXPOSE 80:80
CMD ["service", "nginx", "start"]