FROM ruby:3.2.2-alpine3.17

RUN apk add --update --no-cache \
  build-base \
  shared-mime-info \
  postgresql-dev \
  tzdata \
  bash \
  nodejs-current

RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
COPY . /myapp

EXPOSE 3000
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
