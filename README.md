# ElixirUnitTests

Hello. This Github repository contain material for a blog post about test unit
on Elixir. The final URL of the blog post will be shown bellow when ready.

## Requirements

- Git
- Elixir (1.10)
- Postgresql (with a database up)

or

- Git
- Docker (see Docker section)

This readme file will not show you how install [Elixir] or [Docker].

## Installation

All instructions are for Unix compliant system, including MacOS.

Step 1: Fetch this project, all commands are run within the project folder:

```shell
git clone https://github.com/ludovicdeluna/elixir_unit_tests.git
cd elixir_unit_tests
```

Step 2: Prepare your environment. Go directly to the next section (**[Get
dependencies](#get-dependancies)**) if you run within a [Docker image](#docker).

```shell
mix local.rebar
mix local.hex --force
```

Step 3: Configure your database. Details required are `username`, `password` and
`hostname`. If you run an unusual port, add `port` entry.

> The file to edit is: **config/test.exs**

Step 4: Set your runtime elixir for TEST purpose:

```shell
export MIX_ENV=test
```

Your are now ready for the next part.

## Get dependancies

You have to get dependencies the first time you play:

```
mix deps.get
```

## Run the test

This project is configured to launch db create & migrations before the test run:

```
mix test
```

> Code is compiled to bytecode for BEAM VM the first time and when the source
> code is changed.

The blog post is about the organisation of test explained in the file
[test/elixir_unit_tests_test.exs](test/elixir_unit_tests_test.exs) ; blog post
written in french for now.

## Docker

If your operating system is Windows or MacOS, be sure you have switched Docker
to use the Linux mode (within a virtual machine). The image provided is Linux
only. The image you will build contain an Alpine distribution of Elixir 1.10
with a functional Postgresql.

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

[Elixir]: https://elixir-lang.org/install.html
[Docker]: https://docs.docker.com/develop/
