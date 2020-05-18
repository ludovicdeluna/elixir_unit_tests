defmodule ElixirUnitTests do
  @moduledoc """
  Documentation for `ElixirUnitTests`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> ElixirUnitTests.hello(%{1 => %ElixirUnitTests.User{name: "Alan"}}, 1)
      "Hello Alan !"

  """
  def hello(users, id) when id == 1000 do
    "Hello #{users[id].name} ! Congratulations !"
  end

  def hello(users, id) do
    "Hello #{users[id].name} !"
  end
end
