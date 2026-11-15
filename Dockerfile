FROM ruby:2.5.1

RUN sed -i -e 's/deb.debian.org/archive.debian.org/g' \
           -e 's/security.debian.org/archive.debian.org/g' \
           -e '/stretch-updates/d' /etc/apt/sources.list

# --allow-unauthenticated を追加して署名切れのエラーを回避
RUN apt-get update -qq && apt-get install -y --allow-unauthenticated \
    build-essential \
    libpq-dev \
    nodejs \
    postgresql-client

WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install

COPY . /app