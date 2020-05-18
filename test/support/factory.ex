defmodule ElixirUnitTests.Factory do
  alias ElixirUnitTests.Repo

  def build(:user) do
    %ElixirUnitTests.User{regnum: 1, name: "Alan", city: "NY"}
  end

  def build(factory_name, attributes) do
    factory_name |> build() |> struct(attributes)
  end

  def insert!(factory_name, attributes \\ []) do
    Repo.insert!(build(factory_name, attributes))
  end
end
