# ElixirUnitTests

## Requirements

- Elixir (1.10)
- Postgresql (with a database up)

or

- Docker (see Docker section)

## Installation

Go directly to the next section if you run within a Docker image.

For a fresh installation, we need rebar and hex. If not already done, run
the commands bellow once:

```shell
mix local.rebar
mix local.hex --force
```

Configure your database and check it is up and accessible. Report the
settings in the file bellow:

- config/config.exs

Details required are `username`, `password` and `hostname`. If you run
an unusual port, add `port` entry.

## Get dependancies

You have to get dependencies the first time you play.

```
mix deps
mix deps.compile
```

## Database setup

Create the DB schema:

```
mix ecto.create
```

Run the migration once:

```
mix ecto.migrate
```

Info: use `ecto.drop` to remove the schema created when you have finished to
play.

## Docker

If your operating system is Windows or MacOS, be sure you have switched the
Docker to Linux mode (within a virtual machine). The image provided is Linux
only.

To run the image, you have the choose between docker-compose or plain docker
commands.

With docker-compose, run the commands bellow:

```
docker-compose build
docker-compose run --rm app
```

Or with plain docker commands:

```
docker build -t elixir_unit_tests_app:latest .

docker run -it \
  --name elixir_unit_tests \
  --rm \
  --volume $(pwd):/app \
  elixir_unit_tests_app
```

When done, you see this last lines on your screen:

```
server started
/app #
```

You are now ready to follow the blog post. To quit the shell, type `exit` or
`\d`.
