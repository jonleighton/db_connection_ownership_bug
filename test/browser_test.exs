defmodule TestWeb.BrowserTest do
  use ExUnit.Case, async: true
  use Wallaby.Feature

  feature "disconnection", %{session: session} do
    visit(session, "/?async_sleep=1000")
    Process.sleep(100)

    session
    |> visit("/")
    |> assert_has(Query.text("Phoenix"))
  end
end
