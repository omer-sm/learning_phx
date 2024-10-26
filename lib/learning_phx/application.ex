defmodule LearningPhx.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      LearningPhxWeb.Telemetry,
      LearningPhx.Repo,
      {DNSCluster, query: Application.get_env(:learning_phx, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: LearningPhx.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: LearningPhx.Finch},
      # Start a worker by calling: LearningPhx.Worker.start_link(arg)
      # {LearningPhx.Worker, arg},
      # Start to serve requests, typically the last entry
      LearningPhxWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LearningPhx.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    LearningPhxWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
