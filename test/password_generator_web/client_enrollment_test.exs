defmodule PasswordGeneratorWeb.ClientEnrollmentTest do
  use ExUnit.Case
  use Bamboo.Test
  @create_attrs %{email: "test@yopmail.com", name: "Test mail"}

  test "after enrolling a new client, the client gets a welcome email" do
    client = fixture(:client)
    expected_email = PasswordGeneratorWeb.Email.welcome_email(client)

    conn = post(conn, Routes.client_path(conn, :create), client: @create_attrs)

    assert_delivered_email(expected_email)
  end

  defp fixture(:client) do
    {:ok, client} = Agencies.create_client(@create_attrs)
    client
  end
end
