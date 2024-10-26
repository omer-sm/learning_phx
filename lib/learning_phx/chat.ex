defmodule LearningPhx.Chat do
  @moduledoc """
  The Chat context.
  """

  import Ecto.Query, warn: false
  alias LearningPhx.Repo

  alias LearningPhx.Chat.Msg

  @doc """
  Returns the list of msgs.

  ## Examples

      iex> list_msgs()
      [%Msg{}, ...]

  """
  def list_msgs do
    Repo.all(Msg)
  end

  @doc """
  Gets a single msg.

  Raises `Ecto.NoResultsError` if the Msg does not exist.

  ## Examples

      iex> get_msg!(123)
      %Msg{}

      iex> get_msg!(456)
      ** (Ecto.NoResultsError)

  """
  def get_msg!(id), do: Repo.get!(Msg, id)

  @doc """
  Creates a msg.

  ## Examples

      iex> create_msg(%{field: value})
      {:ok, %Msg{}}

      iex> create_msg(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_msg(attrs \\ %{}) do
    %Msg{}
    |> Msg.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a msg.

  ## Examples

      iex> update_msg(msg, %{field: new_value})
      {:ok, %Msg{}}

      iex> update_msg(msg, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_msg(%Msg{} = msg, attrs) do
    msg
    |> Msg.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a msg.

  ## Examples

      iex> delete_msg(msg)
      {:ok, %Msg{}}

      iex> delete_msg(msg)
      {:error, %Ecto.Changeset{}}

  """
  def delete_msg(%Msg{} = msg) do
    Repo.delete(msg)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking msg changes.

  ## Examples

      iex> change_msg(msg)
      %Ecto.Changeset{data: %Msg{}}

  """
  def change_msg(%Msg{} = msg, attrs \\ %{}) do
    Msg.changeset(msg, attrs)
  end
end
