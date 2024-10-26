defmodule LearningPhxWeb.LvComp2 do
  use LearningPhxWeb, :live_component

  def render(assigns) do
    ~H"""
    <div>
      <h1 class="text-3xl font-bold underline">
        Hello world! this is the val: <%= @val %>
      </h1>
      <button id="btn" phx-click="rand_val" class="font-sans text-2xl shadow" phx-target="#btn"> click me!!!!!!! </button>
      <button phx-click="inc_val" class="bg-red-600 text-yellow-200 font-sans text-l shadow"> inc val! </button>
    </div>
    """
  end

  def handle_event("rand_val", _params, socket) do
    {:noreply, update(socket, :val, &(:rand.uniform() + &1))}
  end
end
