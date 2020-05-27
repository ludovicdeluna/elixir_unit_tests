# Material for Synbioz blog post on Elixir tests

Welcome on this Github repository. Chance are you've been coming from the
[Synbioz blog post on tests with Elixir][blog] (french version).

This project is an example of Elixir tests driven by tags. You can
directly watch the file [test/elixir_unit_tests_test.exs][testfile].

Want to play with the project ? Follow the guide.

## Requirements

You can use your current setup with Elixir or choose a Docker image, choice is
yours:

To try the project on your system, you must have:

- Elixir (1.10)
- Postgresql (with a database up)

Or you can experiment through a Docker image containing the above requirements.
We will see how a little further. Be sure to have Docker on your system.

> Installation of [Elixir] or [Docker] is out of the scope for this Readme.

## Get the project's files on your computer

Download [the zip file][zip] of this project or use Git to clone the repository:

```shell
git clone https://github.com/ludovicdeluna/elixir_unit_tests.git
cd elixir_unit_tests
```

## Prepare your system

Skip this section if you use the [Docker image](#docker) - all the requirements
are already in the image.

The instructions target a Unix compliant system (Linux / BSD or MacOS).

First, get the generic dependencies bellow. If you use the Phoenix framework or
Ecto, it's possible you already have them on your computer.

```shell
mix local.rebar
mix local.hex --force
```

Second, set your Mix env to `test`:

```shell
export MIX_ENV=test
```

Finally, configure the `config/test.exs` file to let the project contact your
Postgresql database, especially the fields `username`, `password` and
`hostname`. If your database use an unusual port, add `port` entry.

Congratulations, you are now ready for the next part.

## Get dependancies

You have to get the dependencies the first time you play:

```shell
# (from the root project)
mix deps.get
```

## Run the test

This project is configured to automatically prepare your database and apply
schema migrations before the tests run:

```shell
# (from the root project)
mix test
```

> It's your first try with Elixir ? The code is firstly compiled to bytecode for
> the BEAM VM then the VM execute the program. Compilation occurs every time the
> source code change.

Nothing more for now. The file mentioned in the blog post is
[test/elixir_unit_tests_test.exs][testfile]. Don't hesitate to experiment.

Have a fun !

## Docker

This part explain you how to build and start a Docker image with all the
requirement inside it. Before start, check that your Docker client use the Linux
mode by default for your images. This is the case if you have never changed your
settings.

The build process use Linux Alpine with Elixir 1.10 and Postgresql. The build
do the following actions:

- run the PG scripts to setup a default database;
- get the default dependencies for Elixir;
- add the MIX_ENV to `test`.
- set the default action to start Posgresql and open an interactive shell.

The final image size is 148Mb (nammed _elixir_unit_tests_app_).

You can build the image and run the container with Docker Compose or with plain
Docker's commands.

Method 1 - with docker-compose:

```
docker-compose build
docker-compose run --rm app
```

Method 2 - plain docker commands:

```
docker build -t elixir_unit_tests_app:latest .

docker run -it \
  --name elixir_unit_tests \
  --rm \
  --volume $(pwd):/app \
  elixir_unit_tests_app
```

For the two methods, you will see this last lines on your screen:

```
server started
/app #
```

Your are now ready for [the next step](#get-dependancies). Type `exit` if you
want to quit the container.

[Elixir]: https://elixir-lang.org/install.html
[Docker]: https://docs.docker.com/develop/
[blog]: https://www.synbioz.com
[testfile]: https://github.com/ludovicdeluna/elixir_unit_tests/blob/master/test/elixir_unit_tests_test.exs
[zip]: https://github.com/ludovicdeluna/elixir_unit_tests/archive/master.zip
