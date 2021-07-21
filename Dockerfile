FROM ruby:2.3.1

WORKDIR /ecokakeibo
COPY . /ecokakeibo
RUN apt-get update -qq \
    && apt-get install -y build-essential libpq-dev imagemagick nodejs \
    && bundle install
