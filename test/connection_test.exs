defmodule Test.ConnectionTest do
  use Test.DataCase, async: true

  alias Test.{Repo, Posts}

  @moduletag timeout: 1000

  test "connection problem" do
    owner = self()

    child =
      spawn(fn ->
        Ecto.Adapters.SQL.Sandbox.allow(Repo, owner, self())
        Ecto.Adapters.SQL.query!(Repo, "SELECT pg_sleep(100)", [])
      end)

    Process.sleep(10)
    Process.exit(child, :kill)

    IO.inspect(Posts.list_posts())
  end
end
