FROM ruby:3.1.2

WORKDIR /ecokakeibo
COPY . /ecokakeibo

RUN apt-get update -qq && apt-get install -y nodejs
RUN bundle install
