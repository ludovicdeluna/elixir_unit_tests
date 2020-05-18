import Config

import_config "#{Mix.env()}.exs"
config :elixir_unit_tests, ecto_repos: [ElixirUnitTests.Repo]
