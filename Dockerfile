ARG RUBY_VERSION

FROM ruby:$RUBY_VERSION

ARG NODE_VERSION

WORKDIR /railsapp

# install nodejs
RUN curl -fsSL https://deb.nodesource.com/setup_$NODE_VERSION.x | bash - && \
    apt-get install -y nodejs

# install yarn
RUN npm install -g yarn

RUN bundle config set --local path /bundle
