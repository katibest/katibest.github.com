defmodule KatiPortfolio.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      KatiPortfolioWeb.Telemetry,
      KatiPortfolio.Repo,
      {DNSCluster, query: Application.get_env(:kati_portfolio, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: KatiPortfolio.PubSub},
      # Start a worker by calling: KatiPortfolio.Worker.start_link(arg)
      # {KatiPortfolio.Worker, arg},
      # Start to serve requests, typically the last entry
      KatiPortfolioWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: KatiPortfolio.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    KatiPortfolioWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
