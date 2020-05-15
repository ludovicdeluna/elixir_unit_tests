defmodule ElixirUnitTests.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      ElixirUnitTests.Repo
      # Starts a worker by calling: ElixirUnitTests.Worker.start_link(arg)
      # {ElixirUnitTests.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ElixirUnitTests.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
