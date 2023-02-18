defmodule PasswordGeneratorWeb.Live do
  use PasswordGeneratorWeb, :live_view
  require Logger
  alias Phoenix.LiveView.JS

  def mount(_params, _session, socket) do
    {:ok, assign(socket, %{val: 0, name: "", temperature: 0})}
  end

  def handle_event("inc", values, socket) do
    socket =
      socket
      |> assign(val: socket.assigns.val + 1)
      |> assign(name: values["name"])

    {:noreply, socket}
  end

  def handle_event("dec", _, socket) do
    {:noreply, update(socket, :val, &(&1 - 1))}
  end

  def handle_event("name", values, socket) do
    {:noreply, update(socket, :name, fn _ -> values["name"] end)}
  end

  def handle_event("reset", _, socket) do
    socket =
      socket
      |> assign(val: 0)
      |> assign(name: "")

    {:noreply, socket}
  end

  def handle_event("myfocus", _, socket) do
    Logger.info("Focussssssss")
    {:noreply, socket}
  end

  def handle_event("myblur", _, socket) do
    Logger.info("Blurrrrrrrrrrrrrr")
    {:noreply, socket}
  end

  # def handle_event("page-active", values, socket) do
  #   Logger.info("page-activeeeeeeeeeeeeeeeeeeeeeeeee")
  #   Logger.info(values["page"])
  #   {:noreply, socket}
  # end

  # def handle_event("page-inactive", values, socket) do
  #   Logger.info("page-inactiveeeeeeeeeeeeee")
  #   Logger.info(values["page"])
  #   {:noreply, socket}
  # end

  def handle_event("update_temp", %{"key" => "ArrowUp"}, socket) do
    socket =
      socket
      |> assign(temperature: 1)

    {:noreply, socket}
  end

  def handle_event("reset_temp", %{"key" => "ArrowDown"}, socket) do
    socket =
      socket
      |> assign(temperature: 5)

    {:noreply, socket}
  end

  def render(assigns) do
    ~H"""
      <div>
        <h1 class="text-4xl font-bold text-center"> Live view practise</h1>
        <h2 class="text-4xl font-bold text-center"> The count is: <%= @val %> </h2>
        <h2 class="text-4xl font-bold text-center"> My name is: <%= @name %> </h2>
    
        <p class="text-center" phx-click-away="reset">
          <input name="email" phx-focus="myfocus" phx-blur="myblur"/>
          <button phx-click="dec">-</button>
          <button phx-click={JS.push("inc", value: %{name: "Kano"})}>+</button>
          <button phx-click="name" phx-value-name="Kanak", phx-value-surname="Bhuva", value="knk">Name?</button>
        </p>
      </div>
      <div class="container"
        phx-window-focus="page-active"
        phx-window-blur="page-inactive"
        phx-value-page="123"
        tabindex="2">
        To detect when the page itself has received focus or blur, phx-window-focus and phx-window-blur may be specified. These window level events may also be necessary if the element in consideration (most often a div with no tabindex) cannot receive focus.
      </div>
      <br/><br/><br/>
      <div id="thermostat1" phx-window-keyup="update_temp">
        <h2>Current temperature: <%= @temperature %></h2>
      </div>
      <%!-- <div id="thermostat" phx-window-keydown="reset_temp">
        <h2>Current temperature: <%= @temperature %></h2>
      </div> --%>
      <input value={@password}/>
      <.form let={f} for={:password} phx-change="validate" phx-submit="save">
    
        <%= label f, :username %>
        <%= text_input f, :username %>
        <%= error_tag f, :username %>
    
        <%= label f, :email %>
        <%= text_input f, :email %>
        <%= error_tag f, :email %>
    
        <%= submit "Save" %>
      </.form>
    """
  end
end
