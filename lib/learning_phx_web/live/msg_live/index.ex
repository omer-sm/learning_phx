defmodule LearningPhxWeb.MsgLive.Index do
  use LearningPhxWeb, :live_view

  alias LearningPhx.Chat
  alias LearningPhx.Chat.Msg

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :msgs, Chat.list_msgs())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Msg")
    |> assign(:msg, Chat.get_msg!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Msg")
    |> assign(:msg, %Msg{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Msgs")
    |> assign(:msg, nil)
  end

  @impl true
  def handle_info({LearningPhxWeb.MsgLive.FormComponent, {:saved, msg}}, socket) do
    {:noreply, stream_insert(socket, :msgs, msg)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    msg = Chat.get_msg!(id)
    {:ok, _} = Chat.delete_msg(msg)

    {:noreply, stream_delete(socket, :msgs, msg)}
  end
end
