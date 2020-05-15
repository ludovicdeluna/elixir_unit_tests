import Config

config :elixir_unit_tests, ElixirUnitTests.Repo,
  database: "elixir_unit_tests_repo",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"

config :elixir_unit_tests, ecto_repos: [ElixirUnitTests.Repo]
