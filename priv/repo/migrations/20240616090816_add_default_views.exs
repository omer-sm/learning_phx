defmodule LearningPhx.Repo.Migrations.AddDefaultViews do
  use Ecto.Migration

  def change do
    alter table(:posts) do
      modify :views, :integer, default: 0
    end
  end
end
