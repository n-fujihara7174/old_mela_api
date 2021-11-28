FROM ruby:3.0.2-alpine3.14

ENV HOME="/api" \
    LANG=C.UTF-8 \
    TZ=Asia/Tokyo

RUN mkdir ${HOME}
WORKDIR ${HOME}

COPY ./Gemfile* ${HOME}

RUN apk update && \
    apk upgrade && \
    apk add --no-cache linux-headers libxml2-dev make yarn gcc g++ libc-dev nodejs tzdata postgresql-dev postgresql git && \
    apk add --virtual build-dependencies --no-cache build-base curl-dev && \
    bundle install -j4 && \
    apk del build-dependencies

COPY . ${HOME}

CMD ["rails", "server", "-b", "0.0.0.0"]