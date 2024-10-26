defmodule LearningPhx.Chat.Msg do
  use Ecto.Schema
  import Ecto.Changeset

  schema "msgs" do
    field :content, :string
    field :sender, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(msg, attrs) do
    msg
    |> cast(attrs, [:content, :sender])
    |> validate_required([:content, :sender])
  end
end
