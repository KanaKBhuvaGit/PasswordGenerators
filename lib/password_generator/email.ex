defmodule PasswordGenerator.Email do
  use Bamboo.Phoenix, view: PasswordGeneratorWeb.EmailView

  # Set a new email with the default options and layout
  # Returns Bamboo.Email
  # defp base_email do
  #   new_email()
  #   ## |> bcc("sean.crosier@homepie.com")
  #   |> from("Homepie <noreply@#{Application.get_env(:homepie, :access_domain_name)}>")
  #   |> subject("Homepie Notifications")
  #   |> put_html_layout({HomepieWeb.LayoutView, "email.html"})
  # end

  # Adds a category attribute to the email object.
  # defp category(email, category) when is_atom(category) do
  #   email
  #   |> Map.merge(%{category: category})
  # end

  defp base_email() do
    new_email()
    |> from("test@gmail.com")
    |> put_html_layout({PasswordGeneratorWeb.LayoutView, "email.html"})
  end

  def welcome_email(client) do
    base_email()
    |> to(client)
    |> subject("Kanak - Welcome to MyApp")
    # |> put_html_layout({PasswordGeneratorWeb.LayoutView, "email.html"})
    |> assign(:client, client)
    |> render("welcome_new_client.html")
  end
end
