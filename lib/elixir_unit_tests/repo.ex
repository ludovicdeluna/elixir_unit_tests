defmodule ElixirUnitTests.Repo do
  use Ecto.Repo,
    otp_app: :elixir_unit_tests,
    adapter: Ecto.Adapters.Postgres
end
