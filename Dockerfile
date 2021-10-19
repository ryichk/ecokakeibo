FROM ruby:3.0.2

WORKDIR /ecokakeibo
COPY . /ecokakeibo

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update -qq \
  && apt-get install -y build-essential \
  libpq-dev \
  nodejs \
  yarn \
  && bundle install
