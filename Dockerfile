FROM ruby:3.0.4-alpine

LABEL maintainer="Reed <reedbshipley@gmail.com>"

RUN apk add --no-cache \
  build-base \
  libxml2-dev \
  libxslt-dev \
  sqlite-dev \
  openssl \
  sqlite \
    && rm -rf /var/cache/apk/*

RUN mkdir -p /app
WORKDIR /app

COPY Gemfile ./
RUN gem install bundler
RUN bundle lock --add-platform x86_64-linux
RUN bundle lock --add-platform ruby
RUN gem install sqlite
RUN bundle config build.nokogiri
RUN bundle install --jobs 20 --retry 5

COPY . ./

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]