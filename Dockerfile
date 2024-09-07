FROM ruby:3.2.0

WORKDIR /app

RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential libjemalloc2 libvips postgresql-client vim

COPY . .
