defmodule LearningPhxWeb.LvCompTst do
  use LearningPhxWeb, :live_component

  def render(assigns) do
    ~H"""
    <div>
      <h3>Hello I am a live component</h3>
      <p>This is my content: <%= @val %></p>
      <button id="comp" phx-click="inc_val" phx-target="#comp">+</button>
    </div>
    """
  end

  def update_many(assigns_sockets) do
    IO.puts "HI IM UPDATE MANY"
    assigns_sockets
    |> Enum.map(fn {assigns, socket} ->
      assign(socket, :val, assigns.val + 1)
    end)

  end

  def handle_event("inc_val", _params, socket) do
    IO.puts "calling inc val"
    {:noreply, update(socket, :val, &(&1 + 1))}
  end
end
