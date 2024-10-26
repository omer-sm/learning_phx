defmodule LearningPhxWeb.LvTextComp do
  use LearningPhxWeb, :live_component

  def render(assigns) do
    ~H"""
    <div>
      <br>
      <h1 class="text-bold font-serif italic text-blue-600 text-xl">you typed: <%= @mytext %></h1>
      <.form for={@form}  phx-change="do_input" phx-target={@myself}>
        <.input type="text" class="rounded-md focus:border-blue-700
        font-sans placeholder-gray-500 text-lg bg-gray-100" placeholder="type.."
        field={@form[:mytext]}/>
      </.form>
    </div>
    """
  end

  def handle_event("do_input", %{"mytext" => val}, socket) do
    IO.inspect(socket)
    {:noreply, assign(socket, :mytext, val)}
  end
end
