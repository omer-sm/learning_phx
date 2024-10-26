defmodule LearningPhx.Repo.Migrations.AddPostViews do
  use Ecto.Migration

  def change do
    alter table(:posts) do
      add :views, :integer
    end
  end
end
