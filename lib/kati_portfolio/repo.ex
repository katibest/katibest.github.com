defmodule KatiPortfolio.Repo do
  use Ecto.Repo,
    otp_app: :kati_portfolio,
    adapter: Ecto.Adapters.Postgres
end
