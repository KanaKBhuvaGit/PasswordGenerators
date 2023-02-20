defmodule PasswordGeneratorWeb.Form do
  use PasswordGeneratorWeb, :live_view
  require Logger

  def mount(_params, _session, socket) do
    {:ok, assign(socket, %{username: "", email: "", trigger_submit: false})}
  end

  def handle_event("save", %{"password" => params}, socket) do
    # Logger.info(params)

    socket =
      socket
      |> assign(username: params["username"])
      |> assign(email: params["email"])
      |> assign(trigger_submit: false)

    {:noreply, socket}
  end

  def handle_event("validate", %{"password" => params}, socket) do
    # Logger.info(params["username"])

    socket =
      socket
      |> assign(username: params["username"])

    {:noreply, socket}
  end

  def handle_event("recover_wizard", _, socket) do
    # Logger.info(params["username"])

    socket =
      socket
      |> assign(username: "recover_wizard")

    {:noreply, socket}
  end

  # def handle_event("myfocus", _, socket) do
  #   Logger.info("myfocus")
  #   {:noreply, socket}
  # end

  # def handle_event("myfocus1", _, socket) do
  #   Logger.info("myfocus11111111111111111111")
  #   {:noreply, socket}
  # end

  # def handle_event("volume_up", _, socket) do
  #   Logger.info("volume_upppppppppppppppppppp")
  #   {:noreply, socket}
  # end

  def render(assigns) do
    ~H"""
      <h1>Live foirm practises</h1>
      <%!-- <.form let={f} for={:password} phx-change="validate" phx-submit="save"> --%>
      <%!-- <.form let={f} for={:password} phx-submit="save"> --%>
      <.form let={f} for={:password}
        action={Routes.page_path(@socket, :generate)}
        phx-submit="save"
        phx-trigger-action={@trigger_submit}
        phx-auto-recover="recover_wizard">
    
        <%= label f, :username %>
        <%!-- <%= text_input f, :username, phx_change: "validate", phx_debounce: "blur"%>
        <%= text_input f, :username, phx_change: "validate", phx_debounce: "3000"%>
        <%= text_input f, :username, phx_change: "validate", phx_target: @username%> --%>
        <%!-- <%= text_input f, :username, phx_change: "validate", phx_throttle: "3000"%> --%>
        <%= text_input f, :username %>
        <%= error_tag f, :username %>
    
        <%= label f, :email %>
        <%= text_input f, :email, required: true %>
        <%= error_tag f, :email %>
    
        <%= submit "Save", phx_disable_with: "Saving ..."%>
      </.form>
    
      <div><span>email: <%= @email %></span></div>
    
      <div><span>Username: <%= @username %></span></div>
    """
  end
end
