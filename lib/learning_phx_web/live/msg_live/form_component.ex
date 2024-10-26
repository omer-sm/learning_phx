defmodule LearningPhxWeb.MsgLive.FormComponent do
  use LearningPhxWeb, :live_component

  alias LearningPhx.Chat

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage msg records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="msg-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:content]} type="text" label="Content" />
        <.input field={@form[:sender]} type="text" label="Sender" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Msg</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{msg: msg} = assigns, socket) do
    changeset = Chat.change_msg(msg)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"msg" => msg_params}, socket) do
    changeset =
      socket.assigns.msg
      |> Chat.change_msg(msg_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"msg" => msg_params}, socket) do
    save_msg(socket, socket.assigns.action, msg_params)
  end

  defp save_msg(socket, :edit, msg_params) do
    case Chat.update_msg(socket.assigns.msg, msg_params) do
      {:ok, msg} ->
        notify_parent({:saved, msg})

        {:noreply,
         socket
         |> put_flash(:info, "Msg updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_msg(socket, :new, msg_params) do
    case Chat.create_msg(msg_params) do
      {:ok, msg} ->
        notify_parent({:saved, msg})

        {:noreply,
         socket
         |> put_flash(:info, "Msg created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp assign_form(socket, %Ecto.Changeset{} = changeset) do
    assign(socket, :form, to_form(changeset))
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
