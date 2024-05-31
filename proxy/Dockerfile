FROM nginxinc/nginx-unprivileged:1-alpine
LABEL maintainer="atunje.com"

COPY ./default.conf.tpl /etc/nginx/default.conf.tpl
COPY ./gunicorn_headers /etc/nginx/gunicorn_headers
COPY ./run.sh /run.sh

ENV LISTEN_PORT=8000
ENV APP_HOST=app
ENV APP_PORT=9000

USER root

RUN mkdir -p /vol/static && \
    mkdir -p /vol/media && \
    chmod 755 /vol && \
    chown -R nginx:nginx /vol && \
    touch /etc/nginx/conf.d/default.conf && \
    chown nginx:nginx /etc/nginx/conf.d/default.conf && \
    chmod +x /run.sh

USER nginx

# W3: These two voulme declarartions are redundant actually,
# because we have VOLUME definitions in docker-compose file already
# However, ECS tasks require that they be defined.
VOLUME /vol/static
VOLUME /vol/media

CMD ["/run.sh"]
