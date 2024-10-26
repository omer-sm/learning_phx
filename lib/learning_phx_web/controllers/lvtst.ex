defmodule LearningPhxWeb.Lvtst do
  use LearningPhxWeb, :live_view

  def render(assigns) do
    ~H"""
    Current val: <%= @val %>
    <button phx-click="inc_val">+</button>
    <br>
    <.live_component module={LearningPhxWeb.LvCompTst} id={0} val={0} />
    <.live_component module={LearningPhxWeb.LvCompTst} id={1} val={1} />
    <.live_component module={LearningPhxWeb.LvComp2} id={2} val={0} />
    <.live_component module={LearningPhxWeb.LvTextComp} id={3} form={to_form(Map.new())} mytext="" />
    """
  end

  def mount(_params, _session, socket) do
    val = 0
    {:ok, assign(socket, :val, val)}
  end

  def handle_event("inc_val", _params, socket) do
    {:noreply, update(socket, :val, &(&1 + 1))}
  end
end
