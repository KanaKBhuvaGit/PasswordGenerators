defmodule PasswordGeneratorWeb.PageControllerTest do
  use PasswordGeneratorWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Password Generator"
  end
end
