defmodule LearningPhx.Repo.Migrations.CreateMsgs do
  use Ecto.Migration

  def change do
    create table(:msgs) do
      add :content, :string
      add :sender, :string

      timestamps(type: :utc_datetime)
    end
  end
end
