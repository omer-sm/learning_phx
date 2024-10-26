defmodule LearningPhx.BoardFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `LearningPhx.Board` context.
  """

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        content: "some content",
        title: "some title"
      })
      |> LearningPhx.Board.create_post()

    post
  end
end
