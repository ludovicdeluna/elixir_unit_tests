defmodule ElixirUnitTests.User do
  use Ecto.Schema

  schema "users" do
    field(:regnum, :integer)
    field(:name, :string)
    field(:city, :string)
    timestamps()
  end
end
