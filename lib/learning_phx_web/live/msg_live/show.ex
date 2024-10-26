defmodule LearningPhxWeb.MsgLive.Show do
  use LearningPhxWeb, :live_view

  alias LearningPhx.Chat

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:msg, Chat.get_msg!(id))}
  end

  defp page_title(:show), do: "Show Msg"
  defp page_title(:edit), do: "Edit Msg"
end
