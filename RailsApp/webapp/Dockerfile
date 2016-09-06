FROM ruby:2.3-slim
MAINTAINER Mauricio Barrera

RUN apt-get update && apt-get install -qq -y build-essential nodejs libpq-dev postgresql-client-9.4 --no-install-recommends

ENV INSTALL_PATH /webapp

RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY Gemfile Gemfile
RUN bundle install

COPY . .

RUN bundle exec rake RAILS_ENV=production DATABASE=postgresql://user:pass@localhost/

VOLUME ["$INSTALL_PATH/public"]

CMD bundle exec unicorn -c config/unicorn.rb
