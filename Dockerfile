FROM elixir:1.10.3-alpine

RUN apk update && \
    apk add postgresql && \
    su - postgres -c "initdb /var/lib/postgresql/data" && \
    mkdir -p /var/run/postgresql && chown -R postgres /var/run/postgresql && \
    mix local.rebar && \
    mix local.hex --force


WORKDIR /app
ENTRYPOINT su - postgres -c "pg_ctl start -D /var/lib/postgresql/data" && /bin/sh

ENV MIX_ENV test
