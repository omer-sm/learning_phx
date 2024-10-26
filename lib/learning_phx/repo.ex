defmodule LearningPhx.Repo do
  use Ecto.Repo,
    otp_app: :learning_phx,
    adapter: Ecto.Adapters.Postgres
end
