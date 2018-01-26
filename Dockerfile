FROM alpine:3.4
MAINTAINER Robert Mitchell <robert.mitchell@vualto.com>

RUN apk update && \
    apk upgrade && \
    apk add bash curl-dev build-base && \
    apk add ruby && \
    apk add ruby-io-console && \
    apk add ruby-dev && \
    apk add ruby-bundler && \
    apk add ruby-bigdecimal && \
    rm -rf /var/cache/apk/* && \
    mkdir /app

WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN bundle install --without test development

COPY . /app

EXPOSE 9292

# CMD /deployment/rsyslog.sh

CMD bundle exec puma -b tcp://0.0.0.0:9292 -t 0:16 -w 2 api/config.ru