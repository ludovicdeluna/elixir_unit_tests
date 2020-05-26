defmodule ElixirUnitTestsTest do
  use ExUnit.Case
  import ElixirUnitTests.Factory, only: [build: 2]

  # Check examples in the documentation of the module
  doctest ElixirUnitTests

  # Each test is sandboxed
  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(ElixirUnitTests.Repo)
  end

  describe "ElixirUnitTests.hello/2" do
    # Setup by calling functions before start each test
    setup [:load_fixtures]

    # Tests

    @tag user: %{name: "Baker"}
    @tag congratulate: false
    test "Simple hello with the name", %{users: users, id: id} = _context do
      assert "Hello Baker !" = ElixirUnitTests.hello(users, id)
    end

    @tag user: %{name: "Alan"}
    @tag congratulate: true
    test "Hello with congratulations", %{users: users, id: id} = _context do
      assert "Hello Alan ! Congratulations !" = ElixirUnitTests.hello(users, id)
    end

    # Helpers for ElixirUnitTests.hello/2

    defp load_fixtures(%{user: user, congratulate: true} = _context),
      do: build_users(user, 1000)

    defp load_fixtures(%{user: user} = _context),
      do: build_users(user, 1)

    def build_users(attributes, id) do
      [
        users: %{id => build(:user, put_in(attributes[:regnum], id))},
        id: id
      ]
    end
  end
end
