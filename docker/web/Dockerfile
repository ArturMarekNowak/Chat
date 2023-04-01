FROM hexpm/elixir:1.14.2-erlang-25.0.4-debian-bullseye-20220801-slim

RUN apt-get update
RUN apt-get install --yes build-essential inotify-tools

# Set working directory
RUN mkdir -p /app
WORKDIR /app

# Install hex, rebar, and phx_new
RUN mix local.hex --force && \
  mix local.rebar --force && \
  mix archive.install --force hex phx_new

# Copy and install the elixir deps
COPY mix.exs .
COPY mix.lock .
RUN mix deps.get && mix deps.compile

# Install nodejs
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - &&\
      apt-get install --yes nodejs \ 
      npm

RUN apt-get install -y curl

# Copy and install the nodejs deps
COPY assets ./assets
WORKDIR /app/assets
RUN npm install
WORKDIR /app

# Copy over compiled files
COPY config ./config
COPY lib ./lib
COPY priv ./priv
COPY assets/static/images /app/priv/static/images

# Compile the app
RUN mix compile

EXPOSE 4000

# Set the run command
CMD ["mix", "phx.server"]