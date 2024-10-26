defmodule LearningPhx.ChatFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `LearningPhx.Chat` context.
  """

  @doc """
  Generate a msg.
  """
  def msg_fixture(attrs \\ %{}) do
    {:ok, msg} =
      attrs
      |> Enum.into(%{
        content: "some content",
        sender: "some sender"
      })
      |> LearningPhx.Chat.create_msg()

    msg
  end
end
