defmodule TestWeb.PageController do
  use TestWeb, :controller

  alias Test.{Posts, Repo}

  def index(conn, %{"sleep" => sleep}) do
    Repo.transaction(fn ->
      sleep
      |> String.to_integer()
      |> Process.sleep()
    end)

    text(conn, "OK")
  end

  def index(conn, _params) do
    # Do some database work
    Posts.list_posts()

    render(conn, "index.html")
  end
end
