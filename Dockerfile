ARG RUBY_VERSION=2.4.6
FROM ruby:${RUBY_VERSION}

LABEL maintainer="10peso <org10peso@gmail.com>"

# Important! Update this no-op ENV variable when this Dockerfile
# is updated with the current date. Used for force refresh.
ENV REFRESHED_AT=2019-12-20 \
    CHROME_VERSION=79.0.3945.88-1

# Install Chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -  \
 && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list \
 && apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y --no-install-recommends install google-chrome-stable=$CHROME_VERSION \
 && rm -rf /var/lib/apt/lists/*
