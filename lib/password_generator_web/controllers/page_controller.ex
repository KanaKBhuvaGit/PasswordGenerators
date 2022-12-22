defmodule PasswordGeneratorWeb.PageController do
  use PasswordGeneratorWeb, :controller

  def index(conn, _params, password_length) do
    conn
    |> assign(:password_length, password_length)
    |> assign(:password, "")
    |> render("index.html")
  end

  def generate(conn, %{"password" => password_params}, password_length) do
    {:ok, password} = PassGenerator.generate(password_params)

    conn
    |> assign(:password_length, password_length)
    |> assign(:password, password)
    |> render("index.html")
  end

  def action(conn, _) do
    password_length = [
      Weak: Enum.map(6..15, & &1),
      Strong: Enum.map(16..88, & &1),
      Unbelievable: [100, 150]
    ]

    args = [conn, conn.params, password_length]
    apply(__MODULE__, action_name(conn), args)
  end
end
