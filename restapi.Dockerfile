FROM ruby:3.2

# ENV SERVICE_APP_ENV='development' \
#  PORT=3000 \
#  SIDEKIQ_REDIS_URL='redis://127.0.0.1:6379/0'

# Install packages needed to build gems
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential git libpq-dev libvips pkg-config


# Install packages needed for deployment
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y postgresql-client && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

COPY Gemfile* /usr/src/app/
WORKDIR /usr/src/app

# ENV BUNDLE_PATH /gems

RUN bundle install

COPY . /usr/src/app/




ENTRYPOINT ["./bin/docker-entrypoint.sh"]

CMD ["bundle", "exec", "puma"]