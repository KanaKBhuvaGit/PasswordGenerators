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

  def handle_event("up_arrow", %{"key" => "ArrowUp"}, socket) do
    socket =
      socket
      |> assign(temperature: 8)

    {:noreply, socket}
  end

  def handle_event("down_arrow", %{"key" => "ArrowDown"}, socket) do
    socket =
      socket
      |> assign(temperature: 2)

    {:noreply, socket}
  end

  def handle_event("left_arrow", %{"key" => "ArrowLeft"}, socket) do
    socket =
      socket
      |> assign(temperature: 6)

    {:noreply, socket}
  end

  def handle_event("right_arrow", %{"key" => "ArrowRight"}, socket) do
    socket =
      socket
      |> assign(temperature: 4)

    {:noreply, socket}
  end

  def handle_event("live_disconnected", _, socket) do
    Logger.info("Live disconnecteddddddddddddddddddd")
    # socket =
    #   socket
    #   |> assign(temperature: 4)

    {:noreply, socket}
  end

  def handle_event("live_connected", _, socket) do
    Logger.info("Live connecteddddddddddddddddddd")
    # socket =
    #   socket
    #   |> assign(temperature: 4)

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
      <%!-- <div class="container"
        phx-window-focus="page-active"
        phx-window-blur="page-inactive"
        phx-value-page="123"
        tabindex="2">
        To detect when the page itself has received focus or blur, phx-window-focus and phx-window-blur may be specified. These window level events may also be necessary if the element in consideration (most often a div with no tabindex) cannot receive focus.
      </div> --%>
      <br/>
      <div id="thermostat1" >
        <h2 phx-window-keyup="up_arrow" phx-key="ArrowUp">Up Arrow: <%= @temperature %></h2>
        <%!-- <h2 tabindex="0" phx-keyup="left_arrow" phx-key="ArrowLeft">Left Arrow: <%= @temperature %></h2> --%>
      </div>
      <div id="thermostat">
        <h2  phx-window-keydown="down_arrow" phx-key="ArrowDown">Down Arrow: <%= @temperature %></h2>
        <%!-- <h2  phx-keydown="right_arrow" phx-key="ArrowRight">Right Arrow: <%= @temperature %></h2> --%>
      </div>
    
      <div>
        <input type="text" name="user[phone_number]" id="user-phone-number" phx-hook="PhoneNumber" />
      </div>
    """
  end
end
