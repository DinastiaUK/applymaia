FROM nginx:alpine

# Copia o app (versão com Cal.com embed inline — sem sandbox)
COPY index.html /usr/share/nginx/html/index.html
COPY typebot_n8n.html /usr/share/nginx/html/typebot_n8n.html
COPY avatar.png /usr/share/nginx/html/avatar.png

# Copia config customizada do nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
