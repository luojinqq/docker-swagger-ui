FROM nginx:alpine

ENV SWAGGER_UI_VERSION "2.2.2"
ENV SPEC_URL 'http://127.0.0.1/swagger.json'

WORKDIR /usr/share/nginx/html

RUN apk add --no-cache curl \
    && curl -sL https://github.com/swagger-api/swagger-ui/archive/v$SWAGGER_UI_VERSION.tar.gz | tar xz \
    && cp -r swagger-ui-$SWAGGER_UI_VERSION/dist/* . \
    && rm -rf swagger-ui-$SWAGGER_UI_VERSION

COPY ./replace.sh /usr/share/nginx/html/replace.sh

ENTRYPOINT ./replace.sh && nginx -g 'daemon off;'